-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Cinder.P320
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Cinder
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

game:GetService("PhysicsService");
local Debris = game:GetService("Debris");
local TweenService = game:GetService("TweenService");
local u1 = {
    SlideEx = CFrame.new(0, 0, -0.3),
    SlideLock = true,
    PistolRecoil = true,
    canAim = true,
    Zoom = 60,
    gunName = "P320",
    Type = "Gun",
    EnableHUD = true,
    IncludeChamberedBullet = true,
    Ammo = 15,
    StoredAmmo = 75
};
u1.AmmoInGun = u1.Ammo;
u1.MaxStoredAmmo = 105;
u1.CanCheckMag = true;
u1.MagCount = true;
u1.ShellInsert = false;
u1.ShootRate = 1000;
u1.Bullets = 1;
u1.BurstShot = 3;
u1.ShootType = 1;
u1.FireModes = {
    ChangeFiremode = false,
    Semi = false,
    Burst = false,
    Auto = false
};
u1.LimbDamage = { 22, 11 };
u1.TorsoDamage = { 38, 19 };
u1.HeadDamage = { 250, 250 };
u1.DamageDropOff = { 25, 75 };
u1.ADS_Speed = 0.24;
u1.CrossHair = true;
u1.CenterDot = false;
u1.CrosshairOffset = 0;
u1.CanBreachDoor = false;
u1.CanRun = true;
u1.ReloadSound = "Pistol";
u1.SightAtt = "";
u1.BarrelAtt = "";
u1.UnderBarrelAtt = "";
u1.OtherAtt = "";
u1.Charm = "";
u1.AvaliableSight = {};
u1.AvaliableBarrel = { "Suppressor", "Muzzle Brake" };
u1.AvaliableUB = {};
u1.AvaliableOther = { "Laser" };
u1.SkinTable = {};
u1.CustomAtt = {
    Suppressor = "Suppressor B",
    ["Muzzle Brake"] = "Muzzle Brake B"
};
u1.camRecoil = {
    camRecoilUp = { 9, 9 },
    camRecoilTilt = { 0, 0 },
    camRecoilLeft = { 3, 6 },
    camRecoilRight = { 3, 6 }
};
u1.gunRecoil = {
    gunRecoilUp = { 30, 30 },
    gunRecoilTilt = { 25, 25 },
    gunRecoilLeft = { 10, 20 },
    gunRecoilRight = { 10, 20 }
};
u1.AimRecoilReduction = 1;
u1.AimSpreadReduction = 100;
u1.MinRecoilPower = 1;
u1.MaxRecoilPower = 1;
u1.RecoilPowerStepAmount = 1;
u1.MinSpread = 30;
u1.MaxSpread = 60;
u1.AimInaccuracyStepAmount = 1.5;
u1.AimInaccuracyDecrease = 100;
u1.WalkMult = 1.25;
u1.EnableZeroing = false;
u1.MaxZero = 500;
u1.ZeroIncrement = 50;
u1.CurrentZero = 0;
u1.BulletType = "9x19mm";
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
    -- upvalues: TweenService (copy)
    TweenService:Create(p5[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.5, -0.15, 0) * CFrame.Angles(3.0543261909900767, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p5[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    wait(0.25);
end;

function u1.ReloadAnim(p6) -- Line: 148
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

function u1.TacticalReloadAnim(p7) -- Line: 169
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
    p7[4].Bolt.SlideRelease:Play();

    for _, child in pairs(p7[4].Handle:GetChildren()) do
        if child:IsA("Motor6D") and string.match(child.Name, "Slide") then
            TweenService:Create(child, TweenInfo.new(0.05, Enum.EasingStyle.Linear), {
                C0 = CFrame.new():inverse()
            }):Play();
        end;
    end;

    wait(0.1);
end;

function u1.PumpAnim(p9) -- Line: 210
end;

function u1.meleeAttack(p10) -- Line: 214
end;

function u1.GrenadeReady(p11) -- Line: 218
end;

function u1.GrenadeThrow(p12) -- Line: 222
end;

u1.SV_GunPos = CFrame.new(-0.3, -0.2, -0.4) * CFrame.Angles(-1.5707963267948966, 0, 0);
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

return u1;