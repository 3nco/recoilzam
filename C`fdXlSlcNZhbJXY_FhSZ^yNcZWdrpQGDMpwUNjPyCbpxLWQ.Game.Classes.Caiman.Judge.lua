-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Caiman.Judge
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Caiman
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:35
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

game:GetService("PhysicsService");
game:GetService("Debris");
local TweenService = game:GetService("TweenService");
local u1 = {
    SlideEx = CFrame.new(0, 0, -0.3),
    SlideLock = true,
    PistolRecoil = true,
    canAim = true,
    Zoom = 60,
    gunName = "Judge",
    Type = "Gun",
    EnableHUD = true,
    IncludeChamberedBullet = false,
    Ammo = 5,
    StoredAmmo = 35
};
u1.AmmoInGun = u1.Ammo;
u1.MaxStoredAmmo = 35;
u1.CanCheckMag = true;
u1.MagCount = true;
u1.ShellInsert = false;
u1.ShootRate = 600;
u1.Bullets = 6;
u1.BurstShot = 3;
u1.ShootType = 1;
u1.FireModes = {
    ChangeFiremode = false,
    Semi = false,
    Burst = false,
    Auto = false
};
u1.LimbDamage = { 20, 4 };
u1.TorsoDamage = { 25, 4 };
u1.HeadDamage = { 30, 4 };
u1.DamageDropOff = { 12, 38 };
u1.ADS_Speed = 0.24;
u1.CrossHair = true;
u1.CenterDot = false;
u1.CrosshairOffset = 0;
u1.CanBreachDoor = true;
u1.CanRun = true;
u1.ReloadSound = "Revolver";
u1.SightAtt = "";
u1.BarrelAtt = "";
u1.UnderBarrelAtt = "";
u1.OtherAtt = "";
u1.Charm = "";
u1.AvaliableSight = {};
u1.AvaliableBarrel = {};
u1.AvaliableUB = {};
u1.AvaliableOther = { "Laser" };
u1.SkinTable = {};
u1.camRecoil = {
    camRecoilUp = { 25, 25 },
    camRecoilTilt = { 0, 0 },
    camRecoilLeft = { 6, 12 },
    camRecoilRight = { 6, 12 }
};
u1.gunRecoil = {
    gunRecoilUp = { 250, 250 },
    gunRecoilTilt = { 25, 40 },
    gunRecoilLeft = { 25, 50 },
    gunRecoilRight = { 25, 50 }
};
u1.AimRecoilReduction = 1;
u1.AimSpreadReduction = 2;
u1.MinRecoilPower = 1;
u1.MaxRecoilPower = 1;
u1.RecoilPowerStepAmount = 1;
u1.MinSpread = 45;
u1.MaxSpread = 90;
u1.AimInaccuracyStepAmount = 10;
u1.AimInaccuracyDecrease = 100;
u1.WalkMult = 1.25;
u1.EnableZeroing = false;
u1.MaxZero = 500;
u1.ZeroIncrement = 50;
u1.CurrentZero = 0;
u1.BulletType = ".12 Gauge";
u1.MuzzleVelocity = 1000;
u1.BulletDrop = 0.25;
u1.Tracer = false;
u1.BulletFlare = false;
u1.TracerColor = Color3.fromRGB(255, 255, 255);
u1.RandomTracer = {
    Enabled = false,
    Chance = 25
};
u1.TracerEveryXShots = 3;
u1.RainbowMode = false;
u1.CanBreak = true;
u1.Jammed = false;
u1.MainCFrame = CFrame.new(0.5, -0.85, -0.75);
u1.GunModelFixed = true;
u1.GunCFrame = CFrame.new(0.15, -0.2, 1) * CFrame.Angles(1.5707963267948966, 0, 0);
u1.LArmCFrame = CFrame.new(-0.6, -0.3, 0) * CFrame.Angles(1.5707963267948966, 0.4363323129985824, 0.2617993877991494);
u1.RArmCFrame = CFrame.new(0, -0.15, 0) * CFrame.Angles(1.5707963267948966, 0, 0);

function u1.EquipAnim(p2) -- Line: 117
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p2[1], TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
        C1 = (CFrame.new(1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p2[2], TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
        C1 = (CFrame.new(-1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    wait(0.25);
    TweenService:Create(p2[1], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p2[2], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
    wait(0.35);
end;

function u1.UnEquipAnim(p3) -- Line: 126
    -- upvalues: TweenService (copy)
    TweenService:Create(p3[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        C1 = (CFrame.new(1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p3[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        C1 = (CFrame.new(-1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    wait(0.25);
end;

function u1.IdleAnim(p4) -- Line: 132
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p4[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p4[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
end;

function u1.SprintAnim(p5) -- Line: 137
    -- upvalues: TweenService (copy)
    TweenService:Create(p5[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.5, -0.15, 0) * CFrame.Angles(3.0543261909900767, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p5[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    wait(0.25);
end;

function u1.ReloadAnim(p6) -- Line: 143
    -- upvalues: TweenService (copy)
    TweenService:Create(p6[1], TweenInfo.new(0.25, Enum.EasingStyle.Back), {
        C1 = (CFrame.new(0, -0.15, 0) * CFrame.Angles(1.6580627893946132, 0.7853981633974483, 0)):inverse()
    }):Play();
    TweenService:Create(p6[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.6, -0.3, 0) * CFrame.Angles(1.0471975511965976, 0.8726646259971648, 0.5235987755982988)):inverse()
    }):Play();
    p6[4].Handle:WaitForChild("LidUp"):Play();
    TweenService:Create(p6[4].Handle:WaitForChild("LidPart"), TweenInfo.new(0.6, Enum.EasingStyle.Bounce), {
        C1 = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, -1.6580627893946132)
    }):Play();
    wait(0.35);
    TweenService:Create(p6[1], TweenInfo.new(0.5, Enum.EasingStyle.Back), {
        C1 = (CFrame.new(0, -0.75, 0) * CFrame.Angles(2.356194490192345, 0.2617993877991494, 0)):inverse()
    }):Play();
    TweenService:Create(p6[2], TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-1.5, -0.5, 0.75) * CFrame.Angles(0, 0.8726646259971648, 0.2617993877991494)):inverse()
    }):Play();
    wait(0.05);
    p6[4].Handle.MagOut:Play();

    for _, child in pairs(p6[4].LidPart.RodPart.Cylinder:GetChildren()) do
        if child:IsA("BasePart") then
            child.Transparency = 1;
        end;
    end;

    wait(0.5);
    TweenService:Create(p6[1], TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0, -0.15, 0) * CFrame.Angles(1.3089969389957472, 0.2617993877991494, 0)):inverse()
    }):Play();
    p6[4].Handle.AimUp:Play();
    wait(0.75);
    TweenService:Create(p6[2], TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.7, -0.4, 0.15) * CFrame.Angles(2.181661564992912, 0, 0.3490658503988659)):inverse()
    }):Play();
    wait(0.3);
    TweenService:Create(p6[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.7, -0.4, 0) * CFrame.Angles(2.181661564992912, 0, 0.3490658503988659)):inverse()
    }):Play();
    p6[4].Handle.ShellInsert:Play();

    for _, child in pairs(p6[4].LidPart.RodPart.Cylinder:GetChildren()) do
        if child:IsA("BasePart") then
            child.Transparency = 0;
        end;
    end;

    wait(0.25);
    TweenService:Create(p6[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0, -0.15, 0) * CFrame.Angles(1.5707963267948966, -0.4363323129985824, 0)):inverse()
    }):Play();
    p6[4].Handle:WaitForChild("LidDown"):Play();
    TweenService:Create(p6[4].Handle:WaitForChild("LidPart"), TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0)
    }):Play();
    wait(0.25);
end;

function u1.TacticalReloadAnim(p7) -- Line: 186
    -- upvalues: TweenService (copy)
    TweenService:Create(p7[1], TweenInfo.new(0.25, Enum.EasingStyle.Back), {
        C1 = (CFrame.new(0, -0.15, 0) * CFrame.Angles(1.6580627893946132, 0.7853981633974483, 0)):inverse()
    }):Play();
    TweenService:Create(p7[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.6, -0.3, 0) * CFrame.Angles(1.0471975511965976, 0.8726646259971648, 0.5235987755982988)):inverse()
    }):Play();
    p7[4].Handle:WaitForChild("LidUp"):Play();
    TweenService:Create(p7[4].Handle:WaitForChild("LidPart"), TweenInfo.new(0.6, Enum.EasingStyle.Bounce), {
        C1 = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, -1.6580627893946132)
    }):Play();
    wait(0.35);
    TweenService:Create(p7[1], TweenInfo.new(0.5, Enum.EasingStyle.Back), {
        C1 = (CFrame.new(0, -0.75, 0) * CFrame.Angles(2.356194490192345, 0.2617993877991494, 0)):inverse()
    }):Play();
    TweenService:Create(p7[2], TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-1.5, -0.5, 0.75) * CFrame.Angles(0, 0.8726646259971648, 0.2617993877991494)):inverse()
    }):Play();
    wait(0.05);
    p7[4].Handle.MagOut:Play();

    for _, child in pairs(p7[4].LidPart.RodPart.Cylinder:GetChildren()) do
        if child:IsA("BasePart") then
            child.Transparency = 1;
        end;
    end;

    wait(0.5);
    TweenService:Create(p7[1], TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0, -0.15, 0) * CFrame.Angles(1.3089969389957472, 0.2617993877991494, 0)):inverse()
    }):Play();
    p7[4].Handle.AimUp:Play();
    wait(0.75);
    TweenService:Create(p7[2], TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.7, -0.4, 0.15) * CFrame.Angles(2.181661564992912, 0, 0.3490658503988659)):inverse()
    }):Play();
    wait(0.3);
    TweenService:Create(p7[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.7, -0.4, 0) * CFrame.Angles(2.181661564992912, 0, 0.3490658503988659)):inverse()
    }):Play();
    p7[4].Handle.ShellInsert:Play();

    for _, child in pairs(p7[4].LidPart.RodPart.Cylinder:GetChildren()) do
        if child:IsA("BasePart") then
            child.Transparency = 0;
        end;
    end;

    wait(0.25);
    TweenService:Create(p7[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0, -0.15, 0) * CFrame.Angles(1.5707963267948966, -0.4363323129985824, 0)):inverse()
    }):Play();
    p7[4].Handle:WaitForChild("LidDown"):Play();
    TweenService:Create(p7[4].Handle:WaitForChild("LidPart"), TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0)
    }):Play();
    wait(0.25);
end;

function u1.PumpAnim(p8) -- Line: 229
end;

function u1.meleeAttack(p9) -- Line: 233
end;

function u1.GrenadeReady(p10) -- Line: 237
end;

function u1.GrenadeThrow(p11) -- Line: 241
end;

u1.SV_GunPos = CFrame.new(-0.3, -0.2, -0.4) * CFrame.Angles(-1.5707963267948966, 0, 0);

return u1;