-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index.Util.Buffer
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index.Util
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local v1 = {};
v1.__index = v1;
local script_Dedicated = require(script.Dedicated);
local buffer_tostring = buffer.tostring;
local buffer_fromstring = buffer.fromstring;

function v1.new() -- Line: 12
    -- upvalues: script_Dedicated (copy)
    return script_Dedicated();
end;

function v1.convert(p2: buffer) -- Line: 16
    -- upvalues: buffer_tostring (copy)
    return buffer_tostring(p2);
end;

function v1.revert(p3: string) -- Line: 20
    -- upvalues: buffer_fromstring (copy)
    return buffer_fromstring(p3);
end;

return v1;