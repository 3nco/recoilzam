-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Breacher.Le Bloc
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Breacher
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:35
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

game:GetService("PhysicsService");
game:GetService("Debris");
local TweenService = game:GetService("TweenService");
local u1 = {
    SlideEx = CFrame.new(0, 0, -0.3),
    SlideLock = false,
    canAim = false,
    Zoom = 60,
    gunName = "Le Bloc",
    Type = "Shield",
    EnableHUD = false,
    LeftHand = true,
    IncludeChamberedBullet = true,
    Ammo = 1,
    StoredAmmo = 0
};
u1.AmmoInGun = u1.Ammo;
u1.MaxStoredAmmo = 0;
u1.CanCheckMag = true;
u1.MagCount = true;
u1.ShellInsert = false;
u1.ShootRate = 1;
u1.Bullets = 1;
u1.BurstShot = 3;
u1.ShootType = 3;
u1.FireModes = {
    ChangeFiremode = false,
    Semi = true,
    Burst = false,
    Auto = true
};
u1.LimbDamage = { 55, 55 };
u1.TorsoDamage = { 55, 55 };
u1.HeadDamage = { 55, 55 };
u1.MeleeDamage = 200;
u1.DamageFallOf = 1;
u1.MinDamage = 0;
u1.IgnoreProtection = true;
u1.OnlyShootADS = true;
u1.ADS_Speed = 0.5;
u1.CrossHair = false;
u1.CenterDot = true;
u1.CrosshairOffset = 0;
u1.CanBreachDoor = true;
u1.CanRun = false;
u1.SightAtt = "";
u1.BarrelAtt = "";
u1.UnderBarrelAtt = "";
u1.OtherAtt = "";
u1.Charm = "";
u1.AvaliableSight = {};
u1.AvaliableBarrel = {};
u1.AvaliableUB = {};
u1.AvaliableOther = {};
u1.SkinTable = {};
u1.camRecoil = {
    camRecoilUp = { 0, 0 },
    camRecoilTilt = { 0, 0 },
    camRecoilLeft = { 0, 0 },
    camRecoilRight = { 0, 0 }
};
u1.gunRecoil = {
    gunRecoilUp = { 0, 0 },
    gunRecoilTilt = { 0, 0 },
    gunRecoilLeft = { 0, 0 },
    gunRecoilRight = { 0, 0 }
};
u1.AimRecoilReduction = 1;
u1.AimSpreadReduction = 1;
u1.MinRecoilPower = 1;
u1.MaxRecoilPower = 1;
u1.RecoilPowerStepAmount = 1;
u1.MinSpread = 1;
u1.MaxSpread = 1;
u1.AimInaccuracyStepAmount = 1;
u1.AimInaccuracyDecrease = 100;
u1.WalkMult = 1;
u1.EnableZeroing = false;
u1.MaxZero = 500;
u1.ZeroIncrement = 50;
u1.CurrentZero = 0;
u1.BulletType = "5.56x45mm";
u1.MuzzleVelocity = 1500;
u1.BulletDrop = 0.25;
u1.Tracer = true;
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
u1.MainCFrame = CFrame.new(0, -0.5, 0);
u1.GunModelFixed = true;
u1.GunCFrame = CFrame.new(-0.85, 0, 1.15) * CFrame.Angles(1.5707963267948966, 0, 0);
u1.LArmCFrame = CFrame.new(-1.5, -0.5, 1.15) * CFrame.Angles(1.5707963267948966, 0, 0);
u1.RArmCFrame = CFrame.new(1.15, -0.25, 1.15) * CFrame.Angles(1.5707963267948966, 0, 0);

function u1.EquipAnim(p2) -- Line: 122
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p2[1], TweenInfo.new(0), {
        C1 = (CFrame.new(1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p2[2], TweenInfo.new(0), {
        C1 = (CFrame.new(-1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    wait(0.25);
    TweenService:Create(p2[1], TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.5, -0.15, 0) * CFrame.Angles(3.0543261909900767, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p2[2], TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
    wait(0.5);
end;

function u1.UnEquipAnim(p3) -- Line: 132
    -- upvalues: TweenService (copy)
    TweenService:Create(p3[1], TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
        C1 = (CFrame.new(1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p3[2], TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
        C1 = (CFrame.new(-1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    wait(0.6);
end;

function u1.IdleAnim(p4) -- Line: 138
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p4[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.5, -0.15, 0) * CFrame.Angles(3.0543261909900767, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p4[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
end;

function u1.OnAimAnim(p5) -- Line: 145
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p5[1], TweenInfo.new(u1.ADS_Speed, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0, 0, 0) * CFrame.Angles(1.5707963267948966, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p5[2], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-1.5, -0.5, 1.15) * CFrame.Angles(1.5707963267948966, -1.5707963267948966, 0)):Inverse()
    }):Play();
end;

function u1.SprintAnim(p6) -- Line: 150
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p6[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.5, -0.15, 0) * CFrame.Angles(3.0543261909900767, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p6[2], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
end;

function u1.ReloadAnim(p7) -- Line: 155
end;

function u1.TacticalReloadAnim(p8) -- Line: 159
end;

function u1.PumpAnim(p9) -- Line: 163
end;

function u1.meleeAttack(p10) -- Line: 167
    -- upvalues: TweenService (copy)
    TweenService:Create(p10[1], TweenInfo.new(0.25), {
        C1 = (CFrame.new(1.15, -0.5, 1.5) * CFrame.Angles(1.5707963267948966, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p10[2], TweenInfo.new(0.15, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-1.5, -0.5, 1.15) * CFrame.Angles(1.5707963267948966, -1.5707963267948966, 0)):Inverse()
    }):Play();
    task.wait(0.15);
    TweenService:Create(p10[2], TweenInfo.new(0.175, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-1.5, -0.25, 0.25) * CFrame.Angles(1.7453292519943295, -1.3089969389957472, 0)):inverse()
    }):Play();
    task.wait(0.4);
    TweenService:Create(p10[2], TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-1.5, -0.35, 0.75) * CFrame.Angles(1.5707963267948966, -1.4835298641951802, 0)):inverse()
    }):Play();
    task.wait(0.2);
end;

function u1.GrenadeReady(p11) -- Line: 177
end;

function u1.GrenadeThrow(p12) -- Line: 181
end;

u1.SV_GunPos = CFrame.new(0, 0.25, 0.25) * CFrame.Angles(0, 3.141592653589793, -1.5707963267948966);

return u1;