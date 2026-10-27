-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index.Client.ClientProcess
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index.Client
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local u1 = {};
local RunService = game:GetService("RunService");
local Util = script.Parent.Parent.Util;
require(script.Parent.Parent.Type);
local Event = require(script.Parent.Parent.Event);
local Spawn = require(Util.Spawn);
local Key = require(Util.Key);
local RateLimit = require(Util.RateLimit);
local Buffer = require(Util.Buffer);
local script_Logger = require(script.Logger);
local u2 = {};
local u3 = {};
local u4 = {};
local u5 = {};
local u6 = {};
local u7 = {};
local u8 = {};
local u9 = {};
local u10 = {};
local u11 = {};
u9[1] = {};
u9[2] = {};
u10[1] = {};
u10[2] = {};
local Reliable = Event.Reliable;
local Unreliable = Event.Unreliable;
local Request = Event.Request;

function u1.insertQueue(p12: string, p13: boolean, ...) -- Line: 54
    -- upvalues: u4 (copy), u3 (copy)
    if p13 then
        if not u3[p12] then
            u3[p12] = {};
        end;

        table.insert(u3[p12], { ... });

        return;
    end;

    if not u4[p12] then
        u4[p12] = {};
    end;

    table.insert(u4[p12], { ... });
end;

function u1.insertRequest(p14: string, u15: number, ...) -- Line: 68
    -- upvalues: u6 (copy), Key (copy)
    if not u6[p14] then
        u6[p14] = {};
    end;

    local coroutine_running_ret = coroutine.running();
    local os_clock_ret = os.clock();
    local task_delay_ret = task.delay(u15, function() -- Line: 73
        -- upvalues: coroutine_running_ret (copy)
        task.spawn(coroutine_running_ret, nil);
    end);
    local v16 = u6[p14];
    local v17 = {
        tostring(Key()),

        function(...) -- Line: 76
            -- upvalues: os_clock_ret (copy), u15 (copy), task_delay_ret (copy), coroutine_running_ret (copy)
            if u15 < os.clock() - os_clock_ret then
                return;
            end;

            task.cancel(task_delay_ret);
            task.spawn(coroutine_running_ret, ...);
        end,

        { ... }
    };
    table.insert(v16, v17);

    return coroutine.yield();
end;

function u1.add(p18: any, p19: string, p20: any) -- Line: 84
    -- upvalues: u7 (copy), u1 (copy), u2 (copy), RateLimit (copy), u3 (copy), u4 (copy), u6 (copy), u5 (copy), u10 (copy), u9 (copy), u8 (copy)
    if not table.find(u7, p18) then
        table.insert(u7, p18);

        if p20.logging then
            u1.logger(p18, p20.logging.store, p20.logging.opt);
        end;

        if not u2[p18] then
            u2[p18] = RateLimit.create(p19);
        end;

        if not u3[p18] then
            u3[p18] = {};
        end;

        if not u4[p18] then
            u4[p18] = {};
        end;

        if not u6[p18] then
            u6[p18] = {};
        end;

        if not u5[p18] then
            u5[p18] = {};
        end;

        if not u10[1][p18] then
            u10[1][p18] = {};
        end;

        if not u10[2][p18] then
            u10[2][p18] = {};
        end;

        if not u9[1][p18] then
            u9[1][p18] = {};
        end;

        if not u9[2][p18] then
            u9[2][p18] = {};
        end;

        if not u8[p18] then
            u8[p18] = {};
        end;
    end;
end;

function u1.remove(p21: string) -- Line: 125
    -- upvalues: u7 (copy), u3 (copy), u4 (copy), u6 (copy), u5 (copy), u2 (copy), u10 (copy), u9 (copy), u8 (copy), script_Logger (copy)
    if not table.find(u7, p21) then
        return;
    end;

    table.remove(u7, table.find(u7, p21));
    u3[p21] = nil;
    u4[p21] = nil;
    u6[p21] = nil;
    u5[p21] = nil;
    u2[p21] = nil;
    u10[1][p21] = nil;
    u10[2][p21] = nil;
    u9[1][p21] = nil;
    u9[2][p21] = nil;
    u8[p21] = nil;
    script_Logger.clear(p21);
end;

function u1.logger(p22: string, p23: boolean, p24: boolean) -- Line: 141
    -- upvalues: u11 (copy), script_Logger (copy)
    u11[p22] = p23;
    script_Logger.write(p22, `state: change -> {p24 == true and "enabled" or "disabled"} logger.`, p24);
end;

function u1.getlogs(p25: string) -- Line: 146
    -- upvalues: script_Logger (copy)
    return script_Logger.read(p25);
end;

function u1.addCallback(p26: string, p27: string, p28: any) -- Line: 150
    -- upvalues: u5 (copy), u11 (copy), script_Logger (copy)
    u5[p26][p27] = p28;

    if u11[p26] then
        task.defer(script_Logger.write, p26, "state: change -> new callback added.");
    end;
end;

function u1.removeCallback(p29: string, p30: string) -- Line: 157
    -- upvalues: u5 (copy), u11 (copy), script_Logger (copy)
    u5[p29][p30] = nil;

    if u11[p29] then
        task.defer(script_Logger.write, p29, "state: change -> removed a callback.");
    end;
end;

function u1.start() -- Line: 164
    -- upvalues: RunService (copy), u4 (copy), u2 (copy), Unreliable (copy), Buffer (copy), u11 (copy), script_Logger (copy), u3 (copy), Reliable (copy), u10 (copy), Request (copy), u7 (copy), u6 (copy), u5 (copy), u8 (copy), Spawn (copy), u9 (copy)
    debug.setmemorycategory("Warp");
    RunService.PostSimulation:Connect(function() -- Line: 166
        -- upvalues: u4 (ref), u2 (ref), Unreliable (ref), Buffer (ref), u11 (ref), script_Logger (ref), u3 (ref), Reliable (ref), u10 (ref), Request (ref), u7 (ref), u6 (ref), u5 (ref), u8 (ref), Spawn (ref), u9 (ref)
        for i, v in u4 do
            if #v ~= 0 then
                if u2[i](#v) then
                    Unreliable:FireServer(Buffer.revert(i), v);

                    if u11[i] then
                        task.defer(script_Logger.write, i, (`state: out -> unreliable -> {#v} data.`));
                    end;
                end;

                u4[i] = nil;
            end;
        end;

        for i, v in u3 do
            if #v > 0 then
                if u2[i](#v) then
                    Reliable:FireServer(Buffer.revert(i), v);

                    if u11[i] then
                        task.defer(script_Logger.write, i, (`state: out -> reliable -> {#v} data.`));
                    end;
                end;

                u3[i] = nil;
            end;
        end;

        for i, v in u10[1] do
            if #v ~= 0 then
                Request:FireServer(Buffer.revert(i), "\1", v);

                if u11[i] then
                    task.defer(script_Logger.write, i, (`state: out -> request -> {#v} data.`));
                end;

                u10[1][i] = nil;
            end;
        end;

        for i, v in u10[2] do
            if #v ~= 0 then
                Request:FireServer(Buffer.revert(i), "\0", v);

                if u11[i] then
                    task.defer(script_Logger.write, i, (`state: out -> return request -> {#v} data.`));
                end;

                u10[2][i] = nil;
            end;
        end;

        for _, v in u7 do
            local u31;

            if u6[v] then
                u31 = v;

                for _, v2 in u6[v] do
                    if v2[3] then
                        if not u10[1][u31] then
                            u10[1][u31] = {};
                        end;

                        table.insert(u10[1][u31], { v2[1], v2[3] });
                        v2[3] = nil;
                    end;
                end;
            else
                u31 = v;
            end;

            local v32 = u5[u31] or nil;

            if v32 then
                if u8[u31] then
                    for _, v2 in u8[u31] do
                        if #v2 ~= 0 then
                            local v33 = v2;

                            for _, v3 in v32 do
                                local v34 = v3;

                                for i = 1, #v33 do
                                    Spawn(v34, table.unpack(v33[i] or {}));
                                    local _ = i;
                                end;
                            end;
                        end;
                    end;

                    u8[u31] = nil;
                end;

                if u9[1][u31] then
                    for _, v2 in u9[1][u31] do
                        if #v2 ~= 0 then
                            local v35 = v2;

                            for _, v3 in v32 do
                                local u36 = v3;

                                for i = 1, #v35 do
                                    local v37;

                                    if v35[i] then
                                        local u38 = v35[i][1];
                                        local u39 = v35[i][2];
                                        Spawn(function() -- Line: 246
                                            -- upvalues: u36 (copy), u39 (ref), u10 (ref), u31 (copy), u38 (ref)
                                            local v40 = { u36(table.unpack(u39)) };

                                            if not u10[2][u31] then
                                                u10[2][u31] = {};
                                            end;

                                            table.insert(u10[2][u31], { u38, v40 });
                                            u38 = nil;
                                            u39 = nil;
                                        end);
                                        v37 = i;
                                    else
                                        v37 = i;
                                    end;
                                end;
                            end;
                        end;
                    end;

                    u9[1][u31] = nil;
                end;

                if u9[2][u31] then
                    if u6[u31] then
                        for _, v2 in u9[2][u31] do
                            for _, v3 in v2 do
                                if #v3 ~= 1 then
                                    local v41 = v3;

                                    for i = 1, #u6[u31] do
                                        local v42 = u6[u31][i];

                                        if v42 and v42[1] == v41[1] then
                                            Spawn(v42[2], table.unpack(v41[2]));
                                            table.remove(u6[u31], i);
                                            break;
                                        end;

                                        local _ = i;
                                    end;
                                end;
                            end;
                        end;
                    end;

                    u9[2][u31] = nil;
                end;
            end;
        end;
    end);

    local function onClientNetworkReceive(p43, p44) -- Line: 283
        -- upvalues: Buffer (ref), u8 (ref), u11 (ref), script_Logger (ref)
        if not (p43 and p44) then
            return;
        end;

        local v45 = Buffer.convert(p43);

        if not u8[v45] then
            u8[v45] = {};
        end;

        table.insert(u8[v45], p44);

        if u11[v45] then
            task.defer(script_Logger.write, v45, (`state: in -> net -> {#p44} data.`));
        end;
    end;

    Reliable.OnClientEvent:Connect(onClientNetworkReceive);
    Unreliable.OnClientEvent:Connect(onClientNetworkReceive);
    Request.OnClientEvent:Connect(function(p46: any, p47: string, p48: any) -- Line: 296
        -- upvalues: Buffer (ref), u9 (ref), u11 (ref), script_Logger (ref)
        if not (p46 and p48) then
            return;
        end;

        local v49 = Buffer.convert(p46);

        if p47 == "\1" then
            if not u9[1][v49] then
                u9[1][v49] = {};
            end;

            table.insert(u9[1][v49], p48);
        else
            if not u9[2][v49] then
                u9[2][v49] = {};
            end;

            table.insert(u9[2][v49], p48);
        end;

        if u11[v49] then
            task.defer(script_Logger.write, v49, (`state: in -> request -> {#p48} data.`));
        end;
    end);
end;

return u1;