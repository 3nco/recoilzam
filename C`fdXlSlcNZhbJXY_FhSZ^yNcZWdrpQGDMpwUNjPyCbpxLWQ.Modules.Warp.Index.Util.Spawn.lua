-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index.Util.Spawn
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index.Util
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local u1 = nil;
local u2 = {};

local function passer(p3: function, ...) -- Line: 9
    -- upvalues: u1 (ref), u2 (copy)
    local v4 = u1;
    u1 = nil;
    p3(...);

    if u1 then
        table.insert(u2, v4);

        return;
    end;

    u1 = v4;
end;

local function yield() -- Line: 20
    -- upvalues: passer (copy)
    while true do
        passer(coroutine.yield());
    end;
end;

local function createThread() -- Line: 26
    -- upvalues: yield (copy), u2 (copy)
    local coroutine_create_ret = coroutine.create(yield);
    coroutine.resume(coroutine_create_ret, coroutine_create_ret);
    table.insert(u2, coroutine_create_ret);
end;

local coroutine_create_ret = coroutine.create(yield);
coroutine.resume(coroutine_create_ret, coroutine_create_ret);
table.insert(u2, coroutine_create_ret);
local coroutine_create_ret2 = coroutine.create(yield);
coroutine.resume(coroutine_create_ret2, coroutine_create_ret2);
table.insert(u2, coroutine_create_ret2);
local coroutine_create_ret3 = coroutine.create(yield);
coroutine.resume(coroutine_create_ret3, coroutine_create_ret3);
table.insert(u2, coroutine_create_ret3);
local coroutine_create_ret4 = coroutine.create(yield);
coroutine.resume(coroutine_create_ret4, coroutine_create_ret4);
table.insert(u2, coroutine_create_ret4);
local coroutine_create_ret5 = coroutine.create(yield);
coroutine.resume(coroutine_create_ret5, coroutine_create_ret5);
table.insert(u2, coroutine_create_ret5);

return function(p5: function, ...) -- Line: 36
    -- upvalues: u1 (ref), u2 (copy), yield (copy)
    if not u1 then
        if #u2 == 0 then
            local coroutine_create_ret6 = coroutine.create(yield);
            coroutine.resume(coroutine_create_ret6, coroutine_create_ret6);
            table.insert(u2, coroutine_create_ret6);
        end;

        u1 = table.remove(u2, 1);
    end;

    task.spawn(u1, p5, ...);
end;