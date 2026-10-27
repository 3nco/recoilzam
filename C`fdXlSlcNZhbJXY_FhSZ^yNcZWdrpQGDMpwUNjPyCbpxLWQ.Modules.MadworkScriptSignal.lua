-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.MadworkScriptSignal
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local v1 = {};
local u2 = nil;

local function AcquireRunnerThreadAndCallEventHandler(p3, ...) -- Line: 60
    -- upvalues: u2 (ref)
    local v4 = u2;
    u2 = nil;
    p3(...);
    u2 = v4;
end;

local function RunEventHandlerInFreeThread(...) -- Line: 68
    -- upvalues: AcquireRunnerThreadAndCallEventHandler (copy)
    AcquireRunnerThreadAndCallEventHandler(...);

    while true do
        AcquireRunnerThreadAndCallEventHandler(coroutine.yield());
    end;
end;

local u6 = {
    Disconnect = function(p5) -- Line: 88, Name: Disconnect
        -- upvalues: u2 (ref), RunEventHandlerInFreeThread (copy)
        local _listener = p5._listener;

        if _listener ~= nil then
            local _listener_table = p5._listener_table;
            local table_find_ret = table.find(_listener_table, _listener);

            if table_find_ret ~= nil then
                table.remove(_listener_table, table_find_ret);
            end;

            p5._listener = nil;
        end;

        if p5._disconnect_listener ~= nil then
            if not u2 then
                u2 = coroutine.create(RunEventHandlerInFreeThread);
            end;

            task.spawn(u2, p5._disconnect_listener, p5._disconnect_param);
            p5._disconnect_listener = nil;
        end;
    end
};

function v1.NewArrayScriptConnection(p7, p8, p9, p10) -- Line: 107
    -- upvalues: u6 (copy)
    return {
        _listener = p8,
        _listener_table = p7,
        _disconnect_listener = p9,
        _disconnect_param = p10,
        Disconnect = u6.Disconnect
    };
end;

local u11 = {};
u11.__index = u11;

function u11.Disconnect(p12) -- Line: 132
    -- upvalues: u2 (ref), RunEventHandlerInFreeThread (copy)
    if p12._is_connected == false then
        return;
    end;

    p12._is_connected = false;
    local _script_signal = p12._script_signal;
    _script_signal._listener_count = _script_signal._listener_count - 1;

    if p12._script_signal._head == p12 then
        p12._script_signal._head = p12._next;
    else
        local _head = p12._script_signal._head;

        while _head ~= nil and _head._next ~= p12 do
            _head = _head._next;
        end;

        if _head ~= nil then
            _head._next = p12._next;
        end;
    end;

    if p12._disconnect_listener ~= nil then
        if not u2 then
            u2 = coroutine.create(RunEventHandlerInFreeThread);
        end;

        task.spawn(u2, p12._disconnect_listener, p12._disconnect_param);
        p12._disconnect_listener = nil;
    end;
end;

local u13 = {};
u13.__index = u13;

function u13.Connect(p14, p15, p16, p17) -- Line: 173
    -- upvalues: u11 (copy)
    local v18 = {
        _is_connected = true,
        _listener = p15,
        _script_signal = p14,
        _disconnect_listener = p16,
        _disconnect_param = p17,
        _next = p14._head
    };
    setmetatable(v18, u11);
    p14._head = v18;
    p14._listener_count = p14._listener_count + 1;

    return v18;
end;

function u13.GetListenerCount(p19) -- Line: 193
    return p19._listener_count;
end;

function u13.Fire(p20, ...) -- Line: 197
    -- upvalues: u2 (ref), RunEventHandlerInFreeThread (copy)
    local _head = p20._head;

    while _head ~= nil do
        if _head._is_connected == true then
            if not u2 then
                u2 = coroutine.create(RunEventHandlerInFreeThread);
            end;

            task.spawn(u2, _head._listener, ...);
        end;

        _head = _head._next;
    end;
end;

function u13.FireUntil(p21, p22, ...) -- Line: 210
    local _head = p21._head;

    while _head ~= nil do
        if _head._is_connected == true then
            _head._listener(...);

            if p22() ~= true then
                return;
            end;
        end;

        _head = _head._next;
    end;
end;

function v1.NewScriptSignal() -- Line: 223
    -- upvalues: u13 (copy)
    return {
        _head = nil,
        _listener_count = 0,
        Connect = u13.Connect,
        GetListenerCount = u13.GetListenerCount,
        Fire = u13.Fire,
        FireUntil = u13.FireUntil
    };
end;

return v1;