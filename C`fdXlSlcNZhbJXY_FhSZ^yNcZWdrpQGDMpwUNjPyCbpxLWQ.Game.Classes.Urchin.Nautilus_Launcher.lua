-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Urchin.Nautilus Launcher
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Urchin
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local TweenService = game:GetService("TweenService");
local Players = game:GetService("Players");
game:GetService("Debris");
local Skorpio_Engine = ReplicatedStorage:WaitForChild("Skorpio_Engine");
local Events = Skorpio_Engine:WaitForChild("Events");
Skorpio_Engine:WaitForChild("Modules");
local u1 = {
    SlideEx = CFrame.new(0, 0, -0.4),
    SlideLock = true,
    canAim = true,
    Zoom = 60,
    gunName = "Sonar Mines",
    Type = "Launcher",
    EnableHUD = true,
    IncludeChamberedBullet = true,
    Ammo = 4,
    StoredAmmo = 0
};
u1.AmmoInGun = u1.Ammo;
u1.MaxStoredAmmo = 0;
u1.CanCheckMag = false;
u1.MagCount = true;
u1.ShellInsert = false;
u1.ShootRate = 1;
u1.Bullets = 1;
u1.BurstShot = 1;
u1.ShootType = 4;
u1.FireModes = {
    ChangeFiremode = true,
    Semi = true,
    Burst = false,
    Auto = false
};
u1.LimbDamage = { 75, 75 };
u1.TorsoDamage = { 75, 75 };
u1.HeadDamage = { 250, 250 };
u1.DamageFallOf = 1;
u1.MinDamage = 5;
u1.IgnoreProtection = false;
u1.ADS_Speed = 0.32;
u1.CrossHair = true;
u1.CenterDot = false;
u1.CrosshairOffset = 0;
u1.CanBreachDoor = false;
u1.CanRun = true;
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
    camRecoilUp = { 15, 20 },
    camRecoilTilt = { 30, 35 },
    camRecoilLeft = { 7, 10 },
    camRecoilRight = { 6, 9 }
};
u1.gunRecoil = {
    gunRecoilUp = { 20, 25 },
    gunRecoilTilt = { 5, 5 },
    gunRecoilLeft = { 16, 22 },
    gunRecoilRight = { 16, 22 }
};
u1.AimRecoilReduction = 4;
u1.AimSpreadReduction = 100;
u1.MinRecoilPower = 0.25;
u1.MaxRecoilPower = 1.5;
u1.RecoilPowerStepAmount = 0.075;
u1.MinSpread = 25;
u1.MaxSpread = 100;
u1.AimInaccuracyStepAmount = 0.75;
u1.AimInaccuracyDecrease = 100;
u1.WalkMult = 1;
u1.EnableZeroing = true;
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
u1.Jammed = true;
u1.MainCFrame = CFrame.new(0.5, -0.85, -0.75);
u1.GunModelFixed = true;
u1.GunCFrame = CFrame.new(0.15, -0.2, 0.85) * CFrame.Angles(1.5707963267948966, 0, 0);
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
end;

function u1.TacticalReloadAnim(p7) -- Line: 152
end;

function u1.PumpAnim(p8) -- Line: 156
    -- upvalues: TweenService (copy)
    local Mag = p8[4].Handle:WaitForChild("Mag");
    TweenService:Create(Mag, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = Mag.C1 * CFrame.Angles(0, 0, 1.5707963267948966)
    }):Play();
    task.wait(0.25);
end;

function u1.meleeAttack(p9) -- Line: 162
end;

function u1.GrenadeReady(p10) -- Line: 166
end;

function u1.GrenadeThrow(p11) -- Line: 170
end;

u1.SV_GunPos = CFrame.new(-0.3, -0.2, -0.4) * CFrame.Angles(-1.5707963267948966, 0, 0);
local workspace_CurrentCamera = workspace.CurrentCamera;
local u12 = false;

function u1.OnActivate(p13: userdata, p14: userdata, p15: number) -- Line: 185
    -- upvalues: u12 (ref), workspace_CurrentCamera (copy), Players (copy), Events (copy)
    if not u12 then
        return;
    end;

    local RaycastParams_new_ret = RaycastParams.new();
    RaycastParams_new_ret.FilterDescendantsInstances = { p13.Character, workspace_CurrentCamera, workspace.GameVolumes };
    RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Exclude;
    RaycastParams_new_ret.IgnoreWater = true;

    for _, v in pairs(Players:GetPlayers()) do
        if v ~= p13 and v.Character then
            table.insert(RaycastParams_new_ret.FilterDescendantsInstances, v.Character);
        end;
    end;

    p14["Nautilus Launcher"].Handle.Muzzle.Fire:Play();
    p14["Nautilus Launcher"].Handle.Muzzle.Smoke:Emit(10);
    Events.HitInteract:FireServer("Nautilus Launcher", false, false);
    local v16 = workspace:Raycast(workspace_CurrentCamera.CFrame.Position, p14["Nautilus Launcher"].Handle.Muzzle.WorldCFrame.LookVector * 250, RaycastParams_new_ret);

    if v16 then
        Events.Gadget:FireServer("Nautilus Launcher", p15, v16.Position, v16.Normal);
    end;

    task.wait(0.15);
end;

function u1.OnEquip(p17) -- Line: 211
    -- upvalues: u12 (ref)
    u12 = true;
end;

function u1.OnUnequip(p18) -- Line: 215
    -- upvalues: u12 (ref)
    u12 = false;
end;

function u1.OnUpdate(p19) -- Line: 219
end;

return u1;