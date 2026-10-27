-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index.Util.Serdes
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index.Util
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local v1 = {};
local RunService = game:GetService("RunService");
local u2 = 0;
local Reliable = require(script.Parent.Parent.Event).Reliable;
local Assert = require(script.Parent.Assert);

function v1.increment(u3: string, p4: number?) -- Line: 10
    -- upvalues: Assert (copy), RunService (copy), u2 (ref), Reliable (copy)
    Assert(typeof(u3) == "string", "Identifier must be a string type.");

    if RunService:IsServer() then
        Assert(u2 < 255, "reached max 255 identifiers.");

        if not Reliable:GetAttribute(u3) then
            u2 = u2 + 1;
            Reliable:SetAttribute(`{u2}`, u3);
            Reliable:SetAttribute(u3, u2);
        end;

        return Reliable:GetAttribute(u3);
    end;

    local coroutine_running_ret = coroutine.running();
    local task_delay_ret = task.delay(p4 or 10, function() -- Line: 22
        -- upvalues: coroutine_running_ret (copy), u3 (copy)
        task.spawn(coroutine_running_ret, nil);
        error(`Serdes: {u3} is taking too long to retrieve, seems like it's not replicated on server.`, 2);
    end);
    task.spawn(function() -- Line: 26
        -- upvalues: task_delay_ret (copy), Reliable (ref), u3 (copy), coroutine_running_ret (copy)
        while coroutine.status(task_delay_ret) ~= "dead" and task.wait(0.5) do
            if Reliable:GetAttribute(u3) then
                task.cancel(task_delay_ret);
                task.spawn(coroutine_running_ret, Reliable:GetAttribute(u3));

                return;
            end;
        end;
    end);

    return coroutine.yield();
end;

function v1.decrement() -- Line: 40
    -- upvalues: RunService (copy), u2 (ref), Reliable (copy)
    if not RunService:IsServer() or u2 <= 0 then
        return;
    end;

    local Attribute = Reliable:GetAttribute((`{u2}`));

    if not Attribute then
        return;
    end;

    Reliable:SetAttribute(`{Attribute}`, nil);
    Reliable:SetAttribute(`{u2}`, nil);
    u2 = u2 - 1;
end;

return v1;