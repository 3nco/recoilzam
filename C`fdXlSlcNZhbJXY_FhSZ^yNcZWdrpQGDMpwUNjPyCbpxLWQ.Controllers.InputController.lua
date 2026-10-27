-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Controllers.InputController
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Controllers
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

game:GetService("CollectionService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
game:GetService("ContextActionService");
game:GetService("RunService");
local Players = game:GetService("Players");
game:GetService("Teams");
local _ = Players.LocalPlayer;
local _ = workspace.CurrentCamera;
local InputBinds = ReplicatedStorage:WaitForChild("InputBinds");
ReplicatedStorage:WaitForChild("Game"):WaitForChild("OpIcons");
local u1 = require("./PlayerController");
local u2 = require("./ScanDeviceController");
local u3 = require("./SpectateController");
local u4 = {};

local function SpectateToCamera() -- Line: 23
    -- upvalues: u1 (copy), u3 (copy), u2 (copy), u4 (copy)
    if u1.gameplayType ~= "Spectate" then
        return;
    end;

    if u1.IsSpecting then
        u3.DisableSpec();
        u2.EnableScanDevice();
        u4.SetContextEnabled("PingContext", true);

        return;
    end;

    u2.DisableScanDevice();
    u3.EnableSpec();
    u4.SetContextEnabled("PingContext", false);
end;

function u4.SetContextEnabled(p5: string, p6: boolean) -- Line: 38
    -- upvalues: InputBinds (copy)
    if typeof(p5) ~= "string" then
        return;
    end;

    if typeof(p6) ~= "boolean" then
        return;
    end;

    local v7 = InputBinds:FindFirstChild(p5);

    if not v7 then
        return;
    end;

    v7.Enabled = p6;
end;

function u4.OnStart(p8: userdata) -- Line: 49
    -- upvalues: InputBinds (copy), SpectateToCamera (copy)
    InputBinds.GameplayContext.EquipCameraAction.Pressed:Connect(SpectateToCamera);
end;

return u4;