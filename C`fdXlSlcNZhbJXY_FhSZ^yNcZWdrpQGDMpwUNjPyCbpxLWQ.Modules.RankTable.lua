-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.RankTable
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local v1 = {};
local u2 = {
    { 100, "Iron III", "rbxassetid://10523948869" },
    { 200, "Iron II", "rbxassetid://10523952823" },
    { 300, "Iron I", "rbxassetid://10523959111" },
    { 400, "Bronze III", "rbxassetid://10523924584" },
    { 500, "Bronze II", "rbxassetid://10523936628" },
    { 600, "Bronze I", "rbxassetid://10523943194" },
    { 700, "Silver III", "rbxassetid://10524007746" },
    { 800, "Silver II", "rbxassetid://10524009573" },
    { 900, "Silver I", "rbxassetid://10524010488" },
    { 1000, "Gold III", "rbxassetid://10524029143" },
    { 1100, "Gold II", "rbxassetid://10524029698" },
    { 1200, "Gold I", "rbxassetid://10524030059" },
    { 1300, "Platinum III", "rbxassetid://10524051474" },
    { 1400, "Platinum II", "rbxassetid://10524051785" },
    { 1500, "Platinum I", "rbxassetid://10524052014" },
    { 1600, "Diamond III", "rbxassetid://10524068495" },
    { 1700, "Diamond II", "rbxassetid://10524068850" },
    { 1800, "Diamond I", "rbxassetid://10524069242" },
    { 1900, "Elite III", "rbxassetid://10524082046" },
    { 2000, "Elite II", "rbxassetid://10524082439" },
    { (1 / 0), "Elite I", "rbxassetid://10524082689" }
};

function v1.GetRank(p3) -- Line: 42
    -- upvalues: u2 (copy)
    if typeof(p3) ~= "number" then
        return;
    end;

    for _, v in pairs(u2) do
        if v[1] > p3 then
            return v[2], v[3], v[1];
        end;
    end;
end;

return v1;