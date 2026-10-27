-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index.Util.RateLimit
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index.Util
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local v1 = {};
local RunService = game:GetService("RunService");
local Assert = require(script.Parent.Assert);
local Reliable = require(script.Parent.Parent.Event).Reliable;

function v1.create(p2: string, u3: number?, u4: number?) -- Line: 9
    -- upvalues: Assert (copy), RunService (copy), Reliable (copy)
    Assert(typeof(p2) == "string", "Identifier must a string type.");

    if RunService:IsServer() then
        Assert(typeof(u3) == "number", "entrance must a number type.");
        Assert(u3 > 0, "entrance must above 0.");
        Reliable:SetAttribute(p2 .. "_ent", u3);
        Reliable:SetAttribute(p2 .. "_int", u4);
    else
        while not (Reliable:GetAttribute(p2 .. "_ent") and Reliable:GetAttribute(p2 .. "_int")) do
            task.wait(0.5);
        end;

        u3 = tonumber(Reliable:GetAttribute(p2 .. "_ent"));
        u4 = tonumber(Reliable:GetAttribute(p2 .. "_int"));
    end;

    local u5 = 0;

    return function(p6: number?) -- Line: 24
        -- upvalues: u5 (ref), u4 (ref), u3 (ref)
        if u5 == 0 then
            task.delay(u4, function() -- Line: 26
                -- upvalues: u5 (ref)
                u5 = 0;
            end);
        end;

        u5 = u5 + (p6 or 1);

        return u5 <= u3;
    end;
end;

return v1;