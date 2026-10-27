-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index.Client.Index
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index.Client
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local u1 = {};
u1.__index = u1;
game:GetService("Players");
local Util = script.Parent.Parent.Util;
require(script.Parent.Parent.Type);
local ClientProcess = require(script.Parent.ClientProcess);
local Assert = require(Util.Assert);
local Key = require(Util.Key);
local Serdes = require(Util.Serdes);
local Buffer = require(Util.Buffer);

function u1.new(p2: string, p3: any) -- Line: 17
    -- upvalues: u1 (copy), Buffer (copy), Serdes (copy), ClientProcess (copy)
    local v4 = setmetatable({}, u1);
    v4._buffer = Buffer.new();
    local v5;

    if p3 then
        v5 = p3.yieldWait;
    else
        v5 = p3;
    end;

    v4._buffer:wu8(Serdes.increment(p2, v5));
    v4.id = Buffer.convert(v4._buffer:build());
    v4.fn = {};
    v4._conf = table.freeze(p3 or {});
    v4.IsConnected = false;
    ClientProcess.add(v4.id, p2, p3 or {
        yieldWait = 10,
        logging = {
            store = false,
            opt = false
        }
    });
    v4._buffer:remove();

    return v4;
end;

function u1.logs(p6) -- Line: 33
    -- upvalues: Assert (copy), ClientProcess (copy)
    Assert(p6._conf.logging, "[Client]: Event is not configured with logging.");

    return ClientProcess.getlogs(p6.id);
end;

function u1.Fire(p7: table, p8: boolean, ...) -- Line: 38
    -- upvalues: ClientProcess (copy)
    ClientProcess.insertQueue(p7.id, p8, ...);
end;

function u1.Invoke(p9: table, p10: number, ...) -- Line: 42
    -- upvalues: ClientProcess (copy)
    return ClientProcess.insertRequest(p9.id, p10, ...);
end;

function u1.Connect(p11: table, p12: function) -- Line: 46
    -- upvalues: Key (copy), ClientProcess (copy)
    local v13 = tostring(Key());
    table.insert(p11.fn, v13);
    p11.IsConnected = #p11.fn > 0;
    ClientProcess.addCallback(p11.id, v13, p12);

    return v13;
end;

function u1.Once(u14: table, u15: function) -- Line: 54
    -- upvalues: Key (copy), ClientProcess (copy)
    local u16 = tostring(Key());
    table.insert(u14.fn, u16);
    u14.IsConnected = #u14.fn > 0;
    ClientProcess.addCallback(u14.id, u16, function(...) -- Line: 58
        -- upvalues: u14 (copy), u16 (copy), u15 (copy)
        u14:Disconnect(u16);
        task.spawn(u15, ...);
    end);

    return u16;
end;

function u1.Wait(p17) -- Line: 65
    local coroutine_running_ret = coroutine.running();
    local os_clock_ret = os.clock();
    p17:Once(function() -- Line: 67
        -- upvalues: coroutine_running_ret (copy), os_clock_ret (copy)
        task.spawn(coroutine_running_ret, os.clock() - os_clock_ret);
    end);

    return coroutine.yield();
end;

function u1.DisconnectAll(p18) -- Line: 73
    for _, v in p18.fn do
        p18:Disconnect(v);
    end;
end;

function u1.Disconnect(p19: table, p20: string) -- Line: 79
    -- upvalues: Assert (copy), ClientProcess (copy)
    Assert(typeof(p20) == "string", "Key must be a string type.");
    ClientProcess.removeCallback(p19.id, p20);
    table.remove(p19.fn, table.find(p19.fn, p20));
    p19.IsConnected = #p19.fn > 0;
end;

function u1.Destroy(p21) -- Line: 86
    -- upvalues: ClientProcess (copy), Serdes (copy)
    p21:DisconnectAll();
    p21._buffer:remove();
    ClientProcess.remove(p21.id);
    Serdes.decrement();
    table.clear(p21);
    setmetatable(p21, nil);
end;

return u1.new;