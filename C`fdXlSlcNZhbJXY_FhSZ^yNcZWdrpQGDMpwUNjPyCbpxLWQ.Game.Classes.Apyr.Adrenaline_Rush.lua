-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Apyr.Adrenaline Rush
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Apyr
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:34
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local TweenService = game:GetService("TweenService");
local u1 = {
    SlideEx = CFrame.new(0, 0, 0),
    SlideLock = false,
    canAim = false,
    Zoom = 60,
    gunName = "Adrenaline Rush",
    Type = "Gadget",
    EnableHUD = false,
    LeftHand = true,
    IncludeChamberedBullet = false,
    Ammo = 4,
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
    GunCFrame = CFrame.new(-0.4, 0.05, 0.25) * CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966),
    LArmCFrame = CFrame.new(-0.5, -0.2, -0.85) * CFrame.Angles(1.5707963267948966, 0.4363323129985824, 1.5707963267948966),
    RArmCFrame = CFrame.new(0.7, -0.45, -0.3) * CFrame.Angles(3.0543261909900767, 0.5235987755982988, -0.6981317007977318)
};

function u1.EquipAnim(p2) -- Line: 109
    -- upvalues: TweenService (copy), u1 (copy)
    p2[3].Part0 = p2[2].Part1;
    p2[4].Straps1.Transparency = 1;
    p2[4].Straps2.Transparency = 1;
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

function u1.UnEquipAnim(p3) -- Line: 123
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

function u1.IdleAnim(p4) -- Line: 132
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p4[1], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p4[2], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
end;

function u1.LowReady(p5) -- Line: 137
end;

function u1.HighReady(p6) -- Line: 141
end;

function u1.Patrol(p7) -- Line: 145
end;

function u1.SprintAnim(p8) -- Line: 149
end;

function u1.ReloadAnim(p9) -- Line: 153
end;

function u1.TacticalReloadAnim(p10) -- Line: 157
end;

function u1.JammedAnim(p11) -- Line: 161
end;

function u1.PumpAnim(p12) -- Line: 165
end;

function u1.MagCheck(p13) -- Line: 169
end;

function u1.meleeAttack(p14) -- Line: 173
end;

function u1.GrenadeReady(p15) -- Line: 177
end;

function u1.GrenadeThrow(p16) -- Line: 181
end;

u1.SV_GunPos = CFrame.new(0, 0.5, 0) * CFrame.Angles(3.141592653589793, 0, 1.5707963267948966);
u1.SV_RightArmPos = CFrame.new(-0.575, 0.65, -1.185) * CFrame.Angles(-1.5707963267948966, 0, 0);
u1.SV_LeftArmPos = CFrame.new(1.15, 0.25, -1.3) * CFrame.Angles(-1.6580627893946132, 0.3490658503988659, -0.4363323129985824);
u1.SV_RightElbowPos = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0);
u1.SV_LeftElbowPos = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0);
u1.SV_RightWristPos = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0);
u1.SV_LeftWristPos = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0);
u1.RightAim = CFrame.new(-0.575, 0.45, -1.15) * CFrame.Angles(-1.8325957145940461, 0, 0);
u1.LeftAim = CFrame.new(1.3, 0.2, -0.85) * CFrame.Angles(-1.6580627893946132, 0.6108652381980153, -0.4363323129985824);
u1.RightElbowAim = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0);
u1.LeftElbowAim = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0);
u1.RightWristAim = CFrame.new(0, 0, 0.1) * CFrame.Angles(0.2617993877991494, 0, 0);
u1.LeftWristAim = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0);
u1.RightSprint = CFrame.new(-1, 1.1, -0.5) * CFrame.Angles(-0.5235987755982988, 0, 0);
u1.LeftSprint = CFrame.new(1, 1, -0.9) * CFrame.Angles(-0.5235987755982988, 0.6108652381980153, -0.4363323129985824);
u1.RightElbowSprint = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0);
u1.LeftElbowSprint = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0);
u1.RightWristSprint = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0);
u1.LeftWristSprint = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0);
local _ = workspace.CurrentCamera;
local u17 = false;
local u18 = 0;

function u1.OnActivate(p19: any, p20: userdata, p21: number) -- Line: 226
    -- upvalues: u17 (ref), u18 (ref), ReplicatedStorage (copy), u1 (copy)
    if not (p19 and p19.Character) then
        return;
    end;

    if p19.Character:FindFirstChild("Adrenaline") then
        return;
    end;

    local Humanoid = p19.Character:FindFirstChild("Humanoid");

    if not Humanoid or Humanoid.Health <= 0 then
        return;
    end;

    if not p20 then
        return;
    end;

    if not p20:FindFirstChild("Adrenaline Rush") then
        return;
    end;

    if not u17 then
        return;
    end;

    if os.clock() - u18 < 10 then
        return;
    end;

    u17 = false;
    u18 = os.clock();
    p20["Adrenaline Rush"].Handle.Beep:Play();
    ReplicatedStorage.Skorpio_Engine.Events.Gadget:FireServer("Adrenaline Rush", p21);
    local v22 = u1;
    v22.Ammo = v22.Ammo - 1;
end;

function u1.OnEquip(p23) -- Line: 250
    -- upvalues: u17 (ref)
    u17 = true;
end;

function u1.OnUnequip(p24) -- Line: 254
    -- upvalues: u17 (ref)
    u17 = false;
end;

function u1.OnUpdate(p25, p26) -- Line: 258
    -- upvalues: u18 (ref)
    if not p26 then
        return;
    end;

    if not p26:FindFirstChild("Adrenaline Rush") then
        return;
    end;

    if os.clock() - u18 >= 10 then
        p26["Adrenaline Rush"].Screen.SurfaceGui.Frame.Cooldown.Text = "Ready";

        return;
    end;

    local Cooldown = p26["Adrenaline Rush"].Screen.SurfaceGui.Frame.Cooldown;
    local string_format = string.format;
    local v27 = u18 + 10 - os.clock();
    Cooldown.Text = string_format("%.1f", (tostring(v27)));
end;

return u1;