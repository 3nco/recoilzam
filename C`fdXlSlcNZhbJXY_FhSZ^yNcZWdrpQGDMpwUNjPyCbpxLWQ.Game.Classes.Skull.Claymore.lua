-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Skull.Claymore
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Skull
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
    gunName = "Claymore",
    Type = "Gadget",
    EnableHUD = false,
    IncludeChamberedBullet = false,
    Ammo = 2,
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
    GunCFrame = CFrame.new(0.7, -0.15, 0.85) * CFrame.Angles(1.5707963267948966, 0, 0),
    LArmCFrame = CFrame.new(-0.65, -0.85, -0.25) * CFrame.Angles(1.5707963267948966, 0, 0),
    RArmCFrame = CFrame.new(0.65, -0.85, -0.25) * CFrame.Angles(1.5707963267948966, 0, 0)
};

function u1.EquipAnim(p2) -- Line: 109
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p2[1], TweenInfo.new(0, Enum.EasingStyle.Linear), {
        C1 = (CFrame.new(1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p2[2], TweenInfo.new(0, Enum.EasingStyle.Linear), {
        C1 = (CFrame.new(-1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    wait(0.1);
    TweenService:Create(p2[1], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p2[2], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
    wait(0.2);
end;

function u1.IdleAnim(p3) -- Line: 118
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p3[1], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p3[2], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
end;

function u1.LowReady(p4) -- Line: 123
end;

function u1.HighReady(p5) -- Line: 127
end;

function u1.Patrol(p6) -- Line: 131
end;

function u1.SprintAnim(p7) -- Line: 135
end;

function u1.ReloadAnim(p8) -- Line: 139
end;

function u1.TacticalReloadAnim(p9) -- Line: 143
end;

function u1.JammedAnim(p10) -- Line: 147
end;

function u1.PumpAnim(p11) -- Line: 151
end;

function u1.MagCheck(p12) -- Line: 155
end;

function u1.meleeAttack(p13) -- Line: 159
end;

function u1.GrenadeReady(p14) -- Line: 163
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p14[1], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p14[2], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
    wait(0.2);
end;

function u1.GrenadeThrow(p15) -- Line: 169
    -- upvalues: TweenService (copy)
    TweenService:Create(p15[1], TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
        C1 = (CFrame.new(1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p15[2], TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
        C1 = (CFrame.new(-1, -1, 1) * CFrame.Angles(0, 0, 0)):inverse()
    }):Play();
    wait(0.1);
    p15[4].Handle.Transparency = 1;
    p15[4].Handle.Swing:Play();
end;

u1.SV_GunPos = CFrame.new(-0.3, -0.2, -0.4) * CFrame.Angles(-1.5707963267948966, 0, 0);
local workspace_CurrentCamera = workspace.CurrentCamera;
local u16 = false;
local u17 = false;
local u18 = nil;

local function IsAvailable(p19: userdata, p20: boolean) -- Line: 190
    if not p19 then
        return;
    end;

    if p20 then
        for _, descendant in pairs(p19:GetDescendants()) do
            if descendant:IsA("BasePart") then
                descendant.Color = Color3.fromRGB(13, 105, 172);
            end;
        end;

        return;
    end;

    for _, descendant in pairs(p19:GetDescendants()) do
        if descendant:IsA("BasePart") then
            descendant.Color = Color3.fromRGB(196, 40, 28);
        end;
    end;
end;

function u1.OnActivate(p21: userdata, p22: userdata, p23: number) -- Line: 208
    -- upvalues: u16 (ref), u17 (ref), workspace_CurrentCamera (copy), u18 (ref), ReplicatedStorage (copy), u1 (copy)
    u16 = false;

    if not u17 then
        return;
    end;

    u17 = false;
    local RaycastParams_new_ret = RaycastParams.new();
    RaycastParams_new_ret.FilterDescendantsInstances = {
        p21.Character,
        workspace_CurrentCamera,
        workspace.Gadgets,
        workspace.GAME_WORKSPACE.Doors,
        workspace.GameVolumes
    };
    RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Exclude;
    RaycastParams_new_ret.RespectCanCollide = true;
    RaycastParams_new_ret.CollisionGroup = "Player";
    local v24 = workspace:Raycast(workspace_CurrentCamera.CFrame.Position, workspace_CurrentCamera.CFrame.LookVector * 8, RaycastParams_new_ret);

    if v24 then
        local _, v25 = u18:GetBoundingBox();
        local CFrame_Angles_ret = CFrame.Angles(-1.5707963267948966, math.rad(p21.Character.PrimaryPart.Orientation.Y), 0);
        local v26 = CFrame.new(v24.Position, v24.Position + v24.Normal) * CFrame.new(0, 0, -v25.Y / 2) * CFrame_Angles_ret;
        ReplicatedStorage.Skorpio_Engine.Events.Gadget:FireServer("Claymore", p23, v26);
        local v27 = u1;
        v27.Ammo = v27.Ammo - 1;
    end;
end;

function u1.OnEquip(p28) -- Line: 235
    -- upvalues: u16 (ref)
    u16 = true;
end;

function u1.OnUnequip(p29) -- Line: 239
    -- upvalues: u16 (ref), u18 (ref)
    u16 = false;

    if u18 then
        u18:Destroy();
        u18 = nil;
    end;
end;

function u1.OnUpdate(p30) -- Line: 248
    -- upvalues: u16 (ref), u18 (ref), ReplicatedStorage (copy), workspace_CurrentCamera (copy), u17 (ref), IsAvailable (copy)
    if not u16 then
        return;
    end;

    if not u18 then
        u18 = ReplicatedStorage.Skorpio_Engine.GhostModels.Claymore:Clone();
        u18.Parent = workspace_CurrentCamera;
        u17 = false;

        return;
    end;

    local RaycastParams_new_ret = RaycastParams.new();
    RaycastParams_new_ret.FilterDescendantsInstances = {
        p30.Character,
        workspace_CurrentCamera,
        workspace.Gadgets,
        workspace.GAME_WORKSPACE.Doors,
        workspace.GameVolumes
    };
    RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Exclude;
    RaycastParams_new_ret.RespectCanCollide = true;
    RaycastParams_new_ret.CollisionGroup = "Player";
    local v31 = workspace:Raycast(workspace_CurrentCamera.CFrame.Position, workspace_CurrentCamera.CFrame.LookVector * 8, RaycastParams_new_ret);

    if v31 then
        local _, v32 = u18:GetBoundingBox();
        local CFrame_Angles_ret = CFrame.Angles(-1.5707963267948966, math.rad(p30.Character.PrimaryPart.Orientation.Y), 0);
        u18:PivotTo(CFrame.new(v31.Position, v31.Position + v31.Normal) * CFrame.new(0, 0, -v32.Y / 2) * CFrame_Angles_ret);
        local OverlapParams_new_ret = OverlapParams.new();
        OverlapParams_new_ret.FilterDescendantsInstances = {
            p30.Character,
            workspace_CurrentCamera,
            workspace.Gadgets,
            workspace.GAME_WORKSPACE.Doors,
            workspace.GameVolumes
        };
        OverlapParams_new_ret.RespectCanCollide = true;
        OverlapParams_new_ret.CollisionGroup = "Player";

        if workspace:GetPartsInPart(u18.PrimaryPart, OverlapParams_new_ret)[1] then
            u17 = false;
        elseif u18.PrimaryPart.CFrame.UpVector:Dot(Vector3.new(0, 1, 0)) >= 0.95 then
            u17 = true;
        else
            u17 = false;
        end;
    else
        u18:PivotTo(CFrame.new(workspace_CurrentCamera.CFrame.Position + workspace_CurrentCamera.CFrame.LookVector * 8, workspace_CurrentCamera.CFrame.Position) * CFrame.Angles(0, 1.5707963267948966, 0));
        u17 = false;
    end;

    IsAvailable(u18, u17);
end;

return u1;