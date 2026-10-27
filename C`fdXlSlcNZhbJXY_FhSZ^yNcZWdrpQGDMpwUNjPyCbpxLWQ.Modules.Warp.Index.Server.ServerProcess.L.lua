-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index.Server.ServerProcess.Logger
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index.Server.ServerProcess
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local v1 = {};
local u2 = {};
local u3 = {};
local u4 = tick();

function v1.write(p5: string, p6: string, p7: boolean?) -- Line: 15
    -- upvalues: u2 (copy), u3 (copy), u4 (ref)
    if not u2[p5] then
        u2[p5] = {};
    end;

    if p7 ~= nil then
        u3[p5] = p7;
    end;

    u4 = tick();
    u2[p5][tostring(u4)] = p6;

    if u3[p5] then
        print(`[{u4}] ->`, p6);
    end;
end;

function v1.read(p8: string) -- Line: 29
    -- upvalues: u2 (copy)
    return u2[p8];
end;

function v1.clear(p9: string) -- Line: 33
    -- upvalues: u2 (copy)
    u2[p9] = nil;
end;

return v1;