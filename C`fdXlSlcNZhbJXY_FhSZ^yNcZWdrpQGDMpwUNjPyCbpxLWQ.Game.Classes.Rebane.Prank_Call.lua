-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Rebane.Prank Call
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Rebane
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
    Zoom = 60,
    gunName = "Prank Call",
    Type = "Gadget",
    EnableHUD = false,
    LeftHand = false,
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
    MainCFrame = CFrame.new(0, -0.5, 0),
    GunModelFixed = true,
    GunCFrame = CFrame.new(-0.8, -0.35, -0.9) * CFrame.Angles(1.5707963267948966, 0, 3.141592653589793),
    LArmCFrame = CFrame.new(-0.8, -0.5, -0.25) * CFrame.Angles(1.5707963267948966, 0, 0),
    RArmCFrame = CFrame.new(0.8, -0.5, -0.25) * CFrame.Angles(1.5707963267948966, 0, 0)
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
    TweenService:Create(p2[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p2[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
    wait(0.25);
end;

function u1.UnEquipAnim(p3) -- Line: 118
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p3[1], TweenInfo.new(0, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p3[2], TweenInfo.new(0, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
    wait(0.1);
    TweenService:Create(p3[1], TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        C1 = (CFrame.new(1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p3[2], TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        C1 = (CFrame.new(-1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    wait(0.15);
end;

function u1.IdleAnim(p4) -- Line: 127
end;

function u1.LowReady(p5) -- Line: 131
end;

function u1.HighReady(p6) -- Line: 135
end;

function u1.Patrol(p7) -- Line: 139
end;

function u1.SprintAnim(p8) -- Line: 143
end;

function u1.ReloadAnim(p9) -- Line: 147
end;

function u1.TacticalReloadAnim(p10) -- Line: 151
end;

function u1.JammedAnim(p11) -- Line: 155
end;

function u1.PumpAnim(p12) -- Line: 159
end;

function u1.MagCheck(p13) -- Line: 163
end;

function u1.meleeAttack(p14) -- Line: 167
end;

function u1.GrenadeReady(p15) -- Line: 171
end;

function u1.GrenadeThrow(p16) -- Line: 175
end;

u1.SV_GunPos = CFrame.new(-0.625, 0, -0.5) * CFrame.Angles(-1.5707963267948966, 3.141592653589793, 0);
local _ = workspace.CurrentCamera;
local u17 = false;
local u18 = 0;

function u1.OnActivate(p19: any, p20: userdata, p21: number) -- Line: 191
    -- upvalues: u17 (ref), u18 (ref), ReplicatedStorage (copy), u1 (copy)
    if not (p19 and p19.Character) then
        return;
    end;

    local Humanoid = p19.Character:FindFirstChild("Humanoid");

    if not Humanoid or Humanoid.Health <= 0 then
        return;
    end;

    if not p20 then
        return;
    end;

    if not p20:FindFirstChild("Prank Call") then
        return;
    end;

    if not u17 then
        return;
    end;

    if os.clock() - u18 < 15 then
        return;
    end;

    u17 = false;
    u18 = os.clock();
    ReplicatedStorage.Skorpio_Engine.Events.Gadget:FireServer("Prank Call", p21);
    local v22 = u1;
    v22.Ammo = v22.Ammo - 1;
end;

function u1.OnEquip(p23) -- Line: 213
    -- upvalues: u17 (ref)
    u17 = true;
end;

function u1.OnUnequip(p24) -- Line: 217
    -- upvalues: u17 (ref)
    u17 = false;
end;

function u1.OnUpdate(p25, p26) -- Line: 221
    -- upvalues: u18 (ref)
    if not p26 then
        return;
    end;

    if not p26:FindFirstChild("Prank Call") then
        return;
    end;

    if os.clock() - u18 < 15 then
    end;
end;

return u1;