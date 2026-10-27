-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Cinder.Breach charge
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Cinder
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local TweenService = game:GetService("TweenService");
local u1 = {
    SlideEx = CFrame.new(0, 0, 0),
    SlideLock = false,
    canAim = false,
    Zoom = 70,
    gunName = "Breach charge",
    Type = "Gadget",
    EnableHUD = false,
    IncludeChamberedBullet = false,
    Ammo = 3,
    StoredAmmo = 0,
    RemoteActivate = true,
    AmmoInGun = 0,
    MaxStoredAmmo = 0,
    CanCheckMag = false,
    MagCount = false,
    ShellInsert = false,
    ShootRate = 0,
    Bullets = 0,
    BurstShot = 0,
    ShootType = 0,
    FireModes = {
        ChangeFiremode = false,
        Semi = false,
        Burst = false,
        Auto = false
    },
    LimbDamage = { 0, 0 },
    TorsoDamage = { 0, 0 },
    HeadDamage = { 0, 0 },
    DamageFallOf = 0,
    MinDamage = 0,
    IgnoreProtection = false,
    BulletPenetration = 0,
    adsTime = 1,
    CrossHair = false,
    CenterDot = true,
    CrosshairOffset = 0,
    CanBreachDoor = false,
    CanRun = true,
    SightAtt = "",
    BarrelAtt = "",
    UnderBarrelAtt = "",
    OtherAtt = "",
    camRecoil = {
        camRecoilUp = { 0, 0 },
        camRecoilTilt = { 0, 0 },
        camRecoilLeft = { 0, 0 },
        camRecoilRight = { 0, 0 }
    },
    gunRecoil = {
        gunRecoilUp = { 0, 0 },
        gunRecoilTilt = { 0, 0 },
        gunRecoilLeft = { 0, 0 },
        gunRecoilRight = { 0, 0 }
    },
    AimRecoilReduction = 1,
    AimSpreadReduction = 1,
    MinRecoilPower = 1,
    MaxRecoilPower = 1,
    RecoilPowerStepAmount = 1,
    MinSpread = 0,
    MaxSpread = 0,
    AimInaccuracyStepAmount = 0,
    AimInaccuracyDecrease = 100,
    WalkMult = 0,
    EnableZeroing = false,
    MaxZero = 0,
    ZeroIncrement = 0,
    CurrentZero = 0,
    BulletType = "",
    MuzzleVelocity = 0,
    BulletDrop = 0,
    Tracer = false,
    BulletFlare = false,
    TracerColor = Color3.fromRGB(255, 255, 255),
    RandomTracer = {
        Enabled = false,
        Chance = 25
    },
    TracerEveryXShots = 0,
    RainbowMode = false,
    CanBreak = false,
    Jammed = false,
    MainCFrame = CFrame.new(0, 0, 0),
    GunModelFixed = true,
    GunCFrame = CFrame.new(0.75, -0.15, 0.9) * CFrame.Angles(1.5707963267948966, 0, 0),
    LArmCFrame = CFrame.new(-0.75, -0.85, -0.25) * CFrame.Angles(1.5707963267948966, 0, 0),
    RArmCFrame = CFrame.new(0.75, -0.85, -0.25) * CFrame.Angles(1.5707963267948966, 0, 0)
};

function u1.EquipAnim(p2) -- Line: 110
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p2[1], TweenInfo.new(0, Enum.EasingStyle.Linear), {
        C1 = (CFrame.new(1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p2[2], TweenInfo.new(0, Enum.EasingStyle.Linear), {
        C1 = (CFrame.new(-1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    wait(0.1);
    TweenService:Create(p2[1], TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p2[2], TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
    wait(0.2);
end;

function u1.UnEquipAnim(p3) -- Line: 119
    -- upvalues: TweenService (copy)
    TweenService:Create(p3[1], TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
        C1 = (CFrame.new(1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p3[2], TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
        C1 = (CFrame.new(-1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    wait(0.2);
end;

function u1.IdleAnim(p4) -- Line: 125
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p4[1], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p4[2], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
end;

function u1.SprintAnim(p5) -- Line: 130
end;

function u1.ReloadAnim(p6) -- Line: 133
end;

function u1.TacticalReloadAnim(p7) -- Line: 136
end;

function u1.PumpAnim(p8) -- Line: 139
end;

function u1.meleeAttack(p9) -- Line: 142
    -- upvalues: TweenService (copy)
    p9[4].Handle.Swing:Play();
    TweenService:Create(p9[1], TweenInfo.new(0.25, Enum.EasingStyle.Back), {
        C1 = (CFrame.new(1.5, -0.85, 0) * CFrame.Angles(3.141592653589793, 2.792526803190927, -1.4835298641951802)):inverse()
    }):Play();
    wait(0.3);
end;

function u1.GrenadeReady(p10) -- Line: 148
end;

function u1.GrenadeThrow(p11) -- Line: 151
end;

u1.SV_GunPos = CFrame.new(-0.3, -0.2, -0.4) * CFrame.Angles(-1.5707963267948966, 0, 0);
local workspace_CurrentCamera = workspace.CurrentCamera;
local u12 = false;
local u13 = false;
local u14 = nil;

local function IsAvailable(p15: userdata, p16: boolean) -- Line: 162
    if not p15 then
        return;
    end;

    if p16 then
        for _, descendant in pairs(p15:GetDescendants()) do
            if descendant:IsA("BasePart") then
                descendant.Color = Color3.fromRGB(13, 105, 172);
            end;
        end;

        return;
    end;

    for _, descendant in pairs(p15:GetDescendants()) do
        if descendant:IsA("BasePart") then
            descendant.Color = Color3.fromRGB(196, 40, 28);
        end;
    end;
end;

function u1.OnActivate(p17: userdata, p18: userdata, p19: number) -- Line: 180
    -- upvalues: u13 (ref), workspace_CurrentCamera (copy), u12 (ref), ReplicatedStorage (copy), u1 (copy)
    if not u13 then
        return false;
    end;

    u13 = false;
    local RaycastParams_new_ret = RaycastParams.new();
    RaycastParams_new_ret.FilterDescendantsInstances = { p17.Character, workspace_CurrentCamera, workspace.GameVolumes };
    RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Exclude;
    local v20 = workspace:Raycast(workspace_CurrentCamera.CFrame.Position, workspace_CurrentCamera.CFrame.LookVector * 6, RaycastParams_new_ret);

    if not v20 then
        return false;
    end;

    if not v20.Instance then
        return false;
    end;

    if not (v20.Instance:IsDescendantOf(workspace.GAME_WORKSPACE.Breach) or v20.Instance:IsDescendantOf(workspace.GAME_WORKSPACE.Doors)) then
        return false;
    end;

    u12 = false;
    ReplicatedStorage.Skorpio_Engine.Events.Gadget:FireServer("Breach charge", p19, v20.Instance, v20.Position, v20.Normal);
    local v21 = u1;
    v21.Ammo = v21.Ammo - 1;

    return true;
end;

function u1.DetonateAnim(p22) -- Line: 202
end;

function u1.OnEquip(p23) -- Line: 205
    -- upvalues: u12 (ref)
    u12 = true;
end;

function u1.OnUnequip(p24) -- Line: 209
    -- upvalues: u12 (ref), u14 (ref)
    u12 = false;

    if u14 then
        u14:Destroy();
        u14 = nil;
    end;
end;

function u1.OnUpdate(p25) -- Line: 218
    -- upvalues: u12 (ref), u14 (ref), ReplicatedStorage (copy), workspace_CurrentCamera (copy), u13 (ref), IsAvailable (copy)
    if not u12 then
        return;
    end;

    if not u14 then
        u14 = ReplicatedStorage.Skorpio_Engine.GhostModels.BreachCharge:Clone();
        u14.Parent = workspace_CurrentCamera;
        u13 = false;

        return;
    end;

    local RaycastParams_new_ret = RaycastParams.new();
    RaycastParams_new_ret.FilterDescendantsInstances = { p25.Character, workspace_CurrentCamera, workspace.GameVolumes };
    RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Exclude;
    local v26 = workspace:Raycast(workspace_CurrentCamera.CFrame.Position, workspace_CurrentCamera.CFrame.LookVector * 6, RaycastParams_new_ret);

    if v26 then
        u14:PivotTo(CFrame.new(v26.Position, v26.Position + v26.Normal) * CFrame.Angles(-1.5707963267948966, 0, 0));

        if not (v26.Instance:IsDescendantOf(workspace.GAME_WORKSPACE.Breach) or v26.Instance:IsDescendantOf(workspace.GAME_WORKSPACE.Doors)) then
            return;
        end;

        u13 = true;
    else
        u14:PivotTo(CFrame.new(workspace_CurrentCamera.CFrame.Position + workspace_CurrentCamera.CFrame.LookVector * 6, workspace_CurrentCamera.CFrame.Position) * CFrame.Angles(-1.5707963267948966, 0, 0));
        u13 = false;
    end;

    IsAvailable(u14, u13);
end;

return u1;