-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Controllers.ScanDeviceController
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Controllers
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local ReplicatedStorage = game:GetService("ReplicatedStorage");
game:GetService("UserInputService");
game:GetService("ContextActionService");
local RunService = game:GetService("RunService");
local Players = game:GetService("Players");
local Debris = game:GetService("Debris");
game:GetService("Teams");
local workspace_CurrentCamera = workspace.CurrentCamera;
local LocalPlayer = Players.LocalPlayer;
local Drones = workspace.GAME_WORKSPACE:WaitForChild("Drones");
local InputBinds = ReplicatedStorage:WaitForChild("InputBinds");
local u1 = require("./PlayerController");
local u2 = require("./MobileController");
local DeviceOverlay = script:WaitForChild("DeviceOverlay");
local laserFx = script:WaitForChild("laserFx");
game:GetService("TweenService");
local u3 = {};
local v4 = {};

local function FireLaser(p5: userdata, p6: vector, p7: vector, p8: userdata) -- Line: 28
    -- upvalues: ReplicatedStorage (copy), workspace_CurrentCamera (copy), laserFx (copy), Debris (copy), FireLaser (copy)
    if not (p5 and p5:IsA("Model")) then
        return;
    end;

    if not p5.PrimaryPart then
        return;
    end;

    if typeof(p6) ~= "Vector3" then
        return;
    end;

    if typeof(p7) ~= "Vector3" then
        return;
    end;

    if p8 and typeof(p8) ~= "RaycastParams" then
        return;
    end;

    local v9 = workspace:Raycast(p6, p7 * 5000, p8);

    if not v9 then
        ReplicatedStorage.Skorpio_Engine.Events.DroneLaser:FireServer(p5, p6 + p7 * 5000, nil);
        local Attachment = Instance.new("Attachment", workspace.Terrain);
        local Attachment2 = Instance.new("Attachment", workspace.Terrain);
        Attachment.WorldPosition = workspace_CurrentCamera.CFrame.Position - workspace_CurrentCamera.CFrame.UpVector * 0.5;
        Attachment2.WorldPosition = p6 + p7 * 5000;
        local v10 = laserFx:Clone();
        v10.Parent = Attachment;
        v10.Attachment0 = Attachment;
        v10.Attachment1 = Attachment2;
        v10.Enabled = true;
        Debris:AddItem(Attachment2, 0.25);
        Debris:AddItem(Attachment, 0.25);

        return;
    end;

    local Instance2 = v9.Instance;
    local Position = v9.Position;

    if Instance2 and Instance2.Parent:IsA("Accessory") or Instance2.Parent:IsA("Hat") then
        p8:AddToFilter(Instance2.Parent);

        return FireLaser(p5, p6, p7, p8);
    end;

    if Instance2 and Instance2.Name == "Ignorable" or (Instance2.Name == "Ignore" or Instance2.Name == "Glass") then
        p8:AddToFilter(Instance2);

        return FireLaser(p5, p6, p7, p8);
    end;

    if Instance2 and (Instance2.Transparency >= 1 or Instance2.CanCollide == false) and (Instance2.Name ~= "Head" and (Instance2.Name ~= "EShield" and not (Instance2.Name:match("Torso") or (Instance2.Name:match("Arm") or (Instance2.Name:match("Hand") or (Instance2.Name:match("Leg") or Instance2.Name:match("Foot"))))))) then
        p8:AddToFilter(Instance2);

        return FireLaser(p5, p6, p7, p8);
    end;

    ReplicatedStorage.Skorpio_Engine.Events.DroneLaser:FireServer(p5, Position, Instance2);
    local Attachment = Instance.new("Attachment", workspace.Terrain);
    local Attachment2 = Instance.new("Attachment", workspace.Terrain);
    Attachment.WorldPosition = workspace_CurrentCamera.CFrame.Position - workspace_CurrentCamera.CFrame.UpVector * 0.5;
    Attachment2.WorldPosition = Position;
    local v11 = laserFx:Clone();
    v11.Parent = Attachment;
    v11.Attachment0 = Attachment;
    v11.Attachment1 = Attachment2;
    v11.Enabled = true;
    Debris:AddItem(Attachment2, 0.25);
    Debris:AddItem(Attachment, 0.25);
end;

local function UpdateCameraList() -- Line: 104
    -- upvalues: LocalPlayer (copy), u3 (ref)
    local v12 = {};
    local v13 = {};

    for _, child in pairs(workspace.GAME_WORKSPACE.Cameras:GetChildren()) do
        local Humanoid = child:FindFirstChild("Humanoid");

        if Humanoid and Humanoid.Health > 0 then
            local Attribute = child:GetAttribute("TeamColor");

            if not Attribute or LocalPlayer.Team.TeamColor == Attribute then
                table.insert(v12, child);
            end;
        end;
    end;

    for _, child in pairs(workspace.GAME_WORKSPACE.Drones:GetChildren()) do
        local Humanoid = child:FindFirstChild("Humanoid");

        if Humanoid and Humanoid.Health > 0 then
            local Attribute = child:GetAttribute("TeamColor");

            if not Attribute or LocalPlayer.Team.TeamColor == Attribute then
                table.insert(v13, child);
            end;
        end;
    end;

    u3 = { v12, v13 };
end;

local function LocateCurrentDevice() -- Line: 133
    -- upvalues: u1 (copy), u3 (ref)
    local currentDevice = u1.currentDevice;

    if not currentDevice then
        return 1, 1;
    end;

    local Humanoid = currentDevice:FindFirstChild("Humanoid");

    if not Humanoid or Humanoid.Health <= 0 then
        u1.currentDevice = nil;

        return 1, 1;
    end;

    for i, v in ipairs(u3) do
        if typeof(v) ~= "table" then
            u1.currentDevice = nil;

            return 1, 1;
        end;

        local table_find_ret = table.find(v, u1.currentDevice);

        if table_find_ret then
            return table_find_ret and i and i or 1, table_find_ret or 1;
        end;
    end;

    u1.currentDevice = nil;
end;

local function HasSignalBlocked() -- Line: 163
    -- upvalues: LocalPlayer (copy)
    local Character = LocalPlayer.Character;

    if not Character then
        return;
    end;

    local Humanoid = Character:FindFirstChild("Humanoid");

    if Humanoid and Humanoid.Health > 0 then
        return Character:HasTag("SignalJammer");
    end;
end;

local function RenderCamera(p14) -- Line: 173
    -- upvalues: u1 (copy), DeviceOverlay (copy), LocalPlayer (copy)
    local currentDevice = u1.currentDevice;
    local NoSignal = DeviceOverlay.Main.NoSignal;
    local Character = LocalPlayer.Character;
    local v15;

    if Character then
        local Humanoid = Character:FindFirstChild("Humanoid");

        if Humanoid and Humanoid.Health > 0 then
            v15 = Character:HasTag("SignalJammer");
        else
            v15 = nil;
        end;
    else
        v15 = nil;
    end;

    NoSignal.Visible = v15;
    local Fox = DeviceOverlay.Main.PrankCall.Fox;
    local UDim2_new = UDim2.new;
    local v16 = os.clock() * 5;
    Fox.Position = UDim2_new(0.5, 0, 0.5, math.sin(v16) * 20);
    DeviceOverlay.Main.PrankCall.TileSize = UDim2.new(math.random(400, 750) / 450, 0, math.random(400, 750) / 450, 0);
    DeviceOverlay.Main.PrankCall.Visible = LocalPlayer:FindFirstChild("Prank Call Tag");
    DeviceOverlay.Haha.Playing = LocalPlayer:FindFirstChild("Prank Call Tag");
    local v17;

    if currentDevice then
        v17 = currentDevice:FindFirstChild("Humanoid");
    else
        v17 = currentDevice;
    end;

    if not v17 or v17.Health <= 0 then
        DeviceOverlay.WN.ImageTransparency = 0;
        DeviceOverlay.WN.TileSize = UDim2.new(math.random(400, 600) / 750, 0, math.random(400, 600) / 750, 0);

        return;
    end;

    local v18 = currentDevice and (currentDevice:GetAttribute("Overlay") or "") or "";
    local v19 = nil;

    for _, child in pairs(DeviceOverlay.Overlays:GetChildren()) do
        child.Visible = v18 == child.Name;

        if v18 == child.Name then
            v19 = child;
        end;
    end;

    local Attribute = currentDevice:GetAttribute("laserCount");

    if v19 then
        v19 = v19:FindFirstChild("laserUI");
    end;

    if Attribute and v19 then
        v19.Visible = true;
        v19.laserCount.Text = Attribute .. "X";
    end;

    local v20 = false;
    local v21 = false;

    for _, child in pairs(workspace.Gadgets:GetChildren()) do
        if not (currentDevice and currentDevice.PrimaryPart) then
            break;
        end;

        if child:IsA("Model") and (child.Name == "Signal jammer" and child:GetAttribute("GadgetTeam") ~= LocalPlayer.TeamColor) then
            local Humanoid = child:FindFirstChild("Humanoid");

            if Humanoid and (Humanoid.Health > 0 and child.PrimaryPart) then
                v21 = (child.PrimaryPart.Position - currentDevice.PrimaryPart.Position).Magnitude <= 16 and true or v21;

                if (child.PrimaryPart.Position - currentDevice.PrimaryPart.Position).Magnitude <= 8 then
                    v20 = true;
                    break;
                end;
            end;
        end;
    end;

    u1.IsGlitched = v20;
    DeviceOverlay.GlitchNoise.Playing = v20 or v21;
    DeviceOverlay.Glitch.ImageTransparency = v20 and 0.1 or (v21 and 0.75 or 1);
    DeviceOverlay.Glitch.TileSize = UDim2.new(math.random(400, 600) / 1000, 0, math.random(400, 600) / 1000, 0);
    local WN = DeviceOverlay.WN;
    local v22 = math.noise(0.125) * tick();
    local v23 = math.sin(v22) / 4;
    WN.ImageTransparency = 0.85 - math.abs(v23);
    DeviceOverlay.WN.TileSize = UDim2.new(math.random(400, 600) / 750, 0, math.random(400, 600) / 750, 0);
end;

local function UpdateCameraName(p24: userdata, p25: number) -- Line: 253
    -- upvalues: LocalPlayer (copy)
    if not p24 then
        return;
    end;

    if typeof(p25) ~= "number" then
        return;
    end;

    local DeviceOverlay2 = LocalPlayer.PlayerGui:FindFirstChild("DeviceOverlay");

    if not DeviceOverlay2 then
        return;
    end;

    DeviceOverlay2.Main.CamList.TextLabel.Text = p25 == 1 and "CAMERA" or "DRONE";

    if p24:FindFirstChild("LocationName") then
        DeviceOverlay2.Main.CamName.TextLabel.Text = p24.LocationName.Value;

        return;
    end;

    DeviceOverlay2.Main.CamName.TextLabel.Text = "---";
end;

local function ViewDevice(p26: userdata) -- Line: 270
    -- upvalues: workspace_CurrentCamera (copy), LocalPlayer (copy)
    if not p26 then
        return;
    end;

    if not p26:IsA("Model") then
        return;
    end;

    local Humanoid = p26:FindFirstChild("Humanoid");

    if not Humanoid then
        return;
    end;

    Humanoid.CameraOffset = p26:GetAttribute("CamOffset") or Vector3.new(0, 0, 0);
    workspace_CurrentCamera.CameraSubject = p26;
    workspace_CurrentCamera.CFrame = p26.PrimaryPart.CFrame;
    workspace_CurrentCamera.CameraType = Enum.CameraType.Custom;
    workspace_CurrentCamera.FieldOfView = 50;
    LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson;
end;

local function DisableDroneControl(p27: userdata) -- Line: 287
    -- upvalues: RunService (copy)
    RunService:UnbindFromRenderStep("DroneMovement");

    if not p27 then
        return;
    end;

    local PrimaryPart = p27.PrimaryPart;

    if not PrimaryPart then
        return;
    end;

    local BodyVelocity = PrimaryPart:FindFirstChild("BodyVelocity");
    local BodyGyro = PrimaryPart:FindFirstChild("BodyGyro");

    if BodyGyro then
        BodyGyro.CFrame = PrimaryPart.CFrame;
    end;

    if BodyVelocity then
        BodyVelocity.Velocity = Vector3.new(0, 0, 0);
    end;
end;

local function onJump() -- Line: 308
    -- upvalues: u1 (copy), workspace_CurrentCamera (copy)
    local currentDevice = u1.currentDevice;

    if not currentDevice then
        return;
    end;

    if currentDevice:IsDescendantOf(workspace.GAME_WORKSPACE.Cameras) then
        return;
    end;

    local PrimaryPart = currentDevice.PrimaryPart;

    if not PrimaryPart then
        return;
    end;

    local Humanoid = currentDevice:FindFirstChild("Humanoid");

    if not Humanoid or Humanoid.Health <= 0 then
        return;
    end;

    if u1.IsGlitched then
        return;
    end;

    if currentDevice.Name == "Dreadwing" then
        return;
    end;

    if os.clock() - u1.LastDroneJump >= 1.5 then
        u1.LastDroneJump = os.clock();
        local RootPart = Humanoid.RootPart;
        local v28 = workspace_CurrentCamera:GetPivot().LookVector.Y + 0.25;
        local math_min_ret = math.min(v28, 0.75);
        RootPart:ApplyImpulse(Vector3.new(0, math_min_ret, 0) * u1.DroneVerticalJumpPower);
        local BodyVelocity = PrimaryPart.BodyVelocity;
        BodyVelocity.Velocity = BodyVelocity.Velocity + workspace_CurrentCamera:GetPivot().LookVector * u1.DroneForwardJumpPower;
    end;
end;

u1.LastLaserShot = u1.LastLaserShot or 0;
u1.LaserCooldown = 1.5;

local function activateLaser() -- Line: 339
    -- upvalues: u1 (copy), LocalPlayer (copy), DeviceOverlay (copy), workspace_CurrentCamera (copy), FireLaser (copy)
    if not u1.currentDevice then
        return;
    end;

    local Owner = u1.currentDevice:FindFirstChild("Owner");

    if Owner then
        Owner = Owner.Value == LocalPlayer;
    end;

    if not Owner then
        return;
    end;

    local PrimaryPart = u1.currentDevice.PrimaryPart;

    if not PrimaryPart then
        return;
    end;

    local Humanoid = u1.currentDevice:FindFirstChild("Humanoid");

    if not Humanoid or Humanoid.Health <= 0 then
        return;
    end;

    if LocalPlayer.Character and LocalPlayer.Character:HasTag("SignalJammer") then
        return;
    end;

    if u1.IsGlitched then
        return;
    end;

    local Attribute = u1.currentDevice:GetAttribute("laserCount");

    if not Attribute or Attribute <= 0 then
        return;
    end;

    if os.clock() - u1.LastLaserShot < u1.LaserCooldown then
        return;
    end;

    u1.LastLaserShot = os.clock();
    local FireLaser2 = PrimaryPart:FindFirstChild("FireLaser");

    if FireLaser2 and FireLaser2:IsA("Sound") then
        FireLaser2:Play();
    end;

    local v29 = u1.currentDevice:GetAttribute("Overlay") or "";
    local u30 = DeviceOverlay.Overlays:FindFirstChild(v29);

    if u30 then
        u30 = u30:FindFirstChild("laserUI");
    end;

    if u30 then
        u30 = u30:FindFirstChild("ImageLabel");
    end;

    if u30 then
        u30.ImageTransparency = 0.6;
        task.delay(u1.LaserCooldown, function() -- Line: 374
            -- upvalues: u30 (copy)
            u30.ImageTransparency = 0;
        end);
    end;

    local RaycastParams_new_ret = RaycastParams.new();
    RaycastParams_new_ret.IgnoreWater = true;
    RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Exclude;
    RaycastParams_new_ret.FilterDescendantsInstances = { workspace_CurrentCamera, u1.currentDevice };
    FireLaser(u1.currentDevice, workspace_CurrentCamera.CFrame.Position, workspace_CurrentCamera.CFrame.LookVector, RaycastParams_new_ret);
end;

local function EnableDroneControl(u31) -- Line: 388
    -- upvalues: LocalPlayer (copy), u2 (copy), RunService (copy), workspace_CurrentCamera (copy), u1 (copy), InputBinds (copy)
    if not u31 then
        return;
    end;

    local Owner = u31:FindFirstChild("Owner");

    if Owner then
        Owner = Owner.Value == LocalPlayer;
    end;

    if not u31.PrimaryPart then
        return;
    end;

    local Humanoid = u31:FindFirstChild("Humanoid");

    if not Humanoid then
        return;
    end;

    local Attribute = u31:GetAttribute("CanShoot");
    local ButtonByName = u2.GetButtonByName("DeviceFireButton");

    if ButtonByName then
        ButtonByName.Visible = Attribute and Owner;
    end;

    local v32 = u31:IsDescendantOf(workspace.GAME_WORKSPACE.Drones);
    local ButtonByName2 = u2.GetButtonByName("DeviceJumpButton");

    if ButtonByName2 then
        ButtonByName2.Visible = v32 and Owner;
    end;

    if not Owner then
        return;
    end;

    local u33 = Vector3.new(0, 0, 0);
    RunService:BindToRenderStep("DroneMovement", Enum.RenderPriority.Last.Value, function(p34) -- Line: 416
        -- upvalues: u31 (copy), Humanoid (copy), workspace_CurrentCamera (ref), LocalPlayer (ref), u1 (ref), InputBinds (ref), u33 (ref)
        if not u31 then
            return;
        end;

        if not u31.Parent then
            return;
        end;

        local PrimaryPart = u31.PrimaryPart;

        if not PrimaryPart then
            return;
        end;

        if not Humanoid then
            return;
        end;

        if Humanoid.Health <= 0 then
            return;
        end;

        if workspace_CurrentCamera.CameraSubject ~= u31.Humanoid then
            return;
        end;

        if LocalPlayer.Character and LocalPlayer.Character:HasTag("SignalJammer") then
            PrimaryPart.BodyGyro.CFrame = u31.PrimaryPart.CFrame;
            PrimaryPart.BodyVelocity.Velocity = Vector3.new(0, 0, 0);

            return;
        end;

        if u1.IsGlitched then
            PrimaryPart.BodyGyro.CFrame = u31.PrimaryPart.CFrame;
            PrimaryPart.BodyVelocity.Velocity = Vector3.new(0, 0, 0);

            return;
        end;

        local LookVector = u31.PrimaryPart.CFrame.LookVector;
        local RightVector = u31.PrimaryPart.CFrame.RightVector;
        local State = InputBinds.CameraContext.MovementAction:GetState();

        if State.Magnitude > 1 then
            State = State.Unit or State;
        end;

        local v35 = State * (u31:GetAttribute("Speed") or 10);
        PrimaryPart.BodyGyro.CFrame = workspace_CurrentCamera.CFrame;
        PrimaryPart.BodyVelocity.Velocity = PrimaryPart.BodyVelocity.Velocity:Lerp(u33 + LookVector * v35.Y + RightVector * v35.X, p34 * 5);
        u33 = u33:Lerp(Vector3.new(), p34 * 10);
    end);
end;

local function CameraAction(p36) -- Line: 457
    -- upvalues: u1 (copy), RunService (copy), UpdateCameraList (copy), LocateCurrentDevice (copy), u3 (ref), UpdateCameraName (copy), ViewDevice (copy), EnableDroneControl (copy)
    if not u1.onCamera then
        return;
    end;

    local currentDevice = u1.currentDevice;
    RunService:UnbindFromRenderStep("DroneMovement");
    local v37 = currentDevice and currentDevice.PrimaryPart;

    if v37 then
        local BodyVelocity = v37:FindFirstChild("BodyVelocity");
        local BodyGyro = v37:FindFirstChild("BodyGyro");

        if BodyGyro then
            BodyGyro.CFrame = v37.CFrame;
        end;

        if BodyVelocity then
            BodyVelocity.Velocity = Vector3.new(0, 0, 0);
        end;
    end;

    UpdateCameraList();
    local v38, v39 = LocateCurrentDevice(u3);

    if p36 == "Next" then
        if v39 + 1 > #u3[v38] then
            local v40 = v38 == 1 and 2 or 1;
            local v41 = #u3[v40] <= 0 and (v40 == 1 and 2 or 1) or v40;
            local v42 = u3[v41][1];

            if not v42 then
                return;
            end;

            u1.currentDevice = v42;
            UpdateCameraName(u1.currentDevice, v41);
            ViewDevice(v42);
            EnableDroneControl(v42);

            return;
        end;

        v39 = v39 + 1;
    elseif p36 == "Previous" then
        if v39 - 1 < 1 then
            local v43 = v38 == 1 and 2 or 1;
            local v44 = #u3[v43] <= 0 and (v43 == 1 and 2 or 1) or v43;
            local v45 = u3[v44][#u3[v44]];

            if not v45 then
                return;
            end;

            u1.currentDevice = v45;
            UpdateCameraName(u1.currentDevice, v44);
            ViewDevice(v45);
            EnableDroneControl(v45);

            return;
        end;

        v39 = v39 - 1;
    end;

    local v46 = u3[v38][v39];

    if not v46 then
        return;
    end;

    u1.currentDevice = v46;
    UpdateCameraName(u1.currentDevice, v38);
    ViewDevice(v46);
    EnableDroneControl(v46);
end;

local function NextDevice() -- Line: 526
    -- upvalues: CameraAction (copy)
    CameraAction("Next");
end;

local function PreviousDevice() -- Line: 530
    -- upvalues: CameraAction (copy)
    CameraAction("Previous");
end;

local function HandleDroneSounds() -- Line: 534
    -- upvalues: Drones (copy)
    for _, child in ipairs(Drones:GetChildren()) do
        local Humanoid = child:FindFirstChild("Humanoid");

        if Humanoid and Humanoid.RootPart then
            local Sound = Humanoid.RootPart:FindFirstChild("Sound");

            if Sound then
                Sound.Volume = math.clamp(Humanoid.RootPart.AssemblyLinearVelocity.Magnitude / 28, 0, 0.0625);
            end;
        end;
    end;
end;

function v4.EnableScanDevice() -- Line: 549
    -- upvalues: u1 (copy), RunService (copy), UpdateCameraList (copy), LocateCurrentDevice (copy), u3 (ref), InputBinds (copy), u2 (copy), UpdateCameraName (copy), RenderCamera (copy), DeviceOverlay (copy), LocalPlayer (copy), ViewDevice (copy), EnableDroneControl (copy)
    if u1.onCamera then
        return;
    end;

    RunService:UnbindFromRenderStep("CamConnection");
    local currentDevice = u1.currentDevice;
    RunService:UnbindFromRenderStep("DroneMovement");
    local v47 = currentDevice and currentDevice.PrimaryPart;

    if v47 then
        local BodyVelocity = v47:FindFirstChild("BodyVelocity");
        local BodyGyro = v47:FindFirstChild("BodyGyro");

        if BodyGyro then
            BodyGyro.CFrame = v47.CFrame;
        end;

        if BodyVelocity then
            BodyVelocity.Velocity = Vector3.new(0, 0, 0);
        end;
    end;

    UpdateCameraList();
    local v48, v49 = LocateCurrentDevice(u3);

    if not u1.currentDevice then
        for i, v in pairs(u3) do
            if u1.currentDevice then
                break;
            end;

            local v50 = i;

            for i2, v2 in pairs(v) do
                local Humanoid = v2:FindFirstChild("Humanoid");

                if Humanoid and Humanoid.Health > 0 then
                    u1.currentDevice = v2;
                    v48 = v50;
                    v49 = i2;
                    break;
                end;
            end;
        end;
    end;

    if not u1.currentDevice then
        u1.onCamera = false;

        return;
    end;

    InputBinds.CameraContext.Enabled = true;
    u1.onCamera = true;
    u2.ShowOnlyMenu("Camera");
    UpdateCameraName(u1.currentDevice, v48);
    RunService:BindToRenderStep("CamConnection", Enum.RenderPriority.Last.Value, RenderCamera);
    DeviceOverlay.Enabled = true;
    local v51 = u3[v48][v49];

    if not v51 then
        return;
    end;

    if LocalPlayer.Character then
        local SpecHighlight = LocalPlayer.Character:FindFirstChild("SpecHighlight");

        if SpecHighlight then
            SpecHighlight:Destroy();
        end;

        local Humanoid = LocalPlayer.Character:FindFirstChild("Humanoid");

        if Humanoid and Humanoid.Health > 0 then
            local Highlight = Instance.new("Highlight");
            Highlight.Name = "SpecHighlight";
            Highlight.OutlineTransparency = 0;
            Highlight.FillTransparency = 0.75;
            Highlight.OutlineColor = Color3.fromRGB(255, 255, 255);
            Highlight.FillColor = Color3.fromRGB(255, 255, 255);
            Highlight.Parent = LocalPlayer.Character;
        end;
    end;

    ViewDevice(v51);
    EnableDroneControl(v51);
end;

function v4.DisableScanDevice() -- Line: 613
    -- upvalues: InputBinds (copy), RunService (copy), u1 (copy), DeviceOverlay (copy), LocalPlayer (copy), workspace_CurrentCamera (copy)
    InputBinds.CameraContext.Enabled = false;
    RunService:UnbindFromRenderStep("CamConnection");
    local currentDevice = u1.currentDevice;
    RunService:UnbindFromRenderStep("DroneMovement");
    local v52 = currentDevice and currentDevice.PrimaryPart;

    if v52 then
        local BodyVelocity = v52:FindFirstChild("BodyVelocity");
        local BodyGyro = v52:FindFirstChild("BodyGyro");

        if BodyGyro then
            BodyGyro.CFrame = v52.CFrame;
        end;

        if BodyVelocity then
            BodyVelocity.Velocity = Vector3.new(0, 0, 0);
        end;
    end;

    DeviceOverlay.Enabled = false;
    DeviceOverlay.Haha.Playing = false;
    DeviceOverlay.GlitchNoise.Playing = false;
    local v53 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("SpecHighlight");

    if v53 then
        v53:Destroy();
    end;

    u1.onCamera = false;

    if u1.gameplayType ~= "Gameplay" then
        return;
    end;

    workspace_CurrentCamera.CameraSubject = LocalPlayer.Character;
    workspace_CurrentCamera.CameraType = Enum.CameraType.Custom;
    LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson;
    workspace_CurrentCamera.CFrame = u1.lastCamCFrame;
end;

function v4.OnStart(p54: userdata) -- Line: 639
    -- upvalues: DeviceOverlay (copy), LocalPlayer (copy), InputBinds (copy), onJump (copy), activateLaser (copy), NextDevice (copy), PreviousDevice (copy), RunService (copy), HandleDroneSounds (copy)
    DeviceOverlay.Parent = LocalPlayer.PlayerGui;
    InputBinds.CameraContext.JumpAction.Pressed:Connect(onJump);
    InputBinds.CameraContext.FireAction.Pressed:Connect(activateLaser);
    InputBinds.CameraContext.NextAction.Pressed:Connect(NextDevice);
    InputBinds.CameraContext.PreviousAction.Pressed:Connect(PreviousDevice);
    RunService:BindToRenderStep("Drone_Sounds", Enum.RenderPriority.Last.Value, HandleDroneSounds);
end;

return v4;