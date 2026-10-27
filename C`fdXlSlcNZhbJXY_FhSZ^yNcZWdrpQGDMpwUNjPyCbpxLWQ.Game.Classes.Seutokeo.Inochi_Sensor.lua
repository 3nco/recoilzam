-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Seutokeo.Inochi Sensor
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Game.Classes.Seutokeo
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:35
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

game:GetService("ReplicatedStorage");
local Players = game:GetService("Players");
local TweenService = game:GetService("TweenService");
local u1 = {
    SlideEx = CFrame.new(0, 0, 0),
    SlideLock = false,
    canAim = false,
    Zoom = 60,
    gunName = "Inochi Sensor",
    Type = "Gadget",
    EnableHUD = false,
    IncludeChamberedBullet = false,
    Ammo = 1,
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
    MainCFrame = CFrame.new(0, -0.2, 0.2),
    GunModelFixed = true,
    GunCFrame = CFrame.new(0.5, -1.2, 0.45) * CFrame.Angles(2.443460952792061, 0, 0),
    LArmCFrame = CFrame.new(-0.7, -1.1, -0.5) * CFrame.Angles(3.0543261909900767, 0, 0),
    RArmCFrame = CFrame.new(0.5, -1, -0.05) * CFrame.Angles(2.443460952792061, 0, 0)
};

function u1.EquipAnim(p2) -- Line: 110
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
    p2[4].Handle.Scan:Play();

    for _, child in pairs(p2[4]:GetChildren()) do
        if child:IsA("BasePart") and child.Name:match("Hide") then
            child.Transparency = 1;

            for _, child2 in pairs(child:GetChildren()) do
                if child2:isA("Decal") then
                    child2.Transparency = 1;
                end;
            end;
        end;
    end;

    p2[4].Screen.HUD.Enabled = true;
end;

function u1.UnEquipAnim(p3) -- Line: 134
    -- upvalues: TweenService (copy), u1 (copy)
    p3[4].Screen.HUD.Enabled = false;

    for _, child in pairs(p3[4]:GetChildren()) do
        if child:IsA("BasePart") and child.Name:match("Hide") then
            child.Transparency = 0;

            for _, child2 in pairs(child:GetChildren()) do
                if child2:isA("Decal") then
                    child2.Transparency = 0;
                end;
            end;
        end;
    end;

    TweenService:Create(p3[1], TweenInfo.new(0, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p3[2], TweenInfo.new(0, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
    wait(0.15);
    TweenService:Create(p3[1], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(1, -2, 1) * CFrame.Angles(1.5707963267948966, 0, 0)):inverse()
    }):Play();
    TweenService:Create(p3[2], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = (CFrame.new(-1, -2, 1) * CFrame.Angles(1.5707963267948966, 0, 0)):inverse()
    }):Play();
    wait(0.35);
end;

function u1.IdleAnim(p4) -- Line: 157
    -- upvalues: TweenService (copy), u1 (copy)
    TweenService:Create(p4[1], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.RArmCFrame:Inverse()
    }):Play();
    TweenService:Create(p4[2], TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
        C1 = u1.LArmCFrame:Inverse()
    }):Play();
end;

function u1.LowReady(p5) -- Line: 161
end;

function u1.HighReady(p6) -- Line: 165
end;

function u1.Patrol(p7) -- Line: 169
end;

function u1.SprintAnim(p8) -- Line: 173
end;

function u1.ReloadAnim(p9) -- Line: 177
end;

function u1.TacticalReloadAnim(p10) -- Line: 181
end;

function u1.JammedAnim(p11) -- Line: 185
end;

function u1.PumpAnim(p12) -- Line: 189
end;

function u1.MagCheck(p13) -- Line: 193
end;

function u1.meleeAttack(p14) -- Line: 197
end;

function u1.GrenadeReady(p15) -- Line: 201
end;

function u1.GrenadeThrow(p16) -- Line: 205
end;

u1.SV_GunPos = CFrame.new(-0.75, 0, -0.55) * CFrame.Angles(-1.5707963267948966, 0, 0);
local workspace_CurrentCamera = workspace.CurrentCamera;
local u17 = false;

function u1.OnEquip(p18: userdata) -- Line: 219
    -- upvalues: u17 (ref)
    u17 = true;
end;

function u1.OnUnequip(p19: userdata) -- Line: 223
    -- upvalues: u17 (ref)
    u17 = false;
end;

function u1.OnUpdate(p20: userdata, p21: userdata) -- Line: 227
    -- upvalues: u17 (ref), workspace_CurrentCamera (copy), Players (copy)
    if not u17 then
        return;
    end;

    if not p21 then
        return;
    end;

    local v22 = p21:FindFirstChild("Inochi Sensor");

    if not v22 then
        return;
    end;

    local v23 = 2 * os.clock();
    local v24 = (math.sin(v23) + 1) * 0.5;
    local AbsoluteSize = v22.Screen.HUD.AbsoluteSize;
    v22.Screen.HUD.Sonar.Position = UDim2.new(v24, 0, 0.5, 0);
    local WN = v22.Screen.HUD.WN;
    local v25 = math.noise(0.125) * os.clock();
    local v26 = math.sin(v25) / 4;
    WN.ImageTransparency = 0.85 - math.abs(v26);
    v22.Screen.HUD.WN.TileSize = UDim2.new(math.random(400, 600) / 750, 0, math.random(400, 600) / 750, 0);
    Ray.new(v22.Screen.Position, v22.Screen.Position + workspace_CurrentCamera.CFrame.LookVector);

    for _, v in pairs(Players:GetPlayers()) do
        if v.Team ~= p20.Team and not v22.Screen.HUD.VisiblePlayers:FindFirstChild(v.Name) then
            local Character = v.Character;

            if Character then
                local Humanoid = Character:FindFirstChild("Humanoid");

                if Humanoid and Humanoid.Health > 0 then
                    local UpperTorso = Character:FindFirstChild("UpperTorso");

                    if UpperTorso then
                        local v27 = Character:FindFirstChild("Adrenaline") and 90 or 45;
                        local Magnitude = (workspace_CurrentCamera.CFrame.Position - UpperTorso.Position).Magnitude;
                        local v28 = v22.Screen.CFrame:Inverse() * UpperTorso.Position;
                        local v29 = (workspace_CurrentCamera.CFrame.Position - UpperTorso.Position).Unit:Dot(workspace_CurrentCamera.CFrame.LookVector);
                        local v30 = v28.X / -v28.Z * (2000 / AbsoluteSize.X);
                        local v31 = v28.Y / v28.Z * (2250 / AbsoluteSize.Y);
                        local v32 = 250 - 200 * (Magnitude / 75);
                        local v33 = v22.Screen.HUD.Assets.Marker:Clone();
                        v33.Name = v.Name;
                        v33.Parent = v22.Screen.HUD.VisiblePlayers;
                        v33.Size = UDim2.new(0, v32, 0, v32);
                        v33.Position = UDim2.new(0.5 + v30, 0, 0.5 - v31, 0);
                        v33.TextLabel.Text = `{string.format("%.1f", Magnitude / 3)} m`;
                        local v34;

                        if Magnitude <= v27 then
                            v34 = v29 < 0;
                        else
                            v34 = false;
                        end;

                        v33.Visible = v34;
                    end;
                end;
            end;
        end;
    end;

    for _, child in pairs(v22.Screen.HUD.VisiblePlayers:GetChildren()) do
        local v35 = Players:FindFirstChild(child.Name);

        if v35 and v35:IsA("Player") then
            local Character = v35.Character;

            if Character then
                local Humanoid = Character:FindFirstChild("Humanoid");

                if Humanoid and Humanoid.Health > 0 then
                    local UpperTorso = Character:FindFirstChild("UpperTorso");

                    if UpperTorso then
                        local v36 = Character:FindFirstChild("Adrenaline") and 90 or 45;
                        local Magnitude = (workspace_CurrentCamera.CFrame.Position - UpperTorso.Position).Magnitude;
                        local v37 = v22.Screen.CFrame:Inverse() * UpperTorso.Position;
                        local v38 = (workspace_CurrentCamera.CFrame.Position - UpperTorso.Position).Unit:Dot(workspace_CurrentCamera.CFrame.LookVector);
                        local v39 = v37.X / -v37.Z * (2000 / AbsoluteSize.X);
                        local v40 = v37.Y / v37.Z * (2250 / AbsoluteSize.Y);
                        local v41 = 250 - 200 * (Magnitude / 90);
                        child.TextLabel.Text = `{string.format("%.1f", Magnitude / 3)} m`;
                        child.Size = UDim2.new(0, v41, 0, v41);
                        local v42;

                        if Magnitude <= v36 then
                            v42 = v38 < 0;
                        else
                            v42 = false;
                        end;

                        child.Visible = v42;
                        child.Position = UDim2.new(0.5 + v39, 0, 0.5 - v40, 0);
                    else
                        child:Destroy();
                    end;
                else
                    child:Destroy();
                end;
            else
                child:Destroy();
            end;
        else
            child:Destroy();
        end;
    end;
end;

return u1;