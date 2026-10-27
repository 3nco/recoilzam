-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Guard.SAIGA12
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Guard
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:35
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

game:GetService("PhysicsService");
local Debris = game:GetService("Debris");
local TweenService = game:GetService("TweenService");
local u1 = {
    SlideEx = CFrame.new(0, 0, -0.4),
    SlideLock = false,
    canAim = true,
    Zoom = 60,
    gunName = "SAIGA12",
    Type = "Gun",
    EnableHUD = true,
    IncludeChamberedBullet = true,
    Ammo = 10,
    StoredAmmo = 70
};
u1.AmmoInGun = u1.Ammo;
u1.MaxStoredAmmo = 70;
u1.CanCheckMag = true;
u1.MagCount = true;
u1.ShellInsert = false;
u1.ShootRate = 600;
u1.Bullets = 8;
u1.BurstShot = 3;
u1.ShootType = 1;
u1.FireModes = {
    ChangeFiremode = true,
    Semi = true,
    Burst = false,
    Auto = false
};
u1.LimbDamage = { 26, 8 };
u1.TorsoDamage = { 26, 8 };
u1.HeadDamage = { 30, 12 };
u1.DamageDropOff = { 10, 60 };
u1.ADS_Speed = 0.36;
u1.CrossHair = true;
u1.CenterDot = false;
u1.CrosshairOffset = 0;
u1.CanBreachDoor = true;
u1.CanRun = true;
u1.ReloadSound = "AR";
u1.SightAtt = "";
u1.BarrelAtt = "";
u1.UnderBarrelAtt = "";
u1.OtherAtt = "";
u1.Charm = "";
u1.AvaliableSight = { "1x" };
u1.AvaliableBarrel = { "Suppressor" };
u1.AvaliableUB = { "Vertical Grip", "Angled Grip" };
u1.AvaliableOther = { "Laser" };
u1.SkinTable = {};
u1.CustomAtt = {
    Suppressor = "Suppressor E"
};
u1.camRecoil = {
    camRecoilUp = { 50, 65 },
    camRecoilTilt = { 150, 200 },
    camRecoilLeft = { 15, 30 },
    camRecoilRight = { 15, 30 }
};
u1.gunRecoil = {
    gunRecoilUp = { 75, 100 },
    gunRecoilTilt = { 20, 20 },
    gunRecoilLeft = { 60, 75 },
    gunRecoilRight = { 60, 75 }
};
u1.AimRecoilReduction = 1;
u1.AimSpreadReduction = 2;
u1.MinRecoilPower = 1;
u1.MaxRecoilPower = 1.5;
u1.RecoilPowerStepAmount = 0.1;
u1.MinSpread = 45;
u1.MaxSpread = 90;
u1.AimInaccuracyStepAmount = 10;
u1.AimInaccuracyDecrease = 100;
u1.WalkMult = 1.25;
u1.EnableZeroing = true;
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
u1.LArmCFrame = CFrame.new(-0.6, -0.25, -0.35) * CFrame.Angles(1.9198621771937625, 0.2617993877991494, 0.2617993877991494);
u1.RArmCFrame = CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.5707963267948966, 0, 0);
u1.VertGripCframe = CFrame.new(-0.55, -0.2, -0.35) * CFrame.Angles(1.5707963267948966, 0, 0.3490658503988659);
u1.AngGripCframe = CFrame.new(-0.4, -0.5, -0.45) * CFrame.Angles(1.9198621771937625, 0.7853981633974483, 0.2617993877991494);

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
    -- upvalues: TweenService (copy)
    TweenService:Create(p6[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 0.85) * CFrame.Angles(1.9198621771937625, -0.2617993877991494, 0)):inverse()
    }):Play();
    TweenService:Create(p6[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.65, 0, 0.2) * CFrame.Angles(1.9198621771937625, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.3);
    TweenService:Create(p6[1], TweenInfo.new(0.5, Enum.EasingStyle.Back), {
        C1 = (CFrame.new(0.05, -0.15, 0.85) * CFrame.Angles(1.7453292519943295, -0.08726646259971647, 0)):inverse()
    }):Play();
    TweenService:Create(p6[2], TweenInfo.new(0.25, Enum.EasingStyle.Back), {
        C1 = (CFrame.new(-0.75, -0.15, 1) * CFrame.Angles(1.0471975511965976, -0.08726646259971647, 0.2617993877991494)):inverse()
    }):Play();
    wait(0.05);
    p6[4].Handle.MagOut:Play();
    p6[4].Mag.Transparency = 1;
    wait(0.5);
    p6[4].Handle.AimUp:Play();
    wait(0.75);
    TweenService:Create(p6[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.65, 0, 0.2) * CFrame.Angles(1.9198621771937625, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.25);
    p6[4].Handle.MagIn:Play();
    TweenService:Create(p6[1], TweenInfo.new(0.15, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 0.85) * CFrame.Angles(1.7627825445142729, -0.10471975511965978, 0)):inverse()
    }):Play();
    p6[4].Mag.Transparency = 0;
    wait(0.2);
end;

function u1.TacticalReloadAnim(p7) -- Line: 171
    -- upvalues: u1 (copy), TweenService (copy), Debris (copy)
    local LArmCFrame = u1.LArmCFrame;

    if u1.BarrelAtt == "Vertical Grip" then
        LArmCFrame = u1.VertGripCframe;
    elseif u1.BarrelAtt == "Angled Grip" then
        LArmCFrame = u1.AngGripCframe;
    end;

    TweenService:Create(p7[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.8325957145940461, -0.08726646259971647, 0)):inverse()
    }):Play();
    TweenService:Create(p7[2], TweenInfo.new(0.25, Enum.EasingStyle.Back), {
        C1 = (CFrame.new(-0.75, -0.15, 0.5) * CFrame.Angles(1.0471975511965976, -0.08726646259971647, 0.2617993877991494)):inverse()
    }):Play();
    wait(0.5);
    p7[4].Handle.AimUp:Play();
    wait(0.25);
    TweenService:Create(p7[2], TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.75, 0, 0.25) * CFrame.Angles(2.792526803190927, -0.7853981633974483, 0.7853981633974483)):inverse()
    }):Play();
    wait(0.3);
    TweenService:Create(p7[2], TweenInfo.new(0.3, Enum.EasingStyle.Back), {
        C1 = (CFrame.new(-0.75, 0, -0.15) * CFrame.Angles(2.792526803190927, -0.7853981633974483, 0.7853981633974483)):inverse()
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
    v8.AssemblyAngularVelocity = Vector3.new(0, 25, 0);
    v8.AssemblyLinearVelocity = p7[4].Handle.CFrame.UpVector * 25 - p7[4].Handle.CFrame.RightVector * 10 + p7[4].Handle.CFrame.LookVector * 10;
    Debris:AddItem(v8, 3);
    wait(0.35);
    TweenService:Create(p7[2], TweenInfo.new(0.25, Enum.EasingStyle.Back), {
        C1 = (CFrame.new(-0.75, -0.15, 0.5) * CFrame.Angles(1.7453292519943295, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.2);
    p7[4].Handle.MagIn:Play();
    TweenService:Create(p7[1], TweenInfo.new(0.15, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.9198621771937625, -0.10471975511965978, 0)):inverse()
    }):Play();
    p7[4].Mag.Transparency = 0;
    wait(0.2);
    TweenService:Create(p7[2], TweenInfo.new(0.25, Enum.EasingStyle.Back), {
        C1 = (CFrame.new(-0.75, -0.15, 0.5) * CFrame.Angles(1.7453292519943295, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.05);
    TweenService:Create(p7[1], TweenInfo.new(0.1, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.9198621771937625, -0.08726646259971647, 0)):inverse()
    }):Play();
    wait(0.15);
    TweenService:Create(p7[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.5707963267948966, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p7[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = LArmCFrame:inverse()
    }):Play();
    wait(0.25);
    local WeldConstraint = Instance.new("WeldConstraint", p7[4]);
    WeldConstraint.Part0 = p7[4].Handle;
    WeldConstraint.Part1 = p7[5]["Left Arm"];
    p7[3].Part0 = nil;
    TweenService:Create(p7[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.3, 0.45, 0.15) * CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0)):inverse()
    }):Play();
    wait(0.3);
    p7[4].Bolt.SlidePull:Play();
    TweenService:Create(p7[4].Handle.Slide, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C0 = CFrame.new(0, 0, -0.4):inverse()
    }):Play();
    TweenService:Create(p7[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.3, 0.45, 0.65) * CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0)):inverse()
    }):Play();
    wait(0.3);
    p7[4].Bolt.SlideRelease:Play();
    TweenService:Create(p7[4].Handle.Slide, TweenInfo.new(0.15, Enum.EasingStyle.Linear), {
        C0 = CFrame.new():inverse()
    }):Play();
    TweenService:Create(p7[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.5707963267948966, 0, 0)):inverse()
    }):Play();
    wait(0.25);
    p7[3].Part0 = p7[5]["Right Arm"];
    WeldConstraint:Destroy();
end;

function u1.PumpAnim(p9) -- Line: 242
end;

function u1.meleeAttack(p10) -- Line: 246
end;

function u1.GrenadeReady(p11) -- Line: 250
end;

function u1.GrenadeThrow(p12) -- Line: 254
end;

u1.SV_GunPos = CFrame.new(-0.3, -0.2, -0.4) * CFrame.Angles(-1.5707963267948966, 0, 0);

return u1;