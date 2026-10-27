-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Onibi.MINIMI 762
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Onibi
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:35
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

game:GetService("PhysicsService");
game:GetService("Debris");
local TweenService = game:GetService("TweenService");
local u1 = {
    SlideEx = CFrame.new(0, 0, -0.4),
    SlideLock = false,
    canAim = true,
    Zoom = 60,
    gunName = "MINIMI 762",
    Type = "Gun",
    EnableHUD = true,
    IncludeChamberedBullet = false,
    Ammo = 100,
    StoredAmmo = 200
};
u1.AmmoInGun = u1.Ammo;
u1.MaxStoredAmmo = 300;
u1.CanCheckMag = true;
u1.MagCount = true;
u1.ShellInsert = false;
u1.ShootRate = 650;
u1.Bullets = 1;
u1.BurstShot = 3;
u1.ShootType = 3;
u1.FireModes = {
    ChangeFiremode = true,
    Semi = true,
    Burst = false,
    Auto = true
};
u1.LimbDamage = { 24, 12 };
u1.TorsoDamage = { 48, 24 };
u1.HeadDamage = { 250, 250 };
u1.DamageDropOff = { 50, 125 };
u1.ADS_Speed = 0.5;
u1.CrossHair = true;
u1.CenterDot = false;
u1.CrosshairOffset = 0;
u1.CanBreachDoor = true;
u1.CanRun = true;
u1.ReloadSound = "Belt";
u1.SightAtt = "";
u1.BarrelAtt = "";
u1.UnderBarrelAtt = "";
u1.OtherAtt = "";
u1.Charm = "";
u1.AvaliableSight = { "1x", "2x", "2.5x" };
u1.AvaliableBarrel = { "Suppressor", "Compensator" };
u1.AvaliableUB = { "Vertical Grip", "Angled Grip" };
u1.AvaliableOther = { "Laser" };
u1.SkinTable = {};
u1.CustomAtt = {
    Suppressor = "Suppressor C"
};
u1.camRecoil = {
    camRecoilUp = { 28, 28 },
    camRecoilTilt = { 75, 75 },
    camRecoilLeft = { 6, 8 },
    camRecoilRight = { 8, 12 }
};
u1.gunRecoil = {
    gunRecoilUp = { 27, 33 },
    gunRecoilTilt = { 10, 10 },
    gunRecoilLeft = { 15, 20 },
    gunRecoilRight = { 16, 24 }
};
u1.AimRecoilReduction = 4;
u1.AimSpreadReduction = 25;
u1.MinRecoilPower = 0.5;
u1.MaxRecoilPower = 1.5;
u1.RecoilPowerStepAmount = 0.05;
u1.MinSpread = 25;
u1.MaxSpread = 100;
u1.AimInaccuracyStepAmount = 1.75;
u1.AimInaccuracyDecrease = 100;
u1.WalkMult = 7;
u1.EnableZeroing = true;
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
u1.MainCFrame = CFrame.new(0.5, -0.85, -0.75);
u1.GunModelFixed = true;
u1.GunCFrame = CFrame.new(0.15, -0.2, 0.85) * CFrame.Angles(1.5707963267948966, 0, 0);
u1.LArmCFrame = CFrame.new(-0.6, -0.25, -0.35) * CFrame.Angles(1.9198621771937625, 0.2617993877991494, 0.2617993877991494);
u1.RArmCFrame = CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.5707963267948966, 0, 0);
u1.VertGripCframe = CFrame.new(-0.65, -0.25, 0) * CFrame.Angles(1.5707963267948966, 0, 0.5235987755982988);
u1.AngGripCframe = CFrame.new(-0.4, -0.35, -0.15) * CFrame.Angles(1.9198621771937625, 0.7853981633974483, 0.2617993877991494);

function u1.EquipAnim(p2) -- Line: 124
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

function u1.UnEquipAnim(p3) -- Line: 133
    -- upvalues: TweenService (copy)
    TweenService:Create(p3[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        C1 = (CFrame.new(1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p3[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        C1 = (CFrame.new(-1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    wait(0.25);
end;

function u1.IdleAnim(p4) -- Line: 139
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p4[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p4[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
end;

function u1.SprintAnim(p5) -- Line: 144
    -- upvalues: TweenService (copy)
    TweenService:Create(p5[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.75, -0.15, 0) * CFrame.Angles(1.5707963267948966, 0.3490658503988659, -1.3089969389957472)):inverse()
    }):Play();
    TweenService:Create(p5[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-1.15, -0.75, 0.4) * CFrame.Angles(1.5707963267948966, 0.3490658503988659, 0.4363323129985824)):inverse()
    }):Play();
    wait(0.25);
end;

function u1.ReloadAnim(p6) -- Line: 150
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p6[1], TweenInfo.new(0.15, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p6[2], TweenInfo.new(0.15, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
    wait(0.2);
    local WeldConstraint = Instance.new("WeldConstraint", p6[4]);
    WeldConstraint.Part0 = p6[4].Handle;
    WeldConstraint.Part1 = p6[5]["Left Arm"];
    p6[3].Part0 = nil;
    TweenService:Create(p6[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.35, 0.45, 0.15) * CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0)):inverse()
    }):Play();
    wait(0.3);
    p6[4].Bolt.SlidePull:Play();
    TweenService:Create(p6[4].Handle.Slide, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
        C0 = CFrame.new(0, 0, -0.4):inverse()
    }):Play();
    TweenService:Create(p6[4].Handle.Bolt, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
        C0 = CFrame.new(0, 0, -0.4):inverse()
    }):Play();
    TweenService:Create(p6[1], TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.35, 0.45, 0.65) * CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0)):inverse()
    }):Play();
    wait(0.35);
    p6[4].Bolt.SlideRelease:Play();
    TweenService:Create(p6[4].Handle.Slide, TweenInfo.new(0.15, Enum.EasingStyle.Linear), {
        C0 = CFrame.new():inverse()
    }):Play();
    TweenService:Create(p6[4].Handle.Bolt, TweenInfo.new(0.15, Enum.EasingStyle.Linear), {
        C0 = CFrame.new():inverse()
    }):Play();
    TweenService:Create(p6[1], TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    wait(0.35);
    p6[3].Part0 = p6[5]["Right Arm"];
    WeldConstraint:Destroy();
    wait(0.15);
    TweenService:Create(p6[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.3089969389957472, 0.2617993877991494, 0)):inverse()
    }):Play();
    TweenService:Create(p6[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.85, -0.15, 0.5) * CFrame.Angles(1.9198621771937625, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.25);
    TweenService:Create(p6[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.3962634015954636, 0.2617993877991494, 0)):inverse()
    }):Play();
    TweenService:Create(p6[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.85, -0.15, 0.5) * CFrame.Angles(1.3089969389957472, 0, 0)):inverse()
    }):Play();
    p6[4].Bullets.Transparency = 1;
    p6[4].Casings.Transparency = 1;
    p6[4].Belt.Transparency = 1;
    wait(0.3);
    TweenService:Create(p6[1], TweenInfo.new(1, Enum.EasingStyle.Back), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.5707963267948966, -0.08726646259971647, 0)):inverse()
    }):Play();
    TweenService:Create(p6[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.75, -0.15, 0.5) * CFrame.Angles(1.0471975511965976, -0.08726646259971647, 0.2617993877991494)):inverse()
    }):Play();
    wait(0.05);
    p6[4].Handle.MagOut:Play();
    p6[4].Mag.Transparency = 1;
    local v7 = 0;

    for _, child in pairs(p6[4].Mag:GetChildren()) do
        if child:IsA("Texture") then
            v7 = child.Transparency;
            child.Transparency = 1;
        end;
    end;

    wait(0.5);
    p6[4].Handle.AimUp:Play();
    wait(0.75);
    TweenService:Create(p6[2], TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.75, -0.5, 0.25) * CFrame.Angles(1.5707963267948966, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.25);
    p6[4].Handle.MagIn:Play();
    TweenService:Create(p6[1], TweenInfo.new(0.15, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.7627825445142729, -0.10471975511965978, 0)):inverse()
    }):Play();
    p6[4].Mag.Transparency = 0;

    for _, child in pairs(p6[4].Mag:GetChildren()) do
        if child:IsA("Texture") then
            child.Transparency = v7;
        end;
    end;

    wait(0.2);
    TweenService:Create(p6[2], TweenInfo.new(0.15, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.75, -0.5, 0.25) * CFrame.Angles(1.0471975511965976, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.25);
    TweenService:Create(p6[2], TweenInfo.new(0.1, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.75, -0.5, 0.25) * CFrame.Angles(1.7453292519943295, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.05);
    TweenService:Create(p6[1], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.3089969389957472, 0.2617993877991494, 0)):inverse()
    }):Play();
    TweenService:Create(p6[2], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.85, -0.15, 0.5) * CFrame.Angles(1.3089969389957472, 0, 0.2617993877991494)):inverse()
    }):Play();
    wait(0.45);
    TweenService:Create(p6[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.3962634015954636, 0.2617993877991494, 0)):inverse()
    }):Play();
    TweenService:Create(p6[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.85, -0.15, 0.5) * CFrame.Angles(1.9198621771937625, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    p6[4].Bullets.Transparency = 0;
    p6[4].Casings.Transparency = 0;
    p6[4].Belt.Transparency = 0;
    wait(0.3);
    TweenService:Create(p6[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p6[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
    wait(0.25);
end;

function u1.TacticalReloadAnim(p8) -- Line: 248
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p8[1], TweenInfo.new(0.15, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p8[2], TweenInfo.new(0.15, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
    wait(0.2);
    local WeldConstraint = Instance.new("WeldConstraint", p8[4]);
    WeldConstraint.Part0 = p8[4].Handle;
    WeldConstraint.Part1 = p8[5]["Left Arm"];
    p8[3].Part0 = nil;
    TweenService:Create(p8[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.35, 0.45, 0.15) * CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0)):inverse()
    }):Play();
    wait(0.3);
    p8[4].Bolt.SlidePull:Play();
    TweenService:Create(p8[4].Handle.Slide, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
        C0 = CFrame.new(0, 0, -0.4):inverse()
    }):Play();
    TweenService:Create(p8[4].Handle.Bolt, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
        C0 = CFrame.new(0, 0, -0.4):inverse()
    }):Play();
    TweenService:Create(p8[1], TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.35, 0.45, 0.65) * CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0)):inverse()
    }):Play();
    wait(0.35);
    p8[4].Bolt.SlideRelease:Play();
    TweenService:Create(p8[4].Handle.Slide, TweenInfo.new(0.15, Enum.EasingStyle.Linear), {
        C0 = CFrame.new():inverse()
    }):Play();
    TweenService:Create(p8[4].Handle.Bolt, TweenInfo.new(0.15, Enum.EasingStyle.Linear), {
        C0 = CFrame.new():inverse()
    }):Play();
    TweenService:Create(p8[1], TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    wait(0.35);
    p8[3].Part0 = p8[5]["Right Arm"];
    WeldConstraint:Destroy();
    wait(0.15);
    TweenService:Create(p8[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.3089969389957472, 0.2617993877991494, 0)):inverse()
    }):Play();
    TweenService:Create(p8[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.85, -0.15, 0.5) * CFrame.Angles(1.9198621771937625, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.25);
    TweenService:Create(p8[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.3962634015954636, 0.2617993877991494, 0)):inverse()
    }):Play();
    TweenService:Create(p8[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.85, -0.15, 0.5) * CFrame.Angles(1.3089969389957472, 0, 0)):inverse()
    }):Play();
    p8[4].Bullets.Transparency = 1;
    p8[4].Casings.Transparency = 1;
    p8[4].Belt.Transparency = 1;
    wait(0.3);
    TweenService:Create(p8[1], TweenInfo.new(1, Enum.EasingStyle.Back), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.5707963267948966, -0.08726646259971647, 0)):inverse()
    }):Play();
    TweenService:Create(p8[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.75, -0.15, 0.5) * CFrame.Angles(1.0471975511965976, -0.08726646259971647, 0.2617993877991494)):inverse()
    }):Play();
    wait(0.05);
    p8[4].Handle.MagOut:Play();
    p8[4].Mag.Transparency = 1;
    local v9 = 0;

    for _, child in pairs(p8[4].Mag:GetChildren()) do
        if child:IsA("Texture") then
            v9 = child.Transparency;
            child.Transparency = 1;
        end;
    end;

    wait(0.5);
    p8[4].Handle.AimUp:Play();
    wait(0.75);
    TweenService:Create(p8[2], TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.75, -0.5, 0.25) * CFrame.Angles(1.5707963267948966, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.25);
    p8[4].Handle.MagIn:Play();
    TweenService:Create(p8[1], TweenInfo.new(0.15, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.7627825445142729, -0.10471975511965978, 0)):inverse()
    }):Play();
    p8[4].Mag.Transparency = 0;

    for _, child in pairs(p8[4].Mag:GetChildren()) do
        if child:IsA("Texture") then
            child.Transparency = v9;
        end;
    end;

    wait(0.2);
    TweenService:Create(p8[2], TweenInfo.new(0.15, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.75, -0.5, 0.25) * CFrame.Angles(1.0471975511965976, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.25);
    TweenService:Create(p8[2], TweenInfo.new(0.1, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.75, -0.5, 0.25) * CFrame.Angles(1.7453292519943295, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.05);
    TweenService:Create(p8[1], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.3089969389957472, 0.2617993877991494, 0)):inverse()
    }):Play();
    TweenService:Create(p8[2], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.85, -0.15, 0.5) * CFrame.Angles(1.3089969389957472, 0, 0.2617993877991494)):inverse()
    }):Play();
    wait(0.45);
    TweenService:Create(p8[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.3962634015954636, 0.2617993877991494, 0)):inverse()
    }):Play();
    TweenService:Create(p8[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.85, -0.15, 0.5) * CFrame.Angles(1.9198621771937625, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    p8[4].Bullets.Transparency = 0;
    p8[4].Casings.Transparency = 0;
    p8[4].Belt.Transparency = 0;
    wait(0.3);
    TweenService:Create(p8[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p8[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
    wait(0.25);
end;

function u1.PumpAnim(p10) -- Line: 346
end;

function u1.meleeAttack(p11) -- Line: 350
end;

function u1.GrenadeReady(p12) -- Line: 354
end;

function u1.GrenadeThrow(p13) -- Line: 358
end;

u1.SV_GunPos = CFrame.new(-0.3, -0.1, -0.4) * CFrame.Angles(-1.5707963267948966, 0, 0);

return u1;