-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index.Server.Index
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index.Server
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local u1 = {};
u1.__index = u1;
local Players = game:GetService("Players");
local Util = script.Parent.Parent.Util;
require(script.Parent.Parent.Type);
local ServerProcess = require(script.Parent.ServerProcess);
local Assert = require(Util.Assert);
local Key = require(Util.Key);
local Serdes = require(Util.Serdes);
local Buffer = require(Util.Buffer);

function u1.new(p2: string, p3: any) -- Line: 17
    -- upvalues: u1 (copy), Buffer (copy), Serdes (copy), ServerProcess (copy)
    local v4 = setmetatable({}, u1);
    v4._buffer = Buffer.new();
    v4._buffer:wu8(Serdes.increment(p2));
    v4.id = Buffer.convert(v4._buffer:build());
    v4.fn = {};
    v4._conf = table.freeze(p3 or {});
    v4.IsConnected = false;
    ServerProcess.add(v4.id, p2, p3 or {
        rateLimit = {
            maxEntrance = 200,
            interval = 2
        }
    });
    v4._buffer:remove();

    return v4;
end;

function u1.logs(p5) -- Line: 33
    -- upvalues: Assert (copy), ServerProcess (copy)
    Assert(p5._conf.logging, "[Server]: Event is not configured with logging.");

    return ServerProcess.getlogs(p5.id);
end;

function u1.Fire(p6: table, p7: boolean, p8: userdata, ...) -- Line: 38
    -- upvalues: ServerProcess (copy)
    ServerProcess.insertQueue(p6.id, p7, p8, ...);
end;

function u1.Fires(p9: table, p10: boolean, ...) -- Line: 42
    -- upvalues: Players (copy), ServerProcess (copy)
    for _, v in ipairs(Players:GetPlayers()) do
        ServerProcess.insertQueue(p9.id, p10, v, ...);
    end;
end;

function u1.FireExcept(p11: table, p12: boolean, p13: table, ...) -- Line: 48
    -- upvalues: Players (copy), ServerProcess (copy)
    for _, v in ipairs(Players:GetPlayers()) do
        if not table.find(p13, v) then
            ServerProcess.insertQueue(p11.id, p12, v, ...);
        end;
    end;
end;

function u1.FireIn(p14: table, p15: boolean, p16: number, p17: vector, p18: table, p19: table?) -- Line: 55
    -- upvalues: Players (copy), ServerProcess (copy)
    for _, v in ipairs(Players:GetPlayers()) do
        if not (p19 and table.find(p19, v)) and (v.Character and (v.Character.PrimaryPart and (v.Character.PrimaryPart.Position - p17).Magnitude >= p16)) then
            ServerProcess.insertQueue(p14.id, p15, v, table.unpack(p18));
        end;
    end;
end;

function u1.Invoke(p20: table, p21: number, p22: userdata, ...) -- Line: 62
    -- upvalues: ServerProcess (copy)
    return ServerProcess.insertRequest(p20.id, p21, p22, ...);
end;

function u1.Connect(p23: table, p24: function) -- Line: 66
    -- upvalues: Key (copy), ServerProcess (copy)
    local v25 = tostring(Key());
    table.insert(p23.fn, v25);
    ServerProcess.addCallback(p23.id, v25, p24);
    p23.IsConnected = #p23.fn > 0;

    return v25;
end;

function u1.Once(u26: table, u27: function) -- Line: 74
    -- upvalues: Key (copy), ServerProcess (copy)
    local u28 = tostring(Key());
    table.insert(u26.fn, u28);
    u26.IsConnected = #u26.fn > 0;
    ServerProcess.addCallback(u26.id, u28, function(p29: userdata, ...) -- Line: 78
        -- upvalues: u26 (copy), u28 (copy), u27 (copy)
        u26:Disconnect(u28);
        task.spawn(u27, p29, ...);
    end);

    return u28;
end;

function u1.Wait(p30) -- Line: 85
    local coroutine_running_ret = coroutine.running();
    local os_clock_ret = os.clock();
    p30:Once(function() -- Line: 87
        -- upvalues: coroutine_running_ret (copy), os_clock_ret (copy)
        task.spawn(coroutine_running_ret, os.clock() - os_clock_ret);
    end);

    return coroutine.yield();
end;

function u1.DisconnectAll(p31) -- Line: 93
    for _, v in p31.fn do
        p31:Disconnect(v);
    end;
end;

function u1.Disconnect(p32: table, p33: string) -- Line: 99
    -- upvalues: Assert (copy), ServerProcess (copy)
    Assert(typeof(p33) == "string", "Key must be a string type.");
    ServerProcess.removeCallback(p32.id, p33);
    table.remove(p32.fn, table.find(p32.fn, p33));
    p32.IsConnected = #p32.fn > 0;

    return table.find(p32.fn, p33) == nil;
end;

function u1.Destroy(p34) -- Line: 107
    -- upvalues: ServerProcess (copy), Serdes (copy)
    p34:DisconnectAll();
    p34._buffer:remove();
    ServerProcess.remove(p34.id);
    Serdes.decrement();
    table.clear(p34);
    setmetatable(p34, nil);
end;

return u1.new;