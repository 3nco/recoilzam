-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index.Signal.Dedicated
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index.Signal
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local u1 = {};
u1.__index = u1;

function u1.new(p2: any, p3: function) -- Line: 7
    -- upvalues: u1 (copy)
    return setmetatable({
        fn = p3,
        root = p2
    }, u1);
end;

function u1.Disconnect(p4) -- Line: 14
    table.clear(p4);
    setmetatable(p4, nil);
end;

return u1.new;