-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index.Signal
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local u1 = {};
u1.__index = u1;
u1.ClassName = "Signal";
local script_Dedicated = require(script.Dedicated);
local Util = script.Parent.Util;
local Key = require(Util.Key);
local Assert = require(Util.Assert);
local u2 = {};

function u1.new(p3: string) -- Line: 16
    -- upvalues: Assert (copy), u2 (copy), u1 (copy)
    Assert(typeof(p3) == "string", (`[Signal]: Identifier must be a string type, got {typeof(p3)}`));

    if u2[p3] then
        return u2[p3];
    end;

    local v4 = setmetatable({}, u1);
    u2[p3] = v4;

    return v4;
end;

function u1.Connect(p5: table, p6: function, p7: string?) -- Line: 26
    -- upvalues: Key (copy), script_Dedicated (copy)
    local v8 = p7 or tostring(Key());
    p5[v8] = script_Dedicated(p5, p6);

    return v8;
end;

function u1.Once(u9: table, u10: function) -- Line: 32
    local u11 = nil;
    u11 = u9:Connect(function(...) -- Line: 34
        -- upvalues: u9 (copy), u11 (ref), u10 (copy)
        u9:Disconnect(u11);
        task.spawn(u10, ...);
    end);

    return u11;
end;

function u1.Disconnect(p12: table, p13: string) -- Line: 41
    if not p12[p13] then
        return;
    end;

    p12[p13]:Disconnect();
    p12[p13] = nil;
end;

function u1.DisconnectAll(p14) -- Line: 47
    table.clear(p14);
end;

function u1.Wait(p15) -- Line: 51
    local os_clock_ret = os.clock();
    local coroutine_running_ret = coroutine.running();
    p15:Once(function() -- Line: 53
        -- upvalues: coroutine_running_ret (copy), os_clock_ret (copy)
        task.spawn(coroutine_running_ret, os.clock() - os_clock_ret);
    end);

    return coroutine.yield();
end;

function u1.DeferFire(p16, ...) -- Line: 59
    for _, v in p16 do
        task.defer(v.fn, ...);
    end;
end;

function u1.Fire(p17, ...) -- Line: 65
    for _, v in p17 do
        task.spawn(v.fn, ...);
    end;
end;

function u1.FireTo(p18: table, p19: string, ...) -- Line: 71
    -- upvalues: u2 (copy), u1 (copy)
    local v20 = u2[p19];

    if not v20 then
        return;
    end;

    u1.Fire(v20, ...);
end;

function u1.Invoke(p21: table, p22: string, ...) -- Line: 77
    local v23 = p21[p22];

    if v23 then
        return v23.fn(...);
    end;
end;

function u1.InvokeTo(p24: table, p25: string, p26: string, ...) -- Line: 83
    -- upvalues: u2 (copy), u1 (copy)
    if u2[p25] then
        return u1.Invoke(u2[p25], p26, ...);
    end;
end;

function u1.Destroy(p27) -- Line: 88
    p27:DisconnectAll();
    setmetatable(p27, nil);
end;

return u1.new;