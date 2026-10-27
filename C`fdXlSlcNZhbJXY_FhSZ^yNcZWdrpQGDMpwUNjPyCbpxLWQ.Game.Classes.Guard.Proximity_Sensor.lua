-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Guard.Proximity Sensor
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Guard
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:35
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local TweenService = game:GetService("TweenService");
local u1 = {
    SlideEx = CFrame.new(0, 0, 0),
    SlideLock = false,
    canAim = false,
    Zoom = 70,
    gunName = "Proximity Sensor",
    Type = "Gadget",
    EnableHUD = false,
    IncludeChamberedBullet = false,
    Ammo = 2,
    StoredAmmo = 0,
    AmmoInGun = 0,
    MaxStoredAmmo = 0,
    CanCheckMag = false,
    MagCount = false,
    ShellInsert = false,
    ShootRate = 0,
    Bullets = 0,
    BurstShot = 0,
    ShootType = 0,
    FireModes = {
        ChangeFiremode = false,
        Semi = false,
        Burst = false,
        Auto = false
    },
    LimbDamage = { 0, 0 },
    TorsoDamage = { 0, 0 },
    HeadDamage = { 0, 0 },
    DamageFallOf = 0,
    MinDamage = 0,
    IgnoreProtection = false,
    BulletPenetration = 0,
    adsTime = 1,
    CrossHair = false,
    CenterDot = true,
    CrosshairOffset = 0,
    CanBreachDoor = false,
    CanRun = true,
    SightAtt = "",
    BarrelAtt = "",
    UnderBarrelAtt = "",
    OtherAtt = "",
    camRecoil = {
        camRecoilUp = { 0, 0 },
        camRecoilTilt = { 0, 0 },
        camRecoilLeft = { 0, 0 },
        camRecoilRight = { 0, 0 }
    },
    gunRecoil = {
        gunRecoilUp = { 0, 0 },
        gunRecoilTilt = { 0, 0 },
        gunRecoilLeft = { 0, 0 },
        gunRecoilRight = { 0, 0 }
    },
    AimRecoilReduction = 1,
    AimSpreadReduction = 1,
    MinRecoilPower = 1,
    MaxRecoilPower = 1,
    RecoilPowerStepAmount = 1,
    MinSpread = 0,
    MaxSpread = 0,
    AimInaccuracyStepAmount = 0,
    AimInaccuracyDecrease = 100,
    WalkMult = 0,
    EnableZeroing = false,
    MaxZero = 0,
    ZeroIncrement = 0,
    CurrentZero = 0,
    BulletType = "",
    MuzzleVelocity = 0,
    BulletDrop = 0,
    Tracer = false,
    BulletFlare = false,
    TracerColor = Color3.fromRGB(255, 255, 255),
    RandomTracer = {
        Enabled = false,
        Chance = 25
    },
    TracerEveryXShots = 0,
    RainbowMode = false,
    CanBreak = false,
    Jammed = false,
    MainCFrame = CFrame.new(0, 0, 0),
    GunModelFixed = true,
    GunCFrame = CFrame.new(1, 0, 1) * CFrame.Angles(1.5707963267948966, 0, 0),
    LArmCFrame = CFrame.new(-1, -0.85, -0.25) * CFrame.Angles(1.5707963267948966, 0, 0),
    RArmCFrame = CFrame.new(1, -0.85, -0.25) * CFrame.Angles(1.5707963267948966, 0, 0)
};

function u1.EquipAnim(p2) -- Line: 109
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p2[1], TweenInfo.new(0, Enum.EasingStyle.Linear), {
        C1 = (CFrame.new(1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p2[2], TweenInfo.new(0, Enum.EasingStyle.Linear), {
        C1 = (CFrame.new(-1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    wait(0.1);
    TweenService:Create(p2[1], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p2[2], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
    wait(0.2);
end;

function u1.IdleAnim(p3) -- Line: 118
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p3[1], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p3[2], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
end;

function u1.LowReady(p4) -- Line: 123
end;

function u1.HighReady(p5) -- Line: 127
end;

function u1.Patrol(p6) -- Line: 131
end;

function u1.SprintAnim(p7) -- Line: 135
end;

function u1.ReloadAnim(p8) -- Line: 139
end;

function u1.TacticalReloadAnim(p9) -- Line: 143
end;

function u1.JammedAnim(p10) -- Line: 147
end;

function u1.PumpAnim(p11) -- Line: 151
end;

function u1.MagCheck(p12) -- Line: 155
end;

function u1.meleeAttack(p13) -- Line: 159
end;

function u1.GrenadeReady(p14) -- Line: 163
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p14[1], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p14[2], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
    wait(0.2);
end;

function u1.GrenadeThrow(p15) -- Line: 169
    -- upvalues: TweenService (copy)
    TweenService:Create(p15[1], TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
        C1 = (CFrame.new(1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p15[2], TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
        C1 = (CFrame.new(-1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    wait(0.1);
    p15[4].Handle.Transparency = 1;
    p15[4].Handle.Swing:Play();
end;

u1.SV_GunPos = CFrame.new(-0.3, -0.2, -0.4) * CFrame.Angles(-1.5707963267948966, 0, 0);
local workspace_CurrentCamera = workspace.CurrentCamera;
local u16 = false;
local u17 = false;
local u18 = nil;

local function IsAvailable(p19: userdata, p20: boolean) -- Line: 190
    if not p19 then
        return;
    end;

    if p20 then
        for _, descendant in pairs(p19:GetDescendants()) do
            if descendant:IsA("BasePart") then
                descendant.Color = Color3.fromRGB(13, 105, 172);
            end;
        end;

        return;
    end;

    for _, descendant in pairs(p19:GetDescendants()) do
        if descendant:IsA("BasePart") then
            descendant.Color = Color3.fromRGB(196, 40, 28);
        end;
    end;
end;

function u1.OnActivate(p21: userdata, p22: userdata, p23: number) -- Line: 208
    -- upvalues: u16 (ref), u17 (ref), workspace_CurrentCamera (copy), ReplicatedStorage (copy), u1 (copy)
    u16 = false;

    if not u17 then
        return;
    end;

    u17 = false;
    local RaycastParams_new_ret = RaycastParams.new();
    RaycastParams_new_ret.FilterDescendantsInstances = {
        p21.Character,
        workspace_CurrentCamera,
        workspace.Gadgets,
        workspace.GameVolumes,
        workspace.GAME_WORKSPACE.Doors
    };
    RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Exclude;
    RaycastParams_new_ret.RespectCanCollide = true;
    RaycastParams_new_ret.CollisionGroup = "Player";
    local v24 = workspace:Raycast(workspace_CurrentCamera.CFrame.Position, workspace_CurrentCamera.CFrame.LookVector * 6, RaycastParams_new_ret);

    if v24 then
        local CFrame_new_ret = CFrame.new(v24.Position, v24.Position + v24.Normal);
        ReplicatedStorage.Skorpio_Engine.Events.Gadget:FireServer("Proximity Sensor", p23, CFrame_new_ret);
        local v25 = u1;
        v25.Ammo = v25.Ammo - 1;
    end;
end;

function u1.OnEquip(p26) -- Line: 231
    -- upvalues: u16 (ref)
    u16 = true;
end;

function u1.OnUnequip(p27) -- Line: 235
    -- upvalues: u16 (ref), u18 (ref)
    u16 = false;

    if u18 then
        u18:Destroy();
        u18 = nil;
    end;
end;

function u1.OnUpdate(p28) -- Line: 244
    -- upvalues: u16 (ref), u18 (ref), ReplicatedStorage (copy), workspace_CurrentCamera (copy), u17 (ref), IsAvailable (copy)
    if not u16 then
        return;
    end;

    if not u18 then
        u18 = ReplicatedStorage.Skorpio_Engine.GhostModels["Proximity Sensor"]:Clone();
        u18.Parent = workspace_CurrentCamera;
        u17 = false;

        return;
    end;

    local RaycastParams_new_ret = RaycastParams.new();
    RaycastParams_new_ret.FilterDescendantsInstances = {
        p28.Character,
        workspace_CurrentCamera,
        workspace.Gadgets,
        workspace.GameVolumes,
        workspace.GAME_WORKSPACE.Doors
    };
    RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Exclude;
    RaycastParams_new_ret.RespectCanCollide = true;
    RaycastParams_new_ret.CollisionGroup = "Player";
    local v29 = workspace:Raycast(workspace_CurrentCamera.CFrame.Position, workspace_CurrentCamera.CFrame.LookVector * 6, RaycastParams_new_ret);

    if v29 then
        u18:PivotTo(CFrame.new(v29.Position, v29.Position + v29.Normal) * CFrame.new(0, 0, -u18.PrimaryPart.Size.Z / 2));
        local _, _ = u18:GetBoundingBox();
        CFrame.new(v29.Position);
        local OverlapParams_new_ret = OverlapParams.new();
        OverlapParams_new_ret.FilterDescendantsInstances = {
            p28.Character,
            workspace_CurrentCamera,
            workspace.Gadgets,
            workspace.GameVolumes,
            workspace.GAME_WORKSPACE.Doors
        };
        OverlapParams_new_ret.RespectCanCollide = true;
        OverlapParams_new_ret.CollisionGroup = "Player";

        if workspace:GetPartsInPart(u18.PrimaryPart, OverlapParams_new_ret)[1] then
            u17 = false;
        else
            u17 = true;
        end;
    else
        u18:PivotTo(CFrame.new(workspace_CurrentCamera.CFrame.Position + workspace_CurrentCamera.CFrame.LookVector * 6, workspace_CurrentCamera.CFrame.Position));
        u17 = false;
    end;

    IsAvailable(u18, u17);
end;

return u1;