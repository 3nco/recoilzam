-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Ghost.M500
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Ghost
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:35
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

game:GetService("PhysicsService");
game:GetService("Debris");
local TweenService = game:GetService("TweenService");
local u1 = {
    SlideEx = CFrame.new(0, 0, -0.2),
    SlideLock = false,
    canAim = true,
    Zoom = 60,
    gunName = "M500",
    Type = "Gun",
    EnableHUD = true,
    IncludeChamberedBullet = false,
    Ammo = 8,
    StoredAmmo = 54
};
u1.AmmoInGun = u1.Ammo;
u1.MaxStoredAmmo = 54;
u1.CanCheckMag = false;
u1.MagCount = false;
u1.ShellInsert = true;
u1.ShootRate = 600;
u1.Bullets = 8;
u1.BurstShot = 3;
u1.ShootType = 4;
u1.FireModes = {
    ChangeFiremode = false,
    Semi = false,
    Burst = false,
    Auto = false
};
u1.LimbDamage = { 38, 18 };
u1.TorsoDamage = { 38, 18 };
u1.HeadDamage = { 42, 23 };
u1.DamageDropOff = { 20, 60 };
u1.ADS_Speed = 0.36;
u1.CrossHair = true;
u1.CenterDot = false;
u1.CrosshairOffset = 0;
u1.CanBreachDoor = true;
u1.CanRun = true;
u1.ReloadSound = "Shell";
u1.SightAtt = "";
u1.BarrelAtt = "";
u1.UnderBarrelAtt = "";
u1.OtherAtt = "";
u1.Charm = "";
u1.AvaliableSight = { "1x" };
u1.AvaliableBarrel = { "Suppressor" };
u1.AvaliableUB = {};
u1.AvaliableOther = { "Laser" };
u1.SkinTable = {};
u1.CustomAtt = {
    Suppressor = "Suppressor E"
};
u1.camRecoil = {
    camRecoilUp = { 45, 55 },
    camRecoilTilt = { 150, 200 },
    camRecoilLeft = { 15, 30 },
    camRecoilRight = { 15, 30 }
};
u1.gunRecoil = {
    gunRecoilUp = { 150, 175 },
    gunRecoilTilt = { 20, 20 },
    gunRecoilLeft = { 50, 60 },
    gunRecoilRight = { 50, 60 }
};
u1.AimRecoilReduction = 1;
u1.AimSpreadReduction = 2.75;
u1.MinRecoilPower = 1;
u1.MaxRecoilPower = 1;
u1.RecoilPowerStepAmount = 1;
u1.MinSpread = 35;
u1.MaxSpread = 90;
u1.AimInaccuracyStepAmount = 10;
u1.AimInaccuracyDecrease = 100;
u1.WalkMult = 1.25;
u1.EnableZeroing = false;
u1.MaxZero = 200;
u1.ZeroIncrement = 50;
u1.CurrentZero = 0;
u1.BulletType = ".12 Gauge";
u1.MuzzleVelocity = 1250;
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
u1.MainCFrame = CFrame.new(0.5, -0.85, -0.75);
u1.GunModelFixed = true;
u1.GunCFrame = CFrame.new(0.15, -0.2, 0.85) * CFrame.Angles(1.5707963267948966, 0, 0);
u1.LArmCFrame = CFrame.new(-0.6, -0.25, -1) * CFrame.Angles(1.9198621771937625, 0.2617993877991494, 0.2617993877991494);
u1.RArmCFrame = CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.5707963267948966, 0, 0);

function u1.EquipAnim(p2) -- Line: 120
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

function u1.UnEquipAnim(p3) -- Line: 129
    -- upvalues: TweenService (copy)
    TweenService:Create(p3[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        C1 = (CFrame.new(1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p3[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        C1 = (CFrame.new(-1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    wait(0.25);
end;

function u1.IdleAnim(p4) -- Line: 135
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p4[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p4[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
end;

function u1.SprintAnim(p5) -- Line: 140
    -- upvalues: TweenService (copy)
    TweenService:Create(p5[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.75, -0.15, 0) * CFrame.Angles(1.5707963267948966, 0.3490658503988659, -1.3089969389957472)):inverse()
    }):Play();
    TweenService:Create(p5[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-1.15, -0.75, 0.4) * CFrame.Angles(1.5707963267948966, 0.3490658503988659, 0.4363323129985824)):inverse()
    }):Play();
    wait(0.25);
end;

function u1.ReloadAnim(p6) -- Line: 146
    -- upvalues: TweenService (copy)
    TweenService:Create(p6[1], TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.9198621771937625, -0.2617993877991494, 0)):inverse()
    }):Play();
    TweenService:Create(p6[2], TweenInfo.new(0.25, Enum.EasingStyle.Back), {
        C1 = (CFrame.new(-1, -0.15, 0.5) * CFrame.Angles(1.0471975511965976, -0.08726646259971647, -0.2617993877991494)):inverse()
    }):Play();
    wait(0.3);
    TweenService:Create(p6[1], TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.9198621771937625, -0.2617993877991494, 0)):inverse()
    }):Play();
    TweenService:Create(p6[2], TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.4, -0.25, 0) * CFrame.Angles(2.0943951023931953, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.2);
    TweenService:Create(p6[1], TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.9198621771937625, -0.2617993877991494, 0)):inverse()
    }):Play();
    TweenService:Create(p6[2], TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.4, -0.15, 0) * CFrame.Angles(2.0943951023931953, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    p6[4].Handle.MagIn:Play();
    wait(0.2);
end;

function u1.TacticalReloadAnim(p7) -- Line: 159
    -- upvalues: TweenService (copy)
    TweenService:Create(p7[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.5707963267948966, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p7[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.6, -0.25, -0.25) * CFrame.Angles(1.9198621771937625, 0.2617993877991494, 0.2617993877991494)):inverse()
    }):Play();
    TweenService:Create(p7[4].Handle.Bolt, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C0 = CFrame.new(0, 0, -0.4):inverse()
    }):Play();
    p7[4].Bolt.SlidePull:Play();
    wait(0.25);
    local WeldConstraint = Instance.new("WeldConstraint", p7[4]);
    WeldConstraint.Part0 = p7[4].Handle;
    WeldConstraint.Part1 = p7[5]["Left Arm"];
    p7[3].Part0 = nil;
    TweenService:Create(p7[1], TweenInfo.new(0.25, Enum.EasingStyle.Back), {
        C1 = (CFrame.new(0.75, -0.75, 0) * CFrame.Angles(1.0471975511965976, 0.3490658503988659, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.35);
    TweenService:Create(p7[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.2, 0.2, 0.75) * CFrame.Angles(1.5707963267948966, 0.4363323129985824, 0)):inverse()
    }):Play();
    wait(0.25);
    p7[4].Handle.MagIn:Play();
    TweenService:Create(p7[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.2, 0.2, 0.7) * CFrame.Angles(1.5707963267948966, 0.4363323129985824, 0)):inverse()
    }):Play();
    wait(0.25);
    TweenService:Create(p7[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.5707963267948966, 0, 0)):inverse()
    }):Play();
    wait(0.25);
    p7[3].Part0 = p7[5]["Right Arm"];
    WeldConstraint:Destroy();
    p7[4].Bolt.SlideRelease:Play();
    TweenService:Create(p7[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.5707963267948966, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p7[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.6, -0.25, -1) * CFrame.Angles(1.9198621771937625, 0.2617993877991494, 0.2617993877991494)):inverse()
    }):Play();
    TweenService:Create(p7[4].Handle.Bolt, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C0 = CFrame.new():inverse()
    }):Play();
    wait(0.25);
end;

function u1.PumpAnim(p8) -- Line: 192
    -- upvalues: TweenService (copy)
    TweenService:Create(p8[1], TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.5707963267948966, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p8[2], TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.6, -0.25, -1) * CFrame.Angles(1.9198621771937625, 0.2617993877991494, 0.2617993877991494)):inverse()
    }):Play();
    TweenService:Create(p8[4].Handle.Bolt, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
        C0 = CFrame.new():inverse()
    }):Play();
    wait(0.2);
    TweenService:Create(p8[1], TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.5707963267948966, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p8[2], TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.6, -0.25, -0.25) * CFrame.Angles(1.9198621771937625, 0.2617993877991494, 0.2617993877991494)):inverse()
    }):Play();
    TweenService:Create(p8[4].Handle.Bolt, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
        C0 = CFrame.new(0, 0, -0.4):inverse()
    }):Play();
    p8[4].Bolt.SlidePull:Play();
    wait(0.2);
    p8[4].Bolt.SlideRelease:Play();
    TweenService:Create(p8[1], TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.5707963267948966, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p8[2], TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.6, -0.25, -1) * CFrame.Angles(1.9198621771937625, 0.2617993877991494, 0.2617993877991494)):inverse()
    }):Play();
    TweenService:Create(p8[4].Handle.Bolt, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
        C0 = CFrame.new():inverse()
    }):Play();
    wait(0.2);
end;

function u1.meleeAttack(p9) -- Line: 209
end;

function u1.GrenadeReady(p10) -- Line: 213
end;

function u1.GrenadeThrow(p11) -- Line: 217
end;

u1.SV_GunPos = CFrame.new(-0.3, -0.2, -0.4) * CFrame.Angles(-1.5707963267948966, 0, 0);

return u1;