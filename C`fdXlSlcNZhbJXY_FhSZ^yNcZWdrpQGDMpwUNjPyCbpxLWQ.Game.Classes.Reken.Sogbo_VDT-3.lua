-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Reken.Sogbo VDT-3
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Reken
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:35
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local CollectionService = game:GetService("CollectionService");
local Players = game:GetService("Players");
local TweenService = game:GetService("TweenService");
local u1 = {
    SlideEx = CFrame.new(0, 0, 0),
    SlideLock = false,
    canAim = false,
    Zoom = 30,
    gunName = "Sogbo VDT-3",
    Type = "Gadget",
    EnableHUD = false,
    LeftHand = true,
    IncludeChamberedBullet = false,
    Ammo = 0,
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
    MainCFrame = CFrame.new(0, -0.2, 0.2),
    GunModelFixed = true,
    GunCFrame = CFrame.new(-0.75, -1.2, 0) * CFrame.Angles(3.0543261909900767, 0, 0),
    LArmCFrame = CFrame.new(-1.25, -0.35, 0.25) * CFrame.Angles(3.0543261909900767, 0, 0),
    RArmCFrame = CFrame.new(0, -0.15, 0) * CFrame.Angles(1.5707963267948966, 0, 0)
};

function u1.EquipAnim(p2) -- Line: 114
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p2[1], TweenInfo.new(0, Enum.EasingStyle.Linear), {
        C1 = (CFrame.new(1, -2, 1) * CFrame.Angles(1.5707963267948966, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p2[2], TweenInfo.new(0, Enum.EasingStyle.Linear), {
        C1 = (CFrame.new(-1, -2, 1) * CFrame.Angles(1.5707963267948966, 0, 0)):inverse()
    }):Play();
    wait(0.25);
    TweenService:Create(p2[1], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p2[2], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
    wait(0.35);
    local v3 = p2[5]["Sogbo VDT-3"];
    v3.Handle.Scan:Play();

    for _, child in pairs(v3:GetChildren()) do
        if child:IsA("BasePart") and child.Name:match("Hide") then
            child.Transparency = 1;

            for _, child2 in pairs(child:GetChildren()) do
                if child2:isA("Decal") then
                    child2.Transparency = 1;
                end;
            end;
        end;
    end;

    v3.Screen.HUD.Enabled = true;
end;

function u1.UnEquipAnim(p4) -- Line: 141
    -- upvalues: TweenService (copy), u1 (copy)
    p4[5]["Sogbo VDT-3"].Screen.HUD.Enabled = false;

    for _, child in pairs(p4[4]:GetChildren()) do
        if child:IsA("BasePart") and child.Name:match("Hide") then
            child.Transparency = 0;

            for _, child2 in pairs(child:GetChildren()) do
                if child2:isA("Decal") then
                    child2.Transparency = 0;
                end;
            end;
        end;
    end;

    TweenService:Create(p4[1], TweenInfo.new(0, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p4[2], TweenInfo.new(0, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
    wait(0.15);
    TweenService:Create(p4[1], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(1, -2, 1) * CFrame.Angles(1.5707963267948966, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p4[2], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-1, -2, 1) * CFrame.Angles(1.5707963267948966, 0, 0)):inverse()
    }):Play();
    wait(0.35);
end;

function u1.IdleAnim(p5) -- Line: 164
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p5[1], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p5[2], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
end;

function u1.OnAimAnim(p6) -- Line: 169
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p6[1], TweenInfo.new(u1.ADS_Speed, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(0, 0, 0) * CFrame.Angles(1.5707963267948966, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p6[2], TweenInfo.new(u1.ADS_Speed, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-0.9, -0.6, 0.25) * CFrame.Angles(3.0543261909900767, 0, 0)):inverse()
    }):Play();
end;

u1.SV_GunPos = CFrame.new(-0.75, 0, -0.55) * CFrame.Angles(-1.5707963267948966, 0, 0);
local workspace_CurrentCamera = workspace.CurrentCamera;
local u7 = false;

function u1.OnEquip(p8: userdata) -- Line: 184
    -- upvalues: u7 (ref)
    u7 = true;
end;

function u1.OnUnequip(p9: userdata) -- Line: 188
    -- upvalues: u7 (ref)
    u7 = false;
end;

function u1.OnUpdate(p10: userdata, p11: userdata) -- Line: 192
    -- upvalues: workspace_CurrentCamera (copy), CollectionService (copy), Players (copy), ReplicatedStorage (copy)
    if not p11 then
        return;
    end;

    local v12 = p11:FindFirstChild("Sogbo VDT-3");

    if not v12 then
        return;
    end;

    local v13 = 2 * os.clock();
    local v14 = (math.sin(v13) + 1) * 0.5;
    local AbsoluteSize = v12.Screen.HUD.AbsoluteSize;
    v12.Screen.HUD.Sonar.Position = UDim2.new(v14, 0, 0.5, 0);
    local WN = v12.Screen.HUD.WN;
    local v15 = math.noise(0.125) * os.clock();
    local v16 = math.sin(v15) / 4;
    WN.ImageTransparency = 0.85 - math.abs(v16);
    v12.Screen.HUD.WN.TileSize = UDim2.new(math.random(400, 600) / 750, 0, math.random(400, 600) / 750, 0);
    Ray.new(v12.Screen.Position, v12.Screen.Position + workspace_CurrentCamera.CFrame.LookVector);

    for _, child in pairs(v12.Screen.HUD.VisiblePlayers:GetChildren()) do
        child:Destroy();
    end;

    for _, v in pairs(CollectionService:GetTagged("Eletric")) do
        if v:IsA("Model") then
            local Humanoid = v:FindFirstChild("Humanoid");

            if not Humanoid or Humanoid.Health > 0 then
                local v17 = v.PrimaryPart and v.PrimaryPart.CFrame or v:GetPivot();
                local Magnitude = (workspace_CurrentCamera.CFrame.Position - v17.Position).Magnitude;
                local v18 = v12.Screen.CFrame:Inverse() * v17.Position;
                local v19 = (workspace_CurrentCamera.CFrame.Position - v17.Position).Unit:Dot(workspace_CurrentCamera.CFrame.LookVector);
                local v20 = v18.X / -v18.Z * (1900 / AbsoluteSize.X);
                local v21 = v18.Y / v18.Z * (1900 / AbsoluteSize.Y);
                local v22 = 250 - 200 * (Magnitude / 75);
                local v23 = v12.Screen.HUD.Assets.Marker:Clone();
                v23.Name = v.Name;
                v23.Parent = v12.Screen.HUD.VisiblePlayers;
                v23.Size = UDim2.new(0, v22, 0, v22);
                v23.Position = UDim2.new(0.5 + v20, 0, 0.5 - v21, 0);
                local v24;

                if Magnitude <= 50 then
                    v24 = v19 < 0;
                else
                    v24 = false;
                end;

                v23.Visible = v24;
            end;
        end;
    end;

    for _, v in pairs(Players:GetPlayers()) do
        if v ~= p10 and v:FindFirstChild("Prank Call Tag") then
            local Character = v.Character;

            if Character then
                local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart");

                if HumanoidRootPart then
                    local Humanoid = Character:FindFirstChild("Humanoid");

                    if not Humanoid or Humanoid.Health > 0 then
                        local CFrame2 = HumanoidRootPart.CFrame;
                        local Magnitude = (workspace_CurrentCamera.CFrame.Position - CFrame2.Position).Magnitude;
                        local v25 = v12.Screen.CFrame:Inverse() * CFrame2.Position;
                        local v26 = (workspace_CurrentCamera.CFrame.Position - CFrame2.Position).Unit:Dot(workspace_CurrentCamera.CFrame.LookVector);
                        local v27 = v25.X / -v25.Z * (1900 / AbsoluteSize.X);
                        local v28 = v25.Y / v25.Z * (1900 / AbsoluteSize.Y);
                        local v29 = 250 - 200 * (Magnitude / 75);
                        local v30 = ReplicatedStorage.Game.GadgetImg:FindFirstChild("Prank Call");
                        local v31 = v12.Screen.HUD.Assets.Marker:Clone();

                        if v30 then
                            v31.Beat.Image = v30.Texture;
                        end;

                        v31.Name = v.Name;
                        v31.Parent = v12.Screen.HUD.VisiblePlayers;
                        v31.Size = UDim2.new(0, v29, 0, v29);
                        v31.Position = UDim2.new(0.5 + v27, 0, 0.5 - v28, 0);
                        local v32;

                        if Magnitude <= 50 then
                            v32 = v26 < 0;
                        else
                            v32 = false;
                        end;

                        v31.Visible = v32;
                    end;
                end;
            end;
        end;
    end;
end;

return u1;