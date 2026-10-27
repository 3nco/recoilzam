-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Cinder.Borehead Charge
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Cinder
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local TweenService = game:GetService("TweenService");
local Players = game:GetService("Players");
game:GetService("Debris");
local CollectionService = game:GetService("CollectionService");
local Skorpio_Engine = ReplicatedStorage:WaitForChild("Skorpio_Engine");
local Events = Skorpio_Engine:WaitForChild("Events");
local Modules = Skorpio_Engine:WaitForChild("Modules");
require(Modules:WaitForChild("Hitmarker"));
local u1 = {
    SlideEx = CFrame.new(0, 0, -0.4),
    SlideLock = true,
    canAim = true,
    Zoom = 60,
    gunName = "Drill Charges",
    Type = "Launcher",
    EnableHUD = true,
    Ammo = 1,
    StoredAmmo = 2,
    AmmoInGun = 1,
    MaxStoredAmmo = 2,
    IncludeChamberedBullet = false,
    CanCheckMag = false,
    MagCount = false,
    ShellInsert = false,
    ShootRate = 250,
    Bullets = 1,
    BurstShot = 3,
    ShootType = 1,
    FireModes = {
        ChangeFiremode = true,
        Semi = true,
        Burst = false,
        Auto = true
    },
    LimbDamage = { 75, 75 },
    TorsoDamage = { 75, 75 },
    HeadDamage = { 250, 250 },
    DamageFallOf = 1,
    MinDamage = 5,
    IgnoreProtection = false,
    ADS_Speed = 0.32,
    CrossHair = true,
    CenterDot = false,
    CrosshairOffset = 0,
    CanBreachDoor = false,
    CanRun = true,
    SightAtt = "",
    BarrelAtt = "",
    UnderBarrelAtt = "",
    OtherAtt = "",
    AvaliableSight = {},
    AvaliableBarrel = {},
    AvaliableUB = {},
    AvaliableOther = {},
    SkinTable = {},
    camRecoil = {
        camRecoilUp = { 15, 20 },
        camRecoilTilt = { 30, 35 },
        camRecoilLeft = { 7, 10 },
        camRecoilRight = { 6, 9 }
    },
    gunRecoil = {
        gunRecoilUp = { 20, 25 },
        gunRecoilTilt = { 5, 5 },
        gunRecoilLeft = { 16, 22 },
        gunRecoilRight = { 16, 22 }
    },
    AimRecoilReduction = 4,
    AimSpreadReduction = 100,
    MinRecoilPower = 0.25,
    MaxRecoilPower = 1.5,
    RecoilPowerStepAmount = 0.075,
    MinSpread = 25,
    MaxSpread = 100,
    AimInaccuracyStepAmount = 0.75,
    AimInaccuracyDecrease = 100,
    WalkMult = 1,
    EnableZeroing = true,
    ZeroIncrement = 50,
    CurrentZero = 0,
    BulletType = "5.56x45mm",
    MuzzleVelocity = 1500,
    BulletDrop = 0.25,
    Tracer = true,
    BulletFlare = false,
    TracerColor = Color3.fromRGB(255, 255, 255),
    RandomTracer = {
        Enabled = false,
        Chance = 25
    },
    TracerEveryXShots = 3,
    RainbowMode = false,
    CanBreak = true,
    Jammed = false,
    MainCFrame = CFrame.new(0.5, -0.85, -0.75),
    GunModelFixed = true,
    GunCFrame = CFrame.new(0.15, -0.2, 0.85) * CFrame.Angles(1.5707963267948966, 0, 0),
    LArmCFrame = CFrame.new(-0.6, -0.3, 0) * CFrame.Angles(1.5707963267948966, 0.4363323129985824, 0.2617993877991494),
    RArmCFrame = CFrame.new(0, -0.15, 0) * CFrame.Angles(1.5707963267948966, 0, 0)
};

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
        C1 = (CFrame.new(0.5, -0.15, 0) * CFrame.Angles(3.0543261909900767, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p5[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    wait(0.25);
end;

function u1.ReloadAnim(p6) -- Line: 151
    -- upvalues: TweenService (copy)
    local Barrel = p6[4].Handle:WaitForChild("Barrel");
    local Rails = p6[4].Handle:WaitForChild("Rails");
    local v7 = p6[4].Handle:WaitForChild("Vortex AMG Huey Holo");
    local v8 = p6[4].Handle:FindFirstChild("Round 1");
    local C1 = Barrel.C1;
    local C12 = Rails.C1;
    local C13 = v7.C1;
    local v9;

    if v8 then
        v9 = v8.C1;
    else
        v9 = v8;
    end;

    local CFrame_Angles_ret = CFrame.Angles(0.7853981633974483, 0, 0);
    TweenService:Create(p6[1], TweenInfo.new(0.25, Enum.EasingStyle.Back), {
        C1 = (CFrame.new(0, -0.15, 0) * CFrame.Angles(1.6580627893946132, 0.7853981633974483, 0)):inverse()
    }):Play();
    TweenService:Create(p6[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.6, -0.3, 0) * CFrame.Angles(1.0471975511965976, 0.8726646259971648, 0.5235987755982988)):inverse()
    }):Play();
    p6[4].Handle:WaitForChild("MagOut"):Play();
    TweenService:Create(Barrel, TweenInfo.new(0.6, Enum.EasingStyle.Bounce), {
        C1 = C1 * CFrame_Angles_ret
    }):Play();
    TweenService:Create(Rails, TweenInfo.new(0.6, Enum.EasingStyle.Bounce), {
        C1 = C12 * CFrame_Angles_ret
    }):Play();
    TweenService:Create(v7, TweenInfo.new(0.6, Enum.EasingStyle.Bounce), {
        C1 = C13 * CFrame_Angles_ret * CFrame.new(0, 0.071, 0.05)
    }):Play();

    if v8 then
        TweenService:Create(v8, TweenInfo.new(0.6, Enum.EasingStyle.Bounce), {
            C1 = v9 * CFrame_Angles_ret
        }):Play();
    end;

    wait(0.35);
    TweenService:Create(p6[1], TweenInfo.new(0.5, Enum.EasingStyle.Back), {
        C1 = (CFrame.new(0, -0.75, 0) * CFrame.Angles(2.356194490192345, 0.2617993877991494, 0)):inverse()
    }):Play();
    TweenService:Create(p6[2], TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-1.5, -0.5, 0.75) * CFrame.Angles(0, 0.8726646259971648, 0.2617993877991494)):inverse()
    }):Play();
    wait(0.1);

    if p6[4]:FindFirstChild("Round 1") then
        p6[4]["Round 1"].Transparency = 1;
    end;

    wait(0.5);
    TweenService:Create(p6[1], TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0, -0.15, 0) * CFrame.Angles(1.3089969389957472, 0.2617993877991494, 0)):inverse()
    }):Play();
    p6[4].Handle.AimUp:Play();
    wait(0.75);
    TweenService:Create(p6[2], TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.7, -0.4, 0.15) * CFrame.Angles(2.181661564992912, 0, 0.3490658503988659)):inverse()
    }):Play();
    wait(0.3);
    TweenService:Create(p6[2], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.7, -0.4, 0) * CFrame.Angles(2.181661564992912, 0, 0.3490658503988659)):inverse()
    }):Play();
    p6[4].Handle.MagIn:Play();

    if p6[4]:FindFirstChild("Round 1") then
        p6[4]["Round 1"].Transparency = 0;
    end;

    wait(0.3);
    TweenService:Create(p6[1], TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0, -0.15, 0) * CFrame.Angles(1.5707963267948966, -0.4363323129985824, 0)):inverse()
    }):Play();
    TweenService:Create(Barrel, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = C1
    }):Play();
    TweenService:Create(Rails, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = C12
    }):Play();
    TweenService:Create(v7, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        C1 = C13
    }):Play();

    if v8 then
        TweenService:Create(v8, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
            C1 = v9
        }):Play();
    end;

    wait(0.3);
end;

function u1.TacticalReloadAnim(p10) -- Line: 204
    -- upvalues: u1 (copy)
    u1.ReloadAnim(p10);
end;

function u1.PumpAnim(p11) -- Line: 208
end;

function u1.meleeAttack(p12) -- Line: 212
end;

function u1.GrenadeReady(p13) -- Line: 216
end;

function u1.GrenadeThrow(p14) -- Line: 220
end;

u1.SV_GunPos = CFrame.new(-0.3, -0.2, -0.4) * CFrame.Angles(-1.5707963267948966, 0, 0);
local workspace_CurrentCamera = workspace.CurrentCamera;
local u15 = false;

function u1.OnActivate(p16: userdata, p17: userdata, p18: number) -- Line: 235
    -- upvalues: u15 (ref), Events (copy), workspace_CurrentCamera (copy), Players (copy)
    if not u15 then
        return;
    end;

    if not (p17 and p17:FindFirstChild("Borehead Charge")) then
        return;
    end;

    p17["Borehead Charge"].Handle.Muzzle.Fire:Play();
    p17["Borehead Charge"].Handle.Muzzle.Smoke:Emit(10);
    Events.Gadget:FireServer("Borehead Charge", false, false);
    local RaycastParams_new_ret = RaycastParams.new();
    RaycastParams_new_ret.FilterDescendantsInstances = { p16.Character, workspace_CurrentCamera, workspace.GameVolumes };
    RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Exclude;
    RaycastParams_new_ret.IgnoreWater = true;

    for _, v in pairs(Players:GetPlayers()) do
        if v ~= p16 and v.Character then
            table.insert(RaycastParams_new_ret.FilterDescendantsInstances, v.Character);
        end;
    end;

    local v19 = workspace:Raycast(workspace_CurrentCamera.CFrame.Position, p17["Borehead Charge"].Handle.Muzzle.WorldCFrame.LookVector * 250, RaycastParams_new_ret);

    if v19 then
        Events.Gadget:FireServer("Borehead Charge", p18, v19.Position, v19.Normal);
    end;
end;

function u1.OnEquip(p20) -- Line: 265
    -- upvalues: u15 (ref)
    u15 = true;
end;

function u1.OnUnequip(p21) -- Line: 269
    -- upvalues: u15 (ref)
    u15 = false;
end;

local u22 = nil;

local function IsValidSurface(p23) -- Line: 275
    return p23:IsDescendantOf(workspace.GAME_WORKSPACE.Breach) or p23:IsDescendantOf(workspace.GAME_WORKSPACE.Doors) or (p23:IsDescendantOf(workspace.Gadgets) or p23:IsDescendantOf(workspace.GAME_WORKSPACE.Cameras));
end;

local function ColorGhost(p24, p25) -- Line: 282
    for _, descendant in pairs(p24:GetDescendants()) do
        if descendant:IsA("BasePart") then
            descendant.Color = p25 and Color3.fromRGB(13, 105, 172) or Color3.fromRGB(196, 40, 28);
        end;
    end;
end;

function u1.OnUpdate(p26) -- Line: 290
    -- upvalues: u15 (ref), CollectionService (copy), u22 (ref), ReplicatedStorage (copy), workspace_CurrentCamera (copy), IsValidSurface (copy), ColorGhost (copy)
    if not u15 then
        return;
    end;

    if not CollectionService:HasTag(p26, "ADS") then
        if u22 then
            u22:Destroy();
            u22 = nil;
        end;

        return;
    end;

    if not u22 then
        u22 = ReplicatedStorage.Skorpio_Engine.GhostModels.DrillRound:Clone();
        u22.Parent = workspace_CurrentCamera;
    end;

    local RaycastParams_new_ret = RaycastParams.new();
    RaycastParams_new_ret.FilterDescendantsInstances = { p26.Character, workspace_CurrentCamera, workspace.GameVolumes };
    RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Exclude;
    RaycastParams_new_ret.IgnoreWater = true;
    local v27 = workspace:Raycast(workspace_CurrentCamera.CFrame.Position, workspace_CurrentCamera.CFrame.LookVector * 250, RaycastParams_new_ret);

    if not v27 then
        u22:PivotTo(CFrame.new(workspace_CurrentCamera.CFrame.Position + workspace_CurrentCamera.CFrame.LookVector * 300));

        return;
    end;

    local v28 = IsValidSurface(v27.Instance);
    u22:PivotTo(CFrame.new(v27.Position, v27.Position + v27.Normal) * CFrame.Angles(-1.5707963267948966, 0, 0));
    ColorGhost(u22, v28);
end;

function u1.OnUnequip(p29) -- Line: 327
    -- upvalues: u15 (ref), u22 (ref)
    u15 = false;

    if u22 then
        u22:Destroy();
        u22 = nil;
    end;
end;

return u1;