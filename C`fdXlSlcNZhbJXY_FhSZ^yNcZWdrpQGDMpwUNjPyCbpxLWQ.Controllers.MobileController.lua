-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Controllers.MobileController
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Controllers
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local LocalPlayer = game:GetService("Players").LocalPlayer;
local MobileHUD = script:WaitForChild("MobileHUD");
local Main = MobileHUD:WaitForChild("Main");
local Contexts = Main:WaitForChild("Contexts");
local u1 = {};
local v2 = {};

local function SetButtonsVisibility(p3: userdata, p4: boolean) -- Line: 13
    if not p3 then
        return;
    end;

    if not p3:IsA("Frame") then
        return;
    end;

    p3.Visible = p4;
end;

function v2.GetButtonByName(p5: string) -- Line: 20
    -- upvalues: u1 (copy)
    if typeof(p5) == "string" then
        return u1[p5];
    end;
end;

function v2.SetMobileHudVisible(p6: boolean) -- Line: 25
    -- upvalues: MobileHUD (copy)
    if typeof(p6) ~= "boolean" then
        return;
    end;

    MobileHUD.Main.Visible = p6;
end;

function v2.ShowOnlyMenu(p7: string) -- Line: 30
    -- upvalues: Contexts (copy)
    if typeof(p7) == "string" then
        for _, child in pairs(Contexts:GetChildren()) do
            if child:IsA("Frame") then
                local v8 = child.Name == p7;

                if child then
                    if child:IsA("Frame") then
                        child.Visible = v8;
                    end;
                end;
            end;
        end;

        return;
    end;

    warn((`Invalid menuName: {p7}`));
end;

function v2.OnStart(p9: userdata) -- Line: 40
    -- upvalues: Main (copy), u1 (copy), MobileHUD (copy), LocalPlayer (copy)
    for _, descendant in pairs(Main:GetDescendants()) do
        if descendant:IsA("ImageButton") then
            u1[descendant.Name] = descendant;
        end;
    end;

    MobileHUD.Parent = LocalPlayer.PlayerGui;
end;

return v2;