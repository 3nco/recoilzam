-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Controllers.SpectateController
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Controllers
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local CollectionService = game:GetService("CollectionService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
game:GetService("ContextActionService");
local RunService = game:GetService("RunService");
local Players = game:GetService("Players");
local Teams = game:GetService("Teams");
local LocalPlayer = Players.LocalPlayer;
local workspace_CurrentCamera = workspace.CurrentCamera;
local InputBinds = ReplicatedStorage:WaitForChild("InputBinds");
local Game = ReplicatedStorage:WaitForChild("Game");
local OpIcons = Game:WaitForChild("OpIcons");
local WeaponIcons = Game:WaitForChild("WeaponIcons");
local u1 = require("./PlayerController");
local u2 = require("./MobileController");
local u3 = 1;
local u4 = nil;
local u5 = Vector3.new(70, 0, 0);
local u6 = {};
local v7 = {};

local function charVisible() -- Line: 29
    -- upvalues: Players (copy)
    for _, v in pairs(Players:GetPlayers()) do
        local Character = v.Character;

        if Character then
            for _, descendant in pairs(v.Character:GetDescendants()) do
                if descendant:IsA("BasePart") then
                    if descendant.Parent == Character and descendant.Name ~= "HumanoidRootPart" then
                        descendant.Transparency = 0;
                    elseif descendant.Parent:IsA("Hat") or descendant.Parent:IsA("Accessory") then
                        descendant.Transparency = 0;
                    end;
                end;
            end;
        end;
    end;
end;

local function updatechar(p8: userdata) -- Line: 51
    if not p8 then
        return;
    end;

    for _, descendant in pairs(p8:GetDescendants()) do
        if descendant:IsA("BasePart") then
            if descendant.Parent == p8 then
                if not (descendant.Name:match("Arm") or descendant.Name:match("Hand")) then
                    descendant.Transparency = 1;
                end;
            elseif descendant.Parent:IsA("Hat") or descendant.Parent:IsA("Accessory") then
                descendant.Transparency = 1;
            end;
        end;
    end;
end;

local function updateGui(p9: number) -- Line: 73
    -- upvalues: LocalPlayer (copy), u6 (ref), u3 (ref), OpIcons (copy), WeaponIcons (copy), CollectionService (copy)
    local GameGui = LocalPlayer.PlayerGui:FindFirstChild("GameGui");

    if not GameGui then
        return;
    end;

    GameGui.SpecMenu.Visible = true;
    GameGui.SpecMenu.SpecInfo.Visible = u6[u3] and true or false;
    local v10 = u6[u3];

    if not v10 then
        return;
    end;

    local playerStats = v10:FindFirstChild("playerStats");

    if not playerStats then
        return;
    end;

    local Operator = playerStats:FindFirstChild("Operator");

    if not Operator then
        return;
    end;

    local v11 = Operator.Value and OpIcons:FindFirstChild(Operator.Value);
    GameGui.SpecMenu.SpecInfo.playerName.Text = v10.DisplayName;
    GameGui.SpecMenu.SpecInfo.OpIcon.Image = v11 and v11.Texture or "";
    local Character = u6[u3].Character;

    if not Character then
        return;
    end;

    local Humanoid = Character:FindFirstChild("Humanoid");
    local ClientConfig = Character:FindFirstChild("ClientConfig");
    GameGui.SpecMenu.Crosshair.Visible = Humanoid;
    GameGui.SpecMenu.SpecInfo.Health.Visible = Humanoid;
    local Defuser = GameGui.SpecMenu.SpecInfo.Defuser;
    local v12;

    if ClientConfig then
        v12 = ClientConfig:GetAttribute("Defuser");
    else
        v12 = ClientConfig;
    end;

    Defuser.Visible = v12;
    local v13 = ClientConfig and (ClientConfig:GetAttribute("GadgetName") or "") or "";
    local v14 = ClientConfig and (ClientConfig:GetAttribute("UtilityName") or "") or "";
    local v15 = WeaponIcons:FindFirstChild(v13);
    local v16 = WeaponIcons:FindFirstChild(v14);
    GameGui.SpecMenu.SpecInfo.Gad.Image = v15 and v15.ColorMap or "";
    GameGui.SpecMenu.SpecInfo.Util.Image = v16 and v16.ColorMap or "";
    GameGui.SpecMenu.SpecInfo.Gad.Ammo.Text = ClientConfig and (ClientConfig:GetAttribute("GadgetAmmo") or "0") or "0";
    GameGui.SpecMenu.SpecInfo.Util.Ammo.Text = ClientConfig and ClientConfig:GetAttribute("UtilityAmmo") or "0";
    GameGui.SpecMenu.SpecInfo.Gad.Visible = v13 ~= "";
    GameGui.SpecMenu.SpecInfo.Util.Visible = v14 ~= "";

    if not Humanoid then
        return;
    end;

    local math_clamp_ret = math.clamp(Humanoid.Health / Humanoid.MaxHealth, 0, 1);
    GameGui.SpecMenu.SpecInfo.Health.Bar.Size = UDim2.new(math_clamp_ret, 0, 1, 0);
    GameGui.SpecMenu.SpecInfo.Health.Red.Size = GameGui.SpecMenu.SpecInfo.Health.Red.Size:Lerp(UDim2.new(math_clamp_ret, 0, 1, 0), p9);
    GameGui.SpecMenu.SpecInfo.Health.HealthText.Text = math.ceil(Humanoid.Health);
    GameGui.SpecMenu.SpecInfo.Health.ArmorLabel.Visible = CollectionService:HasTag(Humanoid.Parent, "Armor");
end;

local function UpdateSpecList() -- Line: 129
    -- upvalues: u6 (ref), Players (copy), LocalPlayer (copy), Teams (copy)
    u6 = {};

    for _, v in pairs(Players:GetPlayers()) do
        if LocalPlayer ~= v then
            local Character = v.Character;

            if Character then
                local Humanoid = Character:FindFirstChild("Humanoid");

                if Humanoid and Humanoid.Health > 0 then
                    if LocalPlayer.Team == Teams.Spec then
                        table.insert(u6, v);
                    elseif LocalPlayer.Team == v.Team then
                        table.insert(u6, v);
                    end;
                end;
            end;
        end;
    end;
end;

local function NextSpec() -- Line: 151
    -- upvalues: UpdateSpecList (copy), u6 (ref), u3 (ref), u4 (ref), workspace_CurrentCamera (copy), charVisible (copy)
    UpdateSpecList();

    if #u6 <= 0 then
        return;
    end;

    local v17 = nil;

    while true do
        if u3 + 1 > #u6 then
            u3 = 1;
            break;
        end;

        u3 = math.min(u3 + 1, #u6);
        local v18 = u6[u3];
        local v19;

        if v18 then
            local Character = v18.Character;

            if Character then
                v19 = Character:FindFirstChild("Humanoid");

                if v19 then
                    if v19.Health <= 0 then
                        v19 = v17;
                    end;
                else
                    v19 = v17;
                end;
            else
                v19 = v17;
            end;
        else
            v19 = v17;
        end;

        if v19 then
            v17 = v19;
            break;
        end;

        v17 = v19;
    end;

    if not u6[u3] then
        return;
    end;

    if u4 == u6[u3] then
        return;
    end;

    workspace_CurrentCamera.CameraSubject = v17;
    charVisible();
end;

local function PrevSpec() -- Line: 185
    -- upvalues: UpdateSpecList (copy), u6 (ref), u3 (ref), u4 (ref), workspace_CurrentCamera (copy), charVisible (copy)
    UpdateSpecList();

    if #u6 <= 0 then
        return;
    end;

    local v20 = nil;

    while true do
        if u3 - 1 < 1 then
            u3 = #u6;
            break;
        end;

        u3 = math.max(u3 - 1, 1);
        local v21 = u6[u3];
        local v22;

        if v21 then
            local Character = v21.Character;

            if Character then
                v22 = Character:FindFirstChild("Humanoid");

                if v22 then
                    if v22.Health <= 0 then
                        v22 = v20;
                    end;
                else
                    v22 = v20;
                end;
            else
                v22 = v20;
            end;
        else
            v22 = v20;
        end;

        if v22 then
            v20 = v22;
            break;
        end;

        v20 = v22;
    end;

    if not u6[u3] then
        return;
    end;

    if u4 == u6[u3] then
        return;
    end;

    workspace_CurrentCamera.CameraSubject = v20;
    charVisible();
end;

local function RenderSpectate(p23: number) -- Line: 219
    -- upvalues: u1 (copy), RunService (copy), updateGui (copy), u6 (ref), workspace_CurrentCamera (copy), ReplicatedStorage (copy), u3 (ref), NextSpec (copy), updatechar (copy), u5 (ref)
    if not u1.IsSpecting then
        RunService:UnbindFromRenderStep("Spectate");

        return;
    end;

    updateGui(p23);

    if #u6 <= 0 then
        workspace_CurrentCamera.CameraType = Enum.CameraType.Scriptable;
        workspace_CurrentCamera.CFrame = ReplicatedStorage.CamPos.Value;
        workspace_CurrentCamera.FieldOfView = 70;

        return;
    end;

    if not u6[u3] then
        NextSpec();

        return;
    end;

    local Character = u6[u3].Character;

    if not Character then
        NextSpec();

        return;
    end;

    if not Character:FindFirstChild("Head") then
        NextSpec();

        return;
    end;

    local Humanoid = Character:FindFirstChild("Humanoid");

    if not Humanoid or Humanoid.Health <= 0 then
        NextSpec();

        return;
    end;

    local Attribute = Character:GetAttribute("CamCFrame");

    if not Attribute or typeof(Attribute) ~= "CFrame" then
        NextSpec();

        return;
    end;

    local Attribute2 = Character:GetAttribute("CamFOV");

    if not Attribute2 or typeof(Attribute2) ~= "number" then
        NextSpec();

        return;
    end;

    updatechar(Character);
    u5 = u5:Lerp(Vector3.new(Attribute2, 0), p23 * 15);
    workspace_CurrentCamera.CameraType = Enum.CameraType.Scriptable;
    workspace_CurrentCamera.CFrame = workspace_CurrentCamera.CFrame:Lerp(Attribute, p23 * 15);
    workspace_CurrentCamera.FieldOfView = u5.X;
end;

function v7.EnableSpec() -- Line: 262
    -- upvalues: u1 (copy), u2 (copy), InputBinds (copy), u3 (ref), NextSpec (copy), RunService (copy), RenderSpectate (copy)
    if u1.gameplayType ~= "Spectate" then
        return;
    end;

    u1.IsSpecting = true;
    u2.ShowOnlyMenu("Spectate");
    InputBinds.SpectateContext.Enabled = true;
    u3 = 0;
    NextSpec();
    RunService:BindToRenderStep("Spectate", Enum.RenderPriority.Last.Value, RenderSpectate);
end;

function v7.DisableSpec() -- Line: 276
    -- upvalues: RunService (copy), InputBinds (copy), u4 (ref), u1 (copy), LocalPlayer (copy), charVisible (copy)
    RunService:UnbindFromRenderStep("Spectate");
    InputBinds.SpectateContext.Enabled = false;
    u4 = nil;
    u1.IsSpecting = false;
    local GameGui = LocalPlayer.PlayerGui:FindFirstChild("GameGui");

    if GameGui then
        GameGui.SpecMenu.Visible = false;
    end;

    charVisible();
end;

function v7.OnStart(p24: userdata) -- Line: 293
    -- upvalues: InputBinds (copy), NextSpec (copy), PrevSpec (copy)
    InputBinds.SpectateContext.NextAction.Pressed:Connect(NextSpec);
    InputBinds.SpectateContext.PreviousAction.Pressed:Connect(PrevSpec);
end;

return v7;