-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Reken.HK417
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Reken
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:35
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

game:GetService("PhysicsService");
local Debris = game:GetService("Debris");
local TweenService = game:GetService("TweenService");
local u1 = {
    SlideEx = CFrame.new(0, 0, -0.4),
    SlideLock = true,
    canAim = true,
    Zoom = 60,
    gunName = "HK417",
    Type = "Gun",
    EnableHUD = true,
    IncludeChamberedBullet = true,
    Ammo = 20,
    StoredAmmo = 80
};
u1.AmmoInGun = u1.Ammo;
u1.MaxStoredAmmo = 140;
u1.CanCheckMag = true;
u1.MagCount = true;
u1.ShellInsert = false;
u1.ShootRate = 720;
u1.Bullets = 1;
u1.BurstShot = 3;
u1.ShootType = 1;
u1.FireModes = {
    ChangeFiremode = false,
    Semi = true,
    Burst = false,
    Auto = false
};
u1.LimbDamage = { 34, 17 };
u1.TorsoDamage = { 69, 48 };
u1.HeadDamage = { 250, 250 };
u1.DamageDropOff = { 50, 150 };
u1.ADS_Speed = 0.48;
u1.CrossHair = true;
u1.CenterDot = false;
u1.CrosshairOffset = 0;
u1.CanBreachDoor = true;
u1.CanRun = true;
u1.ReloadSound = "DMR";
u1.SightAtt = "";
u1.BarrelAtt = "";
u1.UnderBarrelAtt = "";
u1.OtherAtt = "";
u1.Charm = "";
u1.AvaliableSight = { "1x", "1.5x", "2x", "2.5x", "3x", "Sogbo VDT-1", "Sogbo VDT-3" };
u1.AvaliableBarrel = { "Suppressor", "Muzzle Brake", "Flash Hider" };
u1.AvaliableUB = { "Vertical Grip", "Angled Grip" };
u1.AvaliableOther = { "Laser" };
u1.SkinTable = {};
u1.CustomAtt = {
    Suppressor = "Suppressor C",
    ["Muzzle Brake"] = "Muzzle Brake C"
};
u1.camRecoil = {
    camRecoilUp = { 36, 36 },
    camRecoilTilt = { 100, 100 },
    camRecoilLeft = { 6, 7 },
    camRecoilRight = { 6, 7 }
};
u1.gunRecoil = {
    gunRecoilUp = { 75, 75 },
    gunRecoilTilt = { 10, 10 },
    gunRecoilLeft = { 10, 12 },
    gunRecoilRight = { 10, 12 }
};
u1.AimRecoilReduction = 4;
u1.AimSpreadReduction = 100;
u1.MinRecoilPower = 1;
u1.MaxRecoilPower = 1.5;
u1.RecoilPowerStepAmount = 0.1;
u1.MinSpread = 20;
u1.MaxSpread = 100;
u1.AimInaccuracyStepAmount = 7.5;
u1.AimInaccuracyDecrease = 100;
u1.WalkMult = 5;
u1.BulletType = ".308 Winchester";
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
u1.GunCFrame = CFrame.new(0.15, -0.2, 0.95) * CFrame.Angles(1.5707963267948966, 0, 0);
u1.LArmCFrame = CFrame.new(-0.6, -0.15, -0.35) * CFrame.Angles(1.9198621771937625, 0.2617993877991494, 0.2617993877991494);
u1.RArmCFrame = CFrame.new(0.05, -0.15, 1.2) * CFrame.Angles(1.5707963267948966, 0, 0);
u1.VertGripCframe = CFrame.new(-0.55, -0.1, 0) * CFrame.Angles(1.5707963267948966, 0, 0.3490658503988659);
u1.AngGripCframe = CFrame.new(-0.4, -0.35, -0.15) * CFrame.Angles(1.9198621771937625, 0.7853981633974483, 0.2617993877991494);

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
    TweenService:Create(p6[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.9198621771937625, -0.2617993877991494, 0)):inverse()
    }):Play();
    TweenService:Create(p6[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.75, -0.15, 0.5) * CFrame.Angles(1.9198621771937625, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.3);
    TweenService:Create(p6[1], TweenInfo.new(0.5, Enum.EasingStyle.Back), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.7453292519943295, -0.08726646259971647, 0)):inverse()
    }):Play();
    TweenService:Create(p6[2], TweenInfo.new(0.25, Enum.EasingStyle.Back), {
        C1 = (CFrame.new(-0.75, -0.15, 0.5) * CFrame.Angles(1.0471975511965976, -0.08726646259971647, 0.2617993877991494)):inverse()
    }):Play();
    wait(0.05);
    p6[4].Handle.MagOut:Play();
    p6[4].Mag.Transparency = 1;
    wait(0.5);
    p6[4].Handle.AimUp:Play();
    wait(0.75);
    TweenService:Create(p6[2], TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.75, -0.5, 0.25) * CFrame.Angles(1.9198621771937625, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.25);
    p6[4].Handle.MagIn:Play();
    TweenService:Create(p6[1], TweenInfo.new(0.15, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.7627825445142729, -0.10471975511965978, 0)):inverse()
    }):Play();
    p6[4].Mag.Transparency = 0;
    wait(0.2);
    TweenService:Create(p6[2], TweenInfo.new(0.15, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.75, -0.5, 0.25) * CFrame.Angles(1.0471975511965976, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.25);
    TweenService:Create(p6[2], TweenInfo.new(0.1, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.75, -0.5, 0.25) * CFrame.Angles(1.7453292519943295, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.05);
    TweenService:Create(p6[1], TweenInfo.new(0.1, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.8325957145940461, -0.08726646259971647, 0)):inverse()
    }):Play();
    wait(0.1);
end;

function u1.TacticalReloadAnim(p7) -- Line: 173
    -- upvalues: TweenService (copy), Debris (copy)
    TweenService:Create(p7[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.9198621771937625, -0.2617993877991494, 0)):inverse()
    }):Play();
    TweenService:Create(p7[2], TweenInfo.new(0.5, Enum.EasingStyle.Back), {
        C1 = (CFrame.new(-0.75, -0.15, 0.5) * CFrame.Angles(1.0471975511965976, -0.08726646259971647, 0.2617993877991494)):inverse()
    }):Play();
    wait(0.3);
    TweenService:Create(p7[1], TweenInfo.new(0.5, Enum.EasingStyle.Back), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.7453292519943295, -0.08726646259971647, 0)):inverse()
    }):Play();
    wait(0.05);
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
    v8.AssemblyLinearVelocity = -p7[4].Handle.CFrame.UpVector * 10;
    Debris:AddItem(v8, 3);
    wait(0.5);
    p7[4].Handle.AimUp:Play();
    wait(0.25);
    TweenService:Create(p7[2], TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.75, -0.5, 0.25) * CFrame.Angles(1.9198621771937625, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.25);
    p7[4].Handle.MagIn:Play();
    TweenService:Create(p7[1], TweenInfo.new(0.15, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.7627825445142729, -0.10471975511965978, 0)):inverse()
    }):Play();
    p7[4].Mag.Transparency = 0;
    wait(0.2);
    TweenService:Create(p7[2], TweenInfo.new(0.15, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.75, -0.5, 0.25) * CFrame.Angles(1.0471975511965976, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.25);
    TweenService:Create(p7[2], TweenInfo.new(0.1, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.75, -0.5, 0.25) * CFrame.Angles(1.7453292519943295, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.05);
    TweenService:Create(p7[1], TweenInfo.new(0.1, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.8325957145940461, -0.08726646259971647, 0)):inverse()
    }):Play();
    wait(0.15);
    TweenService:Create(p7[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0.05, -0.15, 1) * CFrame.Angles(1.5707963267948966, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p7[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.85, 0.05, 0.6) * CFrame.Angles(1.9198621771937625, -0.2617993877991494, 0.4363323129985824)):inverse()
    }):Play();
    wait(0.25);
    p7[4].Bolt.SlideRelease:Play();
    TweenService:Create(p7[4].Handle.Slide, TweenInfo.new(0.15, Enum.EasingStyle.Linear), {
        C0 = CFrame.new():inverse()
    }):Play();
    TweenService:Create(p7[2], TweenInfo.new(0.15, Enum.EasingStyle.Back), {
        C1 = (CFrame.new(-0.8, 0.05, 0.6) * CFrame.Angles(1.9198621771937625, -0.2617993877991494, 0.5235987755982988)):inverse()
    }):Play();
    wait(0.15);
end;

function u1.PumpAnim(p9) -- Line: 218
end;

function u1.meleeAttack(p10) -- Line: 222
end;

function u1.GrenadeReady(p11) -- Line: 226
end;

function u1.GrenadeThrow(p12) -- Line: 230
end;

u1.SV_GunPos = CFrame.new(-0.3, -0.2, -0.4) * CFrame.Angles(-1.5707963267948966, 0, 0);

return u1;