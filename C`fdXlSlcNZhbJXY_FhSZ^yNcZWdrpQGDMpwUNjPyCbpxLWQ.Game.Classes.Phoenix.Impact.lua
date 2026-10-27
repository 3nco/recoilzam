-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Phoenix.Impact
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Phoenix
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:35
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local TweenService = game:GetService("TweenService");
local u15 = {
    SlideEx = CFrame.new(0, 0, 0),
    SlideLock = false,
    canAim = false,
    Zoom = 60,
    gunName = "Impact",
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
    GunCFrame = CFrame.new(0.35, -0.25, 0.85) * CFrame.Angles(1.5707963267948966, 0, 0),
    LArmCFrame = CFrame.new(-1, -1, 1) * CFrame.Angles(0, 0, 0),
    RArmCFrame = CFrame.new(1, -0.85, -1) * CFrame.Angles(3.0543261909900767, 0, 0),

    EquipAnim = function(p1) -- Line: 108
        -- upvalues: TweenService (copy)
        TweenService:Create(p1[1], TweenInfo.new(0, Enum.EasingStyle.Linear), {
            C1 = (CFrame.new(1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
        }):Play();
        TweenService:Create(p1[2], TweenInfo.new(0, Enum.EasingStyle.Linear), {
            C1 = (CFrame.new(-1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
        }):Play();
        wait(0.1);
        TweenService:Create(p1[1], TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
            C1 = (CFrame.new(1.75, -0.85, -1) * CFrame.Angles(3.0543261909900767, 0, 0)):inverse()
        }):Play();
        TweenService:Create(p1[2], TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
            C1 = (CFrame.new(-0.75, -0.65, -0.75) * CFrame.Angles(1.7453292519943295, -0.5235987755982988, 0.2617993877991494)):inverse()
        }):Play();
        wait(0.2);
    end,

    IdleAnim = function(p2) -- Line: 117
        -- upvalues: TweenService (copy)
        TweenService:Create(p2[1], TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
            C1 = (CFrame.new(1.75, -0.85, -1) * CFrame.Angles(3.0543261909900767, 0, 0)):inverse()
        }):Play();
        TweenService:Create(p2[2], TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
            C1 = (CFrame.new(-0.75, -0.65, -0.75) * CFrame.Angles(1.7453292519943295, -0.5235987755982988, 0.2617993877991494)):inverse()
        }):Play();
    end,

    LowReady = function(p3) -- Line: 122
    end,

    HighReady = function(p4) -- Line: 126
    end,

    Patrol = function(p5) -- Line: 130
    end,

    SprintAnim = function(p6) -- Line: 134
    end,

    ReloadAnim = function(p7) -- Line: 138
    end,

    TacticalReloadAnim = function(p8) -- Line: 142
    end,

    JammedAnim = function(p9) -- Line: 146
    end,

    PumpAnim = function(p10) -- Line: 150
    end,

    MagCheck = function(p11) -- Line: 154
    end,

    meleeAttack = function(p12) -- Line: 158
    end,

    GrenadeReady = function(p13) -- Line: 162
        -- upvalues: TweenService (copy)
        TweenService:Create(p13[1], TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
            C1 = (CFrame.new(1.75, -0.85, -1) * CFrame.Angles(3.0543261909900767, 0, 0)):inverse()
        }):Play();
        TweenService:Create(p13[2], TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
            C1 = (CFrame.new(-0.75, -0.65, -0.75) * CFrame.Angles(1.7453292519943295, -0.5235987755982988, 0.2617993877991494)):inverse()
        }):Play();
        wait(0.2);
    end,

    GrenadeThrow = function(p14) -- Line: 168
        -- upvalues: TweenService (copy)
        TweenService:Create(p14[1], TweenInfo.new(0.25, Enum.EasingStyle.Back), {
            C1 = (CFrame.new(1, -0.85, -1) * CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0)):inverse()
        }):Play();
        TweenService:Create(p14[2], TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
            C1 = (CFrame.new(-1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
        }):Play();
        wait(0.1);
        p14[4].Handle.Transparency = 1;
        p14[4].Handle.Swing:Play();
    end,

    SV_GunPos = CFrame.new(-0.3, -0.2, -0.4) * CFrame.Angles(-1.5707963267948966, 0, 0)
};
local workspace_CurrentCamera = workspace.CurrentCamera;
local u16 = false;

function u15.OnActivate(p17: userdata, p18: userdata, p19: number) -- Line: 187
    -- upvalues: u16 (ref), ReplicatedStorage (copy), workspace_CurrentCamera (copy), u15 (copy)
    u16 = false;
    ReplicatedStorage.Skorpio_Engine.Events.Gadget:FireServer("Impact", p19, workspace_CurrentCamera.CFrame);
    local v20 = u15;
    v20.Ammo = v20.Ammo - 1;
end;

function u15.OnEquip(p21) -- Line: 194
    -- upvalues: u16 (ref)
    u16 = true;
end;

function u15.OnUnequip(p22) -- Line: 198
    -- upvalues: u16 (ref)
    u16 = false;
end;

function u15.OnUpdate(p23) -- Line: 203
end;

return u15;