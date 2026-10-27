-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Signal
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local u1 = nil;

local function acquireRunnerThreadAndCallEventHandler(p2, ...) -- Line: 35
    -- upvalues: u1 (ref)
    local v3 = u1;
    u1 = nil;
    p2(...);
    u1 = v3;
end;

local function runEventHandlerInFreeThread() -- Line: 46
    -- upvalues: acquireRunnerThreadAndCallEventHandler (copy)
    while true do
        acquireRunnerThreadAndCallEventHandler(coroutine.yield());
    end;
end;

local u4 = {};
u4.__index = u4;

function u4.new(p5, p6) -- Line: 61
    -- upvalues: u4 (copy)
    return setmetatable({
        _connected = true,
        _next = false,
        _signal = p5,
        _fn = p6
    }, u4);
end;

function u4.Disconnect(p7) -- Line: 70
    p7._connected = false;

    if p7._signal._handlerListHead == p7 then
        p7._signal._handlerListHead = p7._next;

        return;
    end;

    local _handlerListHead = p7._signal._handlerListHead;

    while _handlerListHead and _handlerListHead._next ~= p7 do
        _handlerListHead = _handlerListHead._next;
    end;

    if _handlerListHead then
        _handlerListHead._next = p7._next;
    end;
end;

setmetatable(u4, {
    __index = function(p8, p9) -- Line: 92, Name: __index
        error(("Attempt to get Connection::%s (not a valid member)"):format((tostring(p9))), 2);
    end,

    __newindex = function(p10, p11) -- Line: 95, Name: __newindex
        error(("Attempt to set Connection::%s (not a valid member)"):format((tostring(p11))), 2);
    end
});
local u12 = {};
u12.__index = u12;

function u12.new() -- Line: 115
    -- upvalues: u12 (copy)
    return setmetatable({
        _handlerListHead = false
    }, u12);
end;

function u12.Connect(p13, p14) -- Line: 121
    -- upvalues: u4 (copy)
    local v15 = u4.new(p13, p14);

    if not p13._handlerListHead then
        p13._handlerListHead = v15;

        return v15;
    end;

    v15._next = p13._handlerListHead;
    p13._handlerListHead = v15;

    return v15;
end;

function u12.DisconnectAll(p16) -- Line: 134
    p16._handlerListHead = false;
end;

function u12.Fire(p17, ...) -- Line: 142
    -- upvalues: u1 (ref), runEventHandlerInFreeThread (copy)
    local _handlerListHead = p17._handlerListHead;

    while _handlerListHead do
        if _handlerListHead._connected then
            if not u1 then
                u1 = coroutine.create(runEventHandlerInFreeThread);
                coroutine.resume(u1);
            end;

            task.spawn(u1, _handlerListHead._fn, ...);
        end;

        _handlerListHead = _handlerListHead._next;
    end;
end;

function u12.Wait(p18) -- Line: 159
    local coroutine_running_ret = coroutine.running();
    local u19 = nil;
    u19 = p18:Connect(function(...) -- Line: 162
        -- upvalues: u19 (ref), coroutine_running_ret (copy)
        u19:Disconnect();
        task.spawn(coroutine_running_ret, ...);
    end);

    return coroutine.yield();
end;

function u12.Once(p20, u21) -- Line: 171
    local u22 = nil;
    u22 = p20:Connect(function(...) -- Line: 173
        -- upvalues: u22 (ref), u21 (copy)
        if u22._connected then
            u22:Disconnect();
        end;

        u21(...);
    end);

    return u22;
end;

setmetatable(u12, {
    __index = function(p23, p24) -- Line: 184, Name: __index
        error(("Attempt to get Signal::%s (not a valid member)"):format((tostring(p24))), 2);
    end,

    __newindex = function(p25, p26) -- Line: 187, Name: __newindex
        error(("Attempt to set Signal::%s (not a valid member)"):format((tostring(p26))), 2);
    end
});

return u12;