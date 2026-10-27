-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Caiman.IED-Mk2
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Caiman
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:35
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local ReplicatedStorage = game:GetService("ReplicatedStorage");
game:GetService("Players");
local TweenService = game:GetService("TweenService");
local u1 = {
    SlideEx = CFrame.new(0, 0, 0),
    SlideLock = false,
    canAim = false,
    Zoom = 60,
    gunName = "IED-Mk2",
    Type = "Gadget",
    EnableHUD = false,
    IncludeChamberedBullet = false,
    Ammo = 6,
    StoredAmmo = 0,
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
    GunCFrame = CFrame.new(0.25, -0.15, 0.85) * CFrame.Angles(1.5707963267948966, 0, 0),
    LArmCFrame = CFrame.new(-0.65, -0.85, -0.25) * CFrame.Angles(1.5707963267948966, 0, 0),
    RArmCFrame = CFrame.new(0.75, -1.15, -1.15) * CFrame.Angles(3.0543261909900767, 0, 0)
};

function u1.EquipAnim(p2) -- Line: 79
    -- upvalues: TweenService (copy), u1 (copy)
    p2[2].Transparency = 1;
    TweenService:Create(p2[1], TweenInfo.new(0, Enum.EasingStyle.Linear), {
        C1 = (CFrame.new(1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p2[2], TweenInfo.new(0, Enum.EasingStyle.Linear), {
        C1 = (CFrame.new(-1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    task.wait(0.1);
    TweenService:Create(p2[1], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    task.wait(0.2);
end;

function u1.IdleAnim(p3) -- Line: 88
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p3[1], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
end;

function u1.LowReady(p4) -- Line: 92
end;

function u1.HighReady(p5) -- Line: 93
end;

function u1.Patrol(p6) -- Line: 94
end;

function u1.SprintAnim(p7) -- Line: 95
end;

function u1.ReloadAnim(p8) -- Line: 96
end;

function u1.TacticalReloadAnim(p9) -- Line: 97
end;

function u1.JammedAnim(p10) -- Line: 98
end;

function u1.PumpAnim(p11) -- Line: 99
end;

function u1.MagCheck(p12) -- Line: 100
end;

function u1.meleeAttack(p13) -- Line: 101
end;

function u1.GrenadeReady(p14) -- Line: 103
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p14[1], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p14[2], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
    task.wait(0.2);
end;

function u1.GrenadeThrow(p15) -- Line: 109
    -- upvalues: TweenService (copy)
    TweenService:Create(p15[1], TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
        C1 = (CFrame.new(1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p15[2], TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
        C1 = (CFrame.new(-1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    task.wait(0.1);
    p15[4].Handle.Transparency = 1;
    p15[4].Handle.Swing:Play();
end;

u1.SV_GunPos = CFrame.new(Vector3.new(-0.3, -0.2, -0.4)) * CFrame.Angles(-1.5707963267948966, 0, 0);
local workspace_CurrentCamera = workspace.CurrentCamera;
local CFrame_Angles_ret = CFrame.Angles(0, 1.5707963267948966, 0);
local CFrame_Angles_ret2 = CFrame.Angles(0, 0, 3.141592653589793);
local CFrame_Angles_ret3 = CFrame.Angles(-1.5707963267948966, 0, 0);
local Color3_fromRGB_ret = Color3.fromRGB(13, 105, 172);
local Color3_fromRGB_ret2 = Color3.fromRGB(196, 40, 28);
local u16 = workspace:FindFirstChild("GameVolumes") and workspace.GameVolumes:FindFirstChild("DoorHitbox");
local u17 = false;
local u18 = false;
local u19 = nil;

local function setGhostColor(p20: userdata, p21: boolean) -- Line: 151
    -- upvalues: Color3_fromRGB_ret (copy), Color3_fromRGB_ret2 (copy)
    if not p20 then
        return;
    end;

    local v22 = p21 and Color3_fromRGB_ret or Color3_fromRGB_ret2;

    for _, descendant in ipairs(p20:GetDescendants()) do
        if descendant:IsA("BasePart") then
            descendant.Color = v22;
        end;
    end;
end;

local function getDoorRayParams() -- Line: 161
    -- upvalues: u16 (copy)
    local RaycastParams_new_ret = RaycastParams.new();
    RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Include;
    RaycastParams_new_ret.FilterDescendantsInstances = u16 and { u16 } or {};

    return RaycastParams_new_ret;
end;

local function isInsideInflatedHitbox(p23: userdata, p24: vector) -- Line: 168
    local v25 = p23.CFrame:PointToObjectSpace(p24);
    local v26 = p23.Size * 0.5;
    local v27;

    if math.abs(v25.X) <= v26.X + 1 and v25.Y <= 0 then
        v27 = math.abs(v25.Y) <= v26.Y + 1;
    else
        v27 = false;
    end;

    return v27;
end;

local function calculateSnapCFrame(p28: userdata, p29: vector, p30: vector, p31: vector) -- Line: 177
    -- upvalues: CFrame_Angles_ret2 (copy), CFrame_Angles_ret3 (copy)
    local v32 = p28.CFrame:PointToObjectSpace(p29);
    local v33 = v32.Z > 0 and 1 or -1;
    local Vector3_new_ret = Vector3.new((p28.Size.X * 0.5 + 0.3) * (v32.X > 0 and 1 or -1), v32.Y, p28.Size.Z * 0.5 * v33);
    local v34 = p28.CFrame * Vector3_new_ret;
    local Vector3_new_ret2 = Vector3.new(0, 0, v33);
    local v35 = p28.CFrame:VectorToWorldSpace(Vector3_new_ret2);

    return CFrame.lookAt(v34, v34 + v35) * ((Vector3.new(0, 1, 0)):Cross(v35):Dot(p28.Position - v34) > 0 and CFrame_Angles_ret2 or CFrame.new()) * CFrame.new(0, 0, -p31.Y) * CFrame_Angles_ret3;
end;

local function getFallbackCFrame() -- Line: 209
    -- upvalues: workspace_CurrentCamera (copy), CFrame_Angles_ret (copy)
    local CFrame2 = workspace_CurrentCamera.CFrame;

    return CFrame.new(CFrame2.Position + CFrame2.LookVector * 8, CFrame2.Position) * CFrame_Angles_ret;
end;

local function getDoorRaycast() -- Line: 215
    -- upvalues: workspace_CurrentCamera (copy), getDoorRayParams (copy)
    return workspace:Spherecast(workspace_CurrentCamera.CFrame.Position, 1.5, workspace_CurrentCamera.CFrame.LookVector * 8, (getDoorRayParams()));
end;

local function isValidDoorHit(p36) -- Line: 224
    local v37 = p36 and p36.Instance and p36.Instance:FindFirstChild("porta") ~= nil;

    return v37;
end;

function u1.OnActivate(p38: userdata, p39: userdata, p40: number) -- Line: 230
    -- upvalues: u18 (ref), u19 (ref), u17 (ref), workspace_CurrentCamera (copy), getDoorRayParams (copy), calculateSnapCFrame (copy), ReplicatedStorage (copy), u1 (copy)
    if not (u18 and u19) then
        return;
    end;

    u17 = false;
    u18 = false;
    local v41 = workspace:Spherecast(workspace_CurrentCamera.CFrame.Position, 1.5, workspace_CurrentCamera.CFrame.LookVector * 8, (getDoorRayParams()));
    local v42 = v41 and v41.Instance and v41.Instance:FindFirstChild("porta") ~= nil;

    if not v42 then
        return;
    end;

    local Instance = v41.Instance;
    local v43 = Instance.CFrame:PointToObjectSpace(v41.Position);
    local v44 = Instance.Size * 0.5;
    local v45;

    if math.abs(v43.X) <= v44.X + 1 and v43.Y <= 0 then
        v45 = math.abs(v43.Y) <= v44.Y + 1;
    else
        v45 = false;
    end;

    if not v45 then
        return;
    end;

    local _, v46 = u19:GetBoundingBox();
    local v47 = calculateSnapCFrame(v41.Instance, v41.Position, v41.Normal, v46);
    ReplicatedStorage.Skorpio_Engine.Events.Gadget:FireServer("IED-Mk2", p40, v47);
    local v48 = u1;
    v48.Ammo = v48.Ammo - 1;
end;

function u1.OnEquip() -- Line: 252
    -- upvalues: u17 (ref)
    u17 = true;
end;

function u1.OnUnequip() -- Line: 256
    -- upvalues: u17 (ref), u19 (ref)
    u17 = false;

    if u19 then
        u19:Destroy();
        u19 = nil;
    end;
end;

function u1.OnUpdate() -- Line: 264
    -- upvalues: u17 (ref), u19 (ref), ReplicatedStorage (copy), workspace_CurrentCamera (copy), u18 (ref), getDoorRayParams (copy), CFrame_Angles_ret (copy), setGhostColor (copy), calculateSnapCFrame (copy)
    if not u17 then
        return;
    end;

    if not u19 then
        u19 = ReplicatedStorage.Skorpio_Engine.GhostModels["IED-Mk2"]:Clone();
        u19.Parent = workspace_CurrentCamera;
        u18 = false;

        return;
    end;

    local v49 = workspace:Spherecast(workspace_CurrentCamera.CFrame.Position, 1.5, workspace_CurrentCamera.CFrame.LookVector * 8, (getDoorRayParams()));
    local v50 = v49 and v49.Instance and v49.Instance:FindFirstChild("porta") ~= nil;

    if not v50 then
        local CFrame2 = workspace_CurrentCamera.CFrame;
        u19:PivotTo(CFrame.new(CFrame2.Position + CFrame2.LookVector * 8, CFrame2.Position) * CFrame_Angles_ret);
        u18 = false;
        setGhostColor(u19, false);

        return;
    end;

    local Instance = v49.Instance;
    local v51 = Instance.CFrame:PointToObjectSpace(v49.Position);
    local v52 = Instance.Size * 0.5;
    local v53;

    if math.abs(v51.X) <= v52.X + 1 and v51.Y <= 0 then
        v53 = math.abs(v51.Y) <= v52.Y + 1;
    else
        v53 = false;
    end;

    if v53 then
        local _, v54 = u19:GetBoundingBox();
        u19:PivotTo((calculateSnapCFrame(v49.Instance, v49.Position, v49.Normal, v54)));
        u18 = true;
        setGhostColor(u19, true);

        return;
    end;

    local CFrame2 = workspace_CurrentCamera.CFrame;
    u19:PivotTo(CFrame.new(CFrame2.Position + CFrame2.LookVector * 8, CFrame2.Position) * CFrame_Angles_ret);
    u18 = false;
    setGhostColor(u19, false);
end;

return u1;