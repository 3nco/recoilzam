-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Loch.L2A3
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Loch
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:35
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

game:GetService("PhysicsService");
local Debris = game:GetService("Debris");
local TweenService = game:GetService("TweenService");
local u1 = {
    SlideEx = CFrame.new(0, 0, -0.45),
    SlideLock = true,
    canAim = true,
    Zoom = 60,
    gunName = "L2A3",
    Type = "Gun",
    EnableHUD = true,
    IncludeChamberedBullet = true,
    Ammo = 34,
    StoredAmmo = 136
};
u1.AmmoInGun = u1.Ammo;
u1.MaxStoredAmmo = 238;
u1.CanCheckMag = true;
u1.MagCount = true;
u1.ShellInsert = false;
u1.ShootRate = 575;
u1.Bullets = 1;
u1.BurstShot = 3;
u1.ShootType = 3;
u1.FireModes = {
    ChangeFiremode = true,
    Semi = true,
    Burst = false,
    Auto = true
};
u1.LimbDamage = { 19, 9 };
u1.TorsoDamage = { 37, 18 };
u1.HeadDamage = { 250, 250 };
u1.DamageDropOff = { 25, 75 };
u1.ADS_Speed = 0.32;
u1.CrossHair = true;
u1.CenterDot = false;
u1.CrosshairOffset = 0;
u1.CanBreachDoor = false;
u1.CanRun = true;
u1.ReloadSound = "SMG";
u1.SightAtt = "";
u1.BarrelAtt = "";
u1.UnderBarrelAtt = "";
u1.OtherAtt = "";
u1.Charm = "";
u1.AvaliableSight = { "1x", "1.5x", "2.5x" };
u1.AvaliableBarrel = { "Suppressor", "Compensator", "Muzzle Brake", "Flash Hider", "Extended Barrel" };
u1.AvaliableUB = { "Vertical Grip", "Angled Grip" };
u1.AvaliableOther = { "Laser" };
u1.SkinTable = {};
u1.CustomAtt = {
    Suppressor = "Suppressor D",
    ["Muzzle Brake"] = "Muzzle Brake B",
    ["Flash Hider"] = "Flash Hider B"
};
u1.camRecoil = {
    camRecoilUp = { 20, 20 },
    camRecoilTilt = { 0, 0 },
    camRecoilLeft = { 4, 8 },
    camRecoilRight = { 4, 8 }
};
u1.gunRecoil = {
    gunRecoilUp = { 20, 25 },
    gunRecoilTilt = { 15, 25 },
    gunRecoilLeft = { 7, 14 },
    gunRecoilRight = { 7, 14 }
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
u1.EnableZeroing = true;
u1.MaxZero = 200;
u1.ZeroIncrement = 50;
u1.CurrentZero = 0;
u1.BulletType = "9x19mm";
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
u1.GunCFrame = CFrame.new(0.15, -0.2, 1) * CFrame.Angles(1.5707963267948966, 0, 0);
u1.LArmCFrame = CFrame.new(-0.4, -0.45, -0.5) * CFrame.Angles(1.9198621771937625, 0.7853981633974483, 0.2617993877991494);
u1.RArmCFrame = CFrame.new(0.05, -0.15, 0.5) * CFrame.Angles(1.5707963267948966, 0, 0);
u1.VertGripCframe = CFrame.new(-0.55, -0.15, -0.3) * CFrame.Angles(1.5707963267948966, 0, 0.3490658503988659);
u1.AngGripCframe = CFrame.new(-0.4, -0.5, -0.4) * CFrame.Angles(1.9198621771937625, 0.7853981633974483, 0.2617993877991494);

function u1.EquipAnim(p2) -- Line: 126
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

function u1.UnEquipAnim(p3) -- Line: 135
    -- upvalues: TweenService (copy)
    TweenService:Create(p3[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        C1 = (CFrame.new(1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p3[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        C1 = (CFrame.new(-1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    wait(0.25);
end;

function u1.IdleAnim(p4) -- Line: 141
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p4[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p4[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
end;

function u1.SprintAnim(p5) -- Line: 146
    -- upvalues: TweenService (copy)
    TweenService:Create(p5[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.5, -0.15, 0) * CFrame.Angles(1.5707963267948966, 0.3490658503988659, -1.3089969389957472)):inverse()
    }):Play();
    TweenService:Create(p5[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-1.15, -0.75, 0.4) * CFrame.Angles(1.5707963267948966, 0.3490658503988659, 0.4363323129985824)):inverse()
    }):Play();
    wait(0.25);
end;

function u1.ReloadAnim(p6) -- Line: 152
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p6[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.25, -0.1, 0.75) * CFrame.Angles(1.5707963267948966, 0.6108652381980153, 0)):inverse()
    }):Play();
    TweenService:Create(p6[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.55, 0, 0.55) * CFrame.Angles(1.5707963267948966, -0.6108652381980153, 0)):inverse()
    }):Play();
    task.wait(0.3);
    TweenService:Create(p6[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.75, -0.1, 0.55) * CFrame.Angles(1.5707963267948966, -1.0471975511965976, 0)):inverse()
    }):Play();
    p6[4].Handle.MagOut:Play();
    p6[4].Mag.Transparency = 1;
    task.wait(0.25);
    TweenService:Create(p6[2], TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.75, -0.5, 0.25) * CFrame.Angles(1.0471975511965976, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    task.wait(0.5);
    p6[4].Handle.AimUp:Play();
    task.wait(0.75);
    TweenService:Create(p6[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.75, -0.1, 0.55) * CFrame.Angles(1.5707963267948966, -1.0471975511965976, 0)):inverse()
    }):Play();
    task.wait(0.25);
    p6[4].Handle.MagIn:Play();
    TweenService:Create(p6[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.55, 0, 0.55) * CFrame.Angles(1.5707963267948966, -0.6108652381980153, 0)):inverse()
    }):Play();
    p6[4].Mag.Transparency = 0;
    task.wait(0.25);
    TweenService:Create(p6[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p6[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
    task.wait(0.25);
end;

function u1.TacticalReloadAnim(p7) -- Line: 180
    -- upvalues: TweenService (copy), Debris (copy), u1 (copy)
    TweenService:Create(p7[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 0.75) * CFrame.Angles(1.5707963267948966, 0.2617993877991494, 0)):inverse()
    }):Play();
    TweenService:Create(p7[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.55, 0.1, 0.55) * CFrame.Angles(1.5707963267948966, -0.6108652381980153, 0)):inverse()
    }):Play();
    task.wait(0.3);
    TweenService:Create(p7[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-1.25, 0, 0.55) * CFrame.Angles(1.5707963267948966, -1.0471975511965976, 0)):inverse()
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
    v8.AssemblyLinearVelocity = -p7[4].Handle.CFrame.RightVector * 25;
    Debris:AddItem(v8, 3);
    task.wait(0.25);
    TweenService:Create(p7[1], TweenInfo.new(0.75, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.25, -0.1, 0.75) * CFrame.Angles(1.5707963267948966, 0.6108652381980153, 0)):inverse()
    }):Play();
    TweenService:Create(p7[2], TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.75, -0.5, 0.25) * CFrame.Angles(1.0471975511965976, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    task.wait(0.5);
    p7[4].Handle.AimUp:Play();
    task.wait(0.75);
    TweenService:Create(p7[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.75, -0.1, 0.55) * CFrame.Angles(1.5707963267948966, -1.0471975511965976, 0)):inverse()
    }):Play();
    task.wait(0.25);
    p7[4].Handle.MagIn:Play();
    TweenService:Create(p7[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.55, 0, 0.55) * CFrame.Angles(1.5707963267948966, -0.6108652381980153, 0)):inverse()
    }):Play();
    p7[4].Mag.Transparency = 0;
    task.wait(0.25);
    TweenService:Create(p7[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p7[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
    task.wait(0.25);
    local WeldConstraint = Instance.new("WeldConstraint", p7[4]);
    WeldConstraint.Part0 = p7[4].Handle;
    WeldConstraint.Part1 = p7[5]["Left Arm"];
    p7[3].Part0 = nil;
    TweenService:Create(p7[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.2, 0.45, 0.8) * CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0)):inverse()
    }):Play();
    wait(0.3);
    TweenService:Create(p7[4].Handle.Slide, TweenInfo.new(0.15, Enum.EasingStyle.Sine), {
        C0 = CFrame.new(0, 0, -0.5):inverse()
    }):Play();
    TweenService:Create(p7[1], TweenInfo.new(0.15, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.2, 0.45, 0.85) * CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0)):inverse()
    }):Play();
    wait(0.2);
    p7[4].Bolt.SlideRelease:Play();
    TweenService:Create(p7[4].Handle.Slide, TweenInfo.new(0.15, Enum.EasingStyle.Linear), {
        C0 = CFrame.new():inverse()
    }):Play();
    TweenService:Create(p7[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    wait(0.25);
    p7[3].Part0 = p7[5]["Right Arm"];
    WeldConstraint:Destroy();
    task.wait(0.05);
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
u1.SV_RightArmPos = CFrame.new(-0.9, 1.25, -0.35) * CFrame.Angles(-0.5235987755982988, 0, 0);
u1.SV_LeftArmPos = CFrame.new(1, 1, -1) * CFrame.Angles(-1.3962634015954636, 0.5235987755982988, -0.17453292519943295);
u1.SV_RightElbowPos = CFrame.new(0, -0.45, -0.25) * CFrame.Angles(-1.3962634015954636, 0, 0);
u1.SV_LeftElbowPos = CFrame.new(0, 0, -0.1) * CFrame.Angles(-0.2617993877991494, 0, 0);
u1.SV_RightWristPos = CFrame.new(0, 0, 0.15) * CFrame.Angles(0.3490658503988659, 0, 0);
u1.SV_LeftWristPos = CFrame.new(0, 0, 0) * CFrame.Angles(0, -0.2617993877991494, 0);
u1.RightAim = CFrame.new(-0.6, 0.85, -0.5) * CFrame.Angles(-0.8726646259971648, 0, 0);
u1.LeftAim = CFrame.new(1.6, 0.6, -0.85) * CFrame.Angles(-1.6580627893946132, 0.6108652381980153, -0.4363323129985824);
u1.RightElbowAim = CFrame.new(0, -0.2, -0.25) * CFrame.Angles(-1.0471975511965976, 0, 0);
u1.LeftElbowAim = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0);
u1.RightWristAim = CFrame.new(0, 0, 0.15) * CFrame.Angles(0.3490658503988659, 0, 0);
u1.LeftWristAim = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0);
u1.RightSprint = CFrame.new(-0.9, 1.25, 0) * CFrame.Angles(0, 0, 0);
u1.LeftSprint = CFrame.new(1, 1, -0.6) * CFrame.Angles(-0.7853981633974483, 0.2617993877991494, -0.4363323129985824);
u1.RightElbowSprint = CFrame.new(0, -0.45, -0.25) * CFrame.Angles(-1.3962634015954636, 0, 0);
u1.LeftElbowSprint = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0);
u1.RightWristSprint = CFrame.new(0, 0, 0.15) * CFrame.Angles(0.3490658503988659, 0, 0);
u1.LeftWristSprint = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0);

return u1;