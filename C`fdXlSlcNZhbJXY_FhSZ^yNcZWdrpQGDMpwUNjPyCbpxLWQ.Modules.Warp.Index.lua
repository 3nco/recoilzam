-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local u1 = {};
local u2 = game:GetService("RunService"):IsServer();
local script_Util = script.Util;
local script_Server = script.Server;
local script_Client = script.Client;
require(script.Type);
local Assert = require(script_Util.Assert);
local script_Signal = require(script.Signal);
local Buffer = require(script_Util.Buffer);

if u2 then
    require(script_Server.ServerProcess).start();
else
    require(script_Client.ClientProcess).start();
end;

function u1.Server(p3: string, p4: any) -- Line: 24
    -- upvalues: Assert (copy), u2 (copy), script_Server (copy)
    Assert(u2, (`[Warp]: Calling .Server({p3}) on client side (expected server side)`));
    Assert(typeof(p3) == "string", (`[Warp]: Identifier must be a string type, got {typeof(p3)}`));

    return require(script_Server.Index)(p3, p4);
end;

function u1.Client(p5: string, p6: any) -- Line: 29
    -- upvalues: Assert (copy), u2 (copy), script_Client (copy)
    Assert(not u2, (`[Warp]: Calling .Client({p5}) on server side (expected client side)`));
    Assert(typeof(p5) == "string", (`[Warp]: Identifier must be a string type, got {typeof(p5)}`));

    return require(script_Client.Index)(p5, p6);
end;

function u1.fromServerArray(p7: table) -- Line: 35
    -- upvalues: Assert (copy), u2 (copy), u1 (copy)
    Assert(u2, (`[Warp]: Calling .fromServerArray({p7}) on client side (expected server side)`));
    Assert(typeof(p7) == "table", "[Warp]: Array must be a table type, got {typeof(arrays)}");
    local v8 = {};

    for i, v in p7 do
        if typeof(v) == "table" then
            v8[i] = u1.Server(i, v);
        else
            v8[v] = u1.Server(v);
        end;
    end;

    return v8;
end;

function u1.fromClientArray(p9: table) -- Line: 49
    -- upvalues: Assert (copy), u2 (copy), u1 (copy)
    Assert(not u2, (`[Warp]: Calling .fromClientArray({p9}) on server side (expected client side)`));
    Assert(typeof(p9) == "table", (`[Warp]: Array must be a table type, got {typeof(p9)}`));
    local v10 = {};

    for i, v in p9 do
        if typeof(v) == "table" then
            v10[i] = u1.Client(i, v);
        else
            v10[v] = u1.Client(v);
        end;
    end;

    return v10;
end;

function u1.Signal(p11: string) -- Line: 63
    -- upvalues: script_Signal (copy)
    return script_Signal(p11);
end;

function u1.fromSignalArray(p12: table) -- Line: 67
    -- upvalues: Assert (copy), u1 (copy)
    Assert(typeof(p12) == "table", (`[Warp]: Array must be a table type, got {typeof(p12)}`));
    local v13 = {};

    for _, v in p12 do
        v13[v] = u1.Signal(v);
    end;

    return v13;
end;

function u1.buffer() -- Line: 76
    -- upvalues: Buffer (copy)
    return Buffer.new();
end;

return table.freeze(u1);