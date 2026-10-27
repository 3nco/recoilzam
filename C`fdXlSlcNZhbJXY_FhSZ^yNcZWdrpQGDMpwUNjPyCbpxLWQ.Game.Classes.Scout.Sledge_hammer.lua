-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Scout.Sledge hammer
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Scout
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
    gunName = "Sledge hammer",
    Type = "Melee",
    EnableHUD = false,
    LeftHand = false,
    IncludeChamberedBullet = true,
    Ammo = 1,
    StoredAmmo = 1
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
u1.LimbDamage = { 5000, 5000 };
u1.TorsoDamage = { 5000, 5000 };
u1.HeadDamage = { 5000, 5000 };
u1.DamageFallOf = 1;
u1.MinDamage = 0;
u1.IgnoreProtection = true;
u1.BulletPenetration = 62.5;
u1.AttackDelay = 0.15;
u1.CrossHair = false;
u1.CenterDot = true;
u1.CrosshairOffset = 0;
u1.CanBreachDoor = true;
u1.DestructionSize = 3;
u1.DestructionLoop = 6;
u1.CanRun = false;
u1.SightAtt = "";
u1.BarrelAtt = "";
u1.UnderBarrelAtt = "";
u1.OtherAtt = "";
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
u1.AimInaccuracyStepAmount = 0;
u1.AimInaccuracyDecrease = 100;
u1.WalkMult = 0;
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
u1.GunCFrame = CFrame.new(0.15, 0.5, 0.85) * CFrame.Angles(1.5707963267948966, 0, 0);
u1.LArmCFrame = CFrame.new(-1, -0.85, -0.65) * CFrame.Angles(1.7453292519943295, 1.1344640137963142, 0.2617993877991494);
u1.RArmCFrame = CFrame.new(1, -0.85, -0.45) * CFrame.Angles(1.7453292519943295, 1.1344640137963142, -0.2617993877991494);

function u1.EquipAnim(p2) -- Line: 122
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

function u1.UnEquipAnim(p3) -- Line: 131
    -- upvalues: TweenService (copy)
    TweenService:Create(p3[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        C1 = (CFrame.new(1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p3[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        C1 = (CFrame.new(-1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    wait(0.25);
end;

function u1.IdleAnim(p4) -- Line: 137
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p4[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p4[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
end;

function u1.SprintAnim(p5) -- Line: 142
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p5[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p5[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
end;

function u1.ReloadAnim(p6) -- Line: 147
end;

function u1.TacticalReloadAnim(p7) -- Line: 151
end;

function u1.PumpAnim(p8) -- Line: 155
end;

function u1.meleeAttack(p9) -- Line: 159
    -- upvalues: TweenService (copy), u1 (copy)
    p9[4].Handle.Swing:Play();
    TweenService:Create(p9[1], TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {
        C1 = (CFrame.new(0.5, -1, -0.5) * CFrame.Angles(1.0471975511965976, 0.2617993877991494, 0.2617993877991494)):inverse()
    }):Play();
    TweenService:Create(p9[2], TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {
        C1 = (CFrame.new(-0.25, -0.8, -1.35) * CFrame.Angles(1.5707963267948966, 0.3490658503988659, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.65);
    TweenService:Create(p9[1], TweenInfo.new(0.45, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p9[2], TweenInfo.new(0.45, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
    wait(0.45);
end;

function u1.GrenadeReady(p10) -- Line: 169
end;

function u1.GrenadeThrow(p11) -- Line: 173
end;

u1.SV_GunPos = CFrame.new(-0.3, 0, 0) * CFrame.Angles(-1.5707963267948966, 0, 0);

return u1;