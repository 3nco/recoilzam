-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Loch.Ballistic Panel
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Loch
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:35
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local ReplicatedStorage = game:GetService("ReplicatedStorage");
game:GetService("CollectionService");
local Players = game:GetService("Players");
local TweenService = game:GetService("TweenService");
local u1 = {
    SlideEx = CFrame.new(0, 0, 0),
    SlideLock = false,
    canAim = false,
    Zoom = 60,
    gunName = "Ballistic panel",
    Type = "Gadget",
    EnableHUD = false,
    LeftHand = true,
    IncludeChamberedBullet = false,
    Ammo = 4,
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
    LimbDamage = { 55, 55 },
    TorsoDamage = { 55, 55 },
    HeadDamage = { 55, 55 },
    MeleeDamage = 200,
    DamageFallOf = 1,
    MinDamage = 0,
    IgnoreProtection = true,
    OnlyShootADS = false,
    ADS_Speed = 0.5,
    CrossHair = false,
    CenterDot = true,
    CrosshairOffset = 0,
    CanBreachDoor = false,
    CanRun = false,
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
    AimInaccuracyDecrease = 0,
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
    GunCFrame = CFrame.new(0.7, 0.15, 0.75) * CFrame.Angles(1.5707963267948966, 0, 0),
    LArmCFrame = CFrame.new(-0.7, -1.25, -0.25) * CFrame.Angles(1.5707963267948966, 0, 0),
    RArmCFrame = CFrame.new(0.7, -1.25, -0.25) * CFrame.Angles(1.5707963267948966, 0, 0)
};

function u1.EquipAnim(p2) -- Line: 114
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p2[1], TweenInfo.new(0, Enum.EasingStyle.Linear), {
        C1 = (CFrame.new(1, -2, 1) * CFrame.Angles(1.5707963267948966, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p2[2], TweenInfo.new(0, Enum.EasingStyle.Linear), {
        C1 = (CFrame.new(-1, -2, 1) * CFrame.Angles(1.5707963267948966, 0, 0)):inverse()
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

function u1.UnEquipAnim(p3) -- Line: 123
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p3[1], TweenInfo.new(0, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p3[2], TweenInfo.new(0, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
    wait(0.1);
    TweenService:Create(p3[1], TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(1, -2, 1) * CFrame.Angles(1.5707963267948966, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p3[2], TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-1, -2, 1) * CFrame.Angles(1.5707963267948966, 0, 0)):inverse()
    }):Play();
    wait(0.2);
end;

function u1.IdleAnim(p4) -- Line: 132
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p4[1], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p4[2], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
end;

u1.SV_GunPos = CFrame.new(-0.75, 0, -0.55) * CFrame.Angles(-1.5707963267948966, 0, 0);
local workspace_CurrentCamera = workspace.CurrentCamera;
local u5 = false;
local u6 = false;
local u7 = nil;

local function IsAvailable(p8: userdata, p9: boolean) -- Line: 150
    if not p8 then
        return;
    end;

    if p9 then
        for _, descendant in pairs(p8:GetDescendants()) do
            if descendant:IsA("BasePart") then
                descendant.Color = Color3.fromRGB(13, 105, 172);
            end;
        end;

        return;
    end;

    for _, descendant in pairs(p8:GetDescendants()) do
        if descendant:IsA("BasePart") then
            descendant.Color = Color3.fromRGB(196, 40, 28);
        end;
    end;
end;

function u1.OnActivate(p10: any, p11: userdata, p12: number) -- Line: 168
    -- upvalues: u5 (ref), u6 (ref), workspace_CurrentCamera (copy), Players (copy), ReplicatedStorage (copy), u1 (copy)
    u5 = false;

    if not u6 then
        return;
    end;

    u6 = false;

    if not p10.Character then
        return;
    end;

    local Humanoid = p10.Character:FindFirstChild("Humanoid");

    if not Humanoid or Humanoid.Health <= 0 then
        return;
    end;

    local RaycastParams_new_ret = RaycastParams.new();
    RaycastParams_new_ret.FilterDescendantsInstances = {
        p10.Character,
        workspace_CurrentCamera,
        workspace.Gadgets,
        workspace.GAME_WORKSPACE.Doors,
        workspace.GameVolumes.MapShadow,
        workspace.GameVolumes.ObjectiveHitBox,
        workspace.GameVolumes.WallHitbox
    };
    RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Exclude;

    for _, v in pairs(Players:GetPlayers()) do
        if v.Character then
            RaycastParams_new_ret:AddToFilter(v.Character);
        end;
    end;

    local v13 = workspace:Raycast(workspace_CurrentCamera.CFrame.Position, workspace_CurrentCamera.CFrame.LookVector * 8, RaycastParams_new_ret);

    if v13 then
        if not v13.Instance:IsDescendantOf(workspace.GameVolumes.DoorHitbox) then
            return;
        end;

        Humanoid:AddTag("Interacting");
        task.wait(3);
        Humanoid:RemoveTag("Interacting");
        ReplicatedStorage.Skorpio_Engine.Events.Gadget:FireServer("Ballistic Panel", p12, v13.Instance);
        local v14 = u1;
        v14.Ammo = v14.Ammo - 1;
    end;
end;

function u1.OnEquip(p15) -- Line: 202
    -- upvalues: u5 (ref)
    u5 = true;
end;

function u1.OnUnequip(p16) -- Line: 206
    -- upvalues: u5 (ref), u7 (ref)
    u5 = false;

    if u7 then
        u7:Destroy();
        u7 = nil;
    end;
end;

function u1.OnUpdate(p17) -- Line: 215
    -- upvalues: u5 (ref), u7 (ref), ReplicatedStorage (copy), workspace_CurrentCamera (copy), u6 (ref), Players (copy), IsAvailable (copy)
    if not u5 then
        return;
    end;

    if not u7 then
        u7 = ReplicatedStorage.Skorpio_Engine.GhostModels["Ballistic Panel"]:Clone();
        u7.Parent = workspace_CurrentCamera;
        u6 = false;

        return;
    end;

    local RaycastParams_new_ret = RaycastParams.new();
    RaycastParams_new_ret.FilterDescendantsInstances = {
        p17.Character,
        workspace_CurrentCamera,
        workspace.Gadgets,
        workspace.GAME_WORKSPACE.Doors,
        workspace.GameVolumes.MapShadow,
        workspace.GameVolumes.ObjectiveHitBox,
        workspace.GameVolumes.WallHitbox
    };
    RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Exclude;

    for _, v in pairs(Players:GetPlayers()) do
        if v.Character then
            RaycastParams_new_ret:AddToFilter(v.Character);
        end;
    end;

    local v18 = workspace:Raycast(workspace_CurrentCamera.CFrame.Position, workspace_CurrentCamera.CFrame.LookVector * 8, RaycastParams_new_ret);

    if v18 then
        if not v18.Instance:IsDescendantOf(workspace.GameVolumes.DoorHitbox) then
            u7:PivotTo(CFrame.new(v18.Position, v18.Position + v18.Normal));
            u6 = false;
            IsAvailable(u7, u6);

            return;
        end;

        u7.FF.Size = v18.Instance.Size;
        u7:PivotTo(v18.Instance.CFrame);
        u6 = true;
    else
        u7:PivotTo(CFrame.new(workspace_CurrentCamera.CFrame.Position + workspace_CurrentCamera.CFrame.LookVector * 8, workspace_CurrentCamera.CFrame.Position));
        u6 = false;
    end;

    IsAvailable(u7, u6);
end;

return u1;