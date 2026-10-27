-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Recruit.MAC10
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Recruit
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

game:GetService("PhysicsService");
local Debris = game:GetService("Debris");
local TweenService = game:GetService("TweenService");
local u1 = {
    SlideEx = CFrame.new(0, 0, 0.3),
    SlideLock = true,
    canAim = true,
    Zoom = 60,
    gunName = "MAC10",
    Type = "Gun",
    EnableHUD = true,
    IncludeChamberedBullet = false,
    Ammo = 16,
    StoredAmmo = 80
};
u1.AmmoInGun = u1.Ammo;
u1.MaxStoredAmmo = 112;
u1.CanCheckMag = true;
u1.MagCount = true;
u1.ShellInsert = false;
u1.ShootRate = 1090;
u1.Bullets = 1;
u1.BurstShot = 3;
u1.ShootType = 3;
u1.FireModes = {
    ChangeFiremode = false,
    Semi = false,
    Burst = false,
    Auto = false
};
u1.LimbDamage = { 17, 8 };
u1.TorsoDamage = { 35, 17 };
u1.HeadDamage = { 250, 250 };
u1.DamageDropOff = { 25, 75 };
u1.ADS_Speed = 0.32;
u1.CrossHair = true;
u1.CenterDot = false;
u1.CrosshairOffset = 0;
u1.CanBreachDoor = false;
u1.CanRun = true;
u1.ReloadSound = "Pistol";
u1.SightAtt = "Reflex A";
u1.BarrelAtt = "Compensator";
u1.UnderBarrelAtt = "Vertical Grip";
u1.OtherAtt = "";
u1.Charm = "";
u1.AvaliableSight = { "1x" };
u1.AvaliableBarrel = { "Suppressor", "Compensator", "Flash Hider", "Extended Barrel" };
u1.AvaliableUB = { "Vertical Grip" };
u1.AvaliableOther = { "Laser" };
u1.SkinTable = {};
u1.CustomAtt = {
    Suppressor = "Suppressor D",
    ["Flash Hider"] = "Flash Hider B"
};
u1.camRecoil = {
    camRecoilUp = { 35, 35 },
    camRecoilTilt = { 34, 34 },
    camRecoilLeft = { 9, 18 },
    camRecoilRight = { 9, 18 }
};
u1.gunRecoil = {
    gunRecoilUp = { 15, 25 },
    gunRecoilTilt = { 10, 10 },
    gunRecoilLeft = { 6, 12 },
    gunRecoilRight = { 6, 12 }
};
u1.AimRecoilReduction = 2;
u1.AimSpreadReduction = 100;
u1.MinRecoilPower = 0.25;
u1.MaxRecoilPower = 1;
u1.RecoilPowerStepAmount = 0.035;
u1.MinSpread = 30;
u1.MaxSpread = 60;
u1.AimInaccuracyStepAmount = 1.5;
u1.AimInaccuracyDecrease = 100;
u1.WalkMult = 1.25;
u1.EnableZeroing = false;
u1.MaxZero = 500;
u1.ZeroIncrement = 50;
u1.CurrentZero = 0;
u1.BulletType = ".45 ACP";
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
u1.LArmCFrame = CFrame.new(-0.5, -0.25, 0.55) * CFrame.Angles(1.5707963267948966, 0.4363323129985824, 0.2617993877991494);
u1.RArmCFrame = CFrame.new(0.05, 0, 0.65) * CFrame.Angles(1.5707963267948966, 0, 0);
u1.VertGripCframe = CFrame.new(-0.65, -0.05, 0.1) * CFrame.Angles(1.5707963267948966, 0, 0.4363323129985824);
u1.AngGripCframe = CFrame.new(-0.4, -0.35, -0.15) * CFrame.Angles(1.9198621771937625, 0.7853981633974483, 0.2617993877991494);

function u1.EquipAnim(p2) -- Line: 125
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

function u1.UnEquipAnim(p3) -- Line: 134
    -- upvalues: TweenService (copy)
    TweenService:Create(p3[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        C1 = (CFrame.new(1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p3[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        C1 = (CFrame.new(-1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    wait(0.25);
end;

function u1.IdleAnim(p4) -- Line: 140
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p4[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p4[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
end;

function u1.SprintAnim(p5) -- Line: 145
    -- upvalues: TweenService (copy)
    TweenService:Create(p5[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.5, -0.15, 0) * CFrame.Angles(3.0543261909900767, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p5[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    wait(0.25);
end;

function u1.ReloadAnim(p6) -- Line: 151
    -- upvalues: TweenService (copy)
    TweenService:Create(p6[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0, -0.15, 0) * CFrame.Angles(1.5707963267948966, -0.4363323129985824, 0)):inverse()
    }):Play();
    TweenService:Create(p6[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.6, -0.3, 0) * CFrame.Angles(1.0471975511965976, 0.8726646259971648, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.3);
    TweenService:Create(p6[1], TweenInfo.new(0.5, Enum.EasingStyle.Back), {
        C1 = (CFrame.new(0, -0.15, 0) * CFrame.Angles(1.4835298641951802, -0.2617993877991494, 0)):inverse()
    }):Play();
    TweenService:Create(p6[2], TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-1.5, -0.5, 0.75) * CFrame.Angles(0, 0.8726646259971648, 0.2617993877991494)):inverse()
    }):Play();
    wait(0.05);
    p6[4].Handle.MagOut:Play();
    p6[4].Mag.Transparency = 1;
    wait(0.5);
    p6[4].Handle.AimUp:Play();
    wait(0.75);
    TweenService:Create(p6[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.6, -0.3, 0) * CFrame.Angles(1.0471975511965976, 0.8726646259971648, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.25);
    p6[4].Handle.MagIn:Play();
    TweenService:Create(p6[1], TweenInfo.new(0.15, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0, -0.15, 0) * CFrame.Angles(1.5707963267948966, -0.4363323129985824, 0)):inverse()
    }):Play();
    p6[4].Mag.Transparency = 0;
    wait(0.15);
end;

function u1.TacticalReloadAnim(p7) -- Line: 172
    -- upvalues: TweenService (copy), Debris (copy)
    TweenService:Create(p7[1], TweenInfo.new(0.25, Enum.EasingStyle.Back), {
        C1 = (CFrame.new(0, -0.15, 0) * CFrame.Angles(1.6580627893946132, 0.7853981633974483, 0)):inverse()
    }):Play();
    TweenService:Create(p7[2], TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-1.5, -1, 1) * CFrame.Angles(0, 0.8726646259971648, 0.2617993877991494)):inverse()
    }):Play();
    wait(0.2);
    TweenService:Create(p7[1], TweenInfo.new(0.5, Enum.EasingStyle.Back), {
        C1 = (CFrame.new(0, -0.15, 0) * CFrame.Angles(1.4835298641951802, -0.4363323129985824, 0)):inverse()
    }):Play();
    p7[4].Handle.MagOut:Play();
    p7[4].Mag.Transparency = 1;
    local v8 = p7[4]:WaitForChild("Mag"):Clone();
    v8.Name = "FakeMag";
    v8:ClearAllChildren();
    v8.CollisionGroup = "Drone";
    v8.CanCollide = true;
    v8.Transparency = 0;
    v8.Parent = p7[4];
    v8.Anchored = false;
    v8.AssemblyLinearVelocity = -p7[4].Handle.CFrame.UpVector * 25;
    Debris:AddItem(v8, 3);
    wait(0.5);
    p7[4].Handle.AimUp:Play();
    wait(0.25);
    TweenService:Create(p7[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.6, -0.3, 0) * CFrame.Angles(1.0471975511965976, 0.8726646259971648, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.25);
    p7[4].Handle.MagIn:Play();
    TweenService:Create(p7[1], TweenInfo.new(0.15, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0, -0.15, 0) * CFrame.Angles(1.5707963267948966, -0.4363323129985824, 0)):inverse()
    }):Play();
    p7[4].Mag.Transparency = 0;
    wait(0.25);
    TweenService:Create(p7[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = CFrame.new(-0.05, -0.6, -0.4) * CFrame.Angles(1.5707963267948966, 0.2617993877991494, 0):Inverse()
    }):Play();
    TweenService:Create(p7[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-1, 0.05, -0.15) * CFrame.Angles(3.141592653589793, -0.4363323129985824, 1.2217304763960306)):inverse()
    }):Play();
    wait(0.3);
    p7[4].Bolt.SlideRelease:Play();
    TweenService:Create(p7[4].Handle.Slide, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
        C0 = CFrame.new():inverse()
    }):Play();
    TweenService:Create(p7[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = CFrame.new(-0.05, -0.6, -0.4) * CFrame.Angles(1.6580627893946132, 0.2617993877991494, 0):Inverse()
    }):Play();
    TweenService:Create(p7[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-1, 0.05, 0.25) * CFrame.Angles(3.141592653589793, -0.4363323129985824, 1.2217304763960306)):inverse()
    }):Play();
    wait(0.3);
end;

function u1.PumpAnim(p9) -- Line: 213
end;

function u1.meleeAttack(p10) -- Line: 217
end;

function u1.GrenadeReady(p11) -- Line: 221
end;

function u1.GrenadeThrow(p12) -- Line: 225
end;

u1.SV_GunPos = CFrame.new(-0.3, -0.2, -0.4) * CFrame.Angles(-1.5707963267948966, 0, 0);

return u1;