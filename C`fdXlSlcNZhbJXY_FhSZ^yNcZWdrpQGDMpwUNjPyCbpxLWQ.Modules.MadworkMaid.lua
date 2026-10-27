-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.MadworkMaid
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local v1 = {};
local u2 = nil;

local function AcquireRunnerThreadAndCallEventHandler(p3, ...) -- Line: 41
    -- upvalues: u2 (ref)
    local v4 = u2;
    u2 = nil;
    p3(...);
    u2 = v4;
end;

local function RunEventHandlerInFreeThread(...) -- Line: 49
    -- upvalues: AcquireRunnerThreadAndCallEventHandler (copy)
    AcquireRunnerThreadAndCallEventHandler(...);

    while true do
        AcquireRunnerThreadAndCallEventHandler(coroutine.yield());
    end;
end;

local function CleanupTask(p5, ...) -- Line: 56
    if type(p5) == "function" then
        p5(...);

        return;
    end;

    if typeof(p5) == "RBXScriptConnection" then
        p5:Disconnect();

        return;
    end;

    if typeof(p5) == "Instance" then
        p5:Destroy();

        return;
    end;

    if type(p5) == "table" then
        if type(p5.Destroy) == "function" then
            p5:Destroy();

            return;
        end;

        if type(p5.Disconnect) == "function" then
            p5:Disconnect();
        end;
    end;
end;

local function PerformCleanupTask(...) -- Line: 72
    -- upvalues: u2 (ref), RunEventHandlerInFreeThread (copy), CleanupTask (copy)
    if not u2 then
        u2 = coroutine.create(RunEventHandlerInFreeThread);
    end;

    task.spawn(u2, CleanupTask, ...);
end;

local u6 = {};
u6.__index = u6;

function u6.AddCleanupTask(u7, u8) -- Line: 89
    -- upvalues: PerformCleanupTask (copy)
    if u7._is_cleaned == true then
        PerformCleanupTask(u8);

        return function() -- Line: 92
        end;
    end;

    if type(u8) == "function" then
        table.insert(u7._cleanup_tasks, u8);
    elseif typeof(u8) == "RBXScriptConnection" then
        table.insert(u7._cleanup_tasks, u8);
    elseif typeof(u8) == "Instance" then
        table.insert(u7._cleanup_tasks, u8);
    elseif type(u8) == "table" then
        if type(u8.Destroy) == "function" then
            table.insert(u7._cleanup_tasks, u8);
        elseif type(u8.Disconnect) == "function" then
            table.insert(u7._cleanup_tasks, u8);
        else
            error("[MadworkMaid]: Received object table as cleanup task, but couldn\'t detect a :Destroy() method");
        end;
    else
        error("[MadworkMaid]: Cleanup task of type \"" .. typeof(u8) .. "\" not supported");
    end;

    return function(...) -- Line: 110
        -- upvalues: u7 (copy), u8 (copy), PerformCleanupTask (ref)
        u7:RemoveCleanupTask(u8);
        PerformCleanupTask(u8, ...);
    end;
end;

function u6.RemoveCleanupTask(p9, p10) -- Line: 116
    local _cleanup_tasks = p9._cleanup_tasks;
    local table_find_ret = table.find(_cleanup_tasks, p10);

    if table_find_ret ~= nil then
        table.remove(_cleanup_tasks, table_find_ret);
    end;
end;

function u6.CleanupOfOne(p11, p12, ...) -- Line: 124
    -- upvalues: PerformCleanupTask (copy)
    p11:RemoveCleanupTask(p12);
    PerformCleanupTask(p12, ...);
end;

function u6.Cleanup(p13, ...) -- Line: 129
    -- upvalues: PerformCleanupTask (copy)
    for _, v in ipairs(p13._cleanup_tasks) do
        PerformCleanupTask(v, ...);
    end;

    p13._cleanup_tasks = {};
    p13._is_cleaned = true;
end;

function v1.NewMaid() -- Line: 139
    -- upvalues: u6 (copy)
    local v14 = {
        _is_cleaned = false,
        _cleanup_tasks = {}
    };
    setmetatable(v14, u6);

    return v14;
end;

v1.Cleanup = PerformCleanupTask;

return v1;