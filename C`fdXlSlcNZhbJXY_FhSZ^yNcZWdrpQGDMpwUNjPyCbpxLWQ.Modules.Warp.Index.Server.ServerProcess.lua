-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index.Server.ServerProcess
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index.Server
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local u1 = {};
local RunService = game:GetService("RunService");
local Players = game:GetService("Players");
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

local function initializeEachPlayer(p12: userdata) -- Line: 64
    -- upvalues: u7 (copy), u6 (copy), u5 (copy), u8 (copy), u10 (copy), u9 (copy)
    if not p12 then
        return;
    end;

    if not u7[p12] then
        u7[p12] = {};
    end;

    for _, v in u6 do
        if not p12 then
            break;
        end;

        if not u7[p12][v] then
            u7[p12][v] = {};
        end;

        if not u5[v] then
            u5[v] = {};
        end;

        if not u5[v][p12] then
            u5[v][p12] = {};
        end;

        if not u8[v][p12] then
            u8[v][p12] = {};
        end;

        if not u10[1][v] then
            u10[1][v] = {};
        end;

        if not u10[2][v] then
            u10[2][v] = {};
        end;

        if not u9[1][v][p12] then
            u9[1][v][p12] = {};
            u9[2][v][p12] = {};
        end;

        if not u10[1][v][p12] then
            u10[1][v][p12] = {};
            u10[2][v][p12] = {};
        end;
    end;
end;

Players.PlayerAdded:Connect(initializeEachPlayer);

function u1.insertQueue(p13: string, p14: boolean, p15: userdata, ...) -- Line: 103
    -- upvalues: u3 (copy), u2 (copy)
    if p14 then
        if not u2[p13] then
            u2[p13] = {};
        end;

        if not u2[p13][p15] then
            u2[p13][p15] = {};
        end;

        table.insert(u2[p13][p15], { ... });

        return;
    end;

    if not u3[p13] then
        u3[p13] = {};
    end;

    if not u3[p13][p15] then
        u3[p13][p15] = {};
    end;

    table.insert(u3[p13][p15], { ... });
end;

function u1.insertRequest(p16: string, u17: number, p18: userdata, ...) -- Line: 123
    -- upvalues: u5 (copy), Key (copy)
    if not u5[p16] then
        u5[p16] = {};
    end;

    if not u5[p16][p18] then
        u5[p16][p18] = {};
    end;

    local coroutine_running_ret = coroutine.running();
    local os_clock_ret = os.clock();
    local task_delay_ret = task.delay(u17, function() -- Line: 131
        -- upvalues: coroutine_running_ret (copy)
        task.spawn(coroutine_running_ret, nil);
    end);
    local v19 = u5[p16][p18];
    local v20 = {
        tostring(Key()),

        function(...) -- Line: 134
            -- upvalues: os_clock_ret (copy), u17 (copy), task_delay_ret (copy), coroutine_running_ret (copy)
            if u17 < os.clock() - os_clock_ret then
                return;
            end;

            task.cancel(task_delay_ret);
            task.spawn(coroutine_running_ret, ...);
        end,

        { ... }
    };
    table.insert(v19, v20);

    return coroutine.yield();
end;

function u1.add(p21: string, p22: string, p23: any) -- Line: 142
    -- upvalues: u6 (copy), RateLimit (copy), u1 (copy), u2 (copy), u5 (copy), u4 (copy), u3 (copy), u8 (copy), u9 (copy), u10 (copy), Players (copy), initializeEachPlayer (copy)
    if not table.find(u6, p21) then
        table.insert(u6, p21);
        RateLimit.create(p22, p23.rateLimit and (p23.rateLimit.maxEntrance or 200) or 200, p23.rateLimit and (p23.rateLimit.interval or 2) or 2);

        if p23.logging then
            u1.logger(p21, p23.logging.store, p23.logging.opt);
        end;

        if not u2[p21] then
            u2[p21] = {};
        end;

        if not u5[p21] then
            u5[p21] = {};
        end;

        if not u4[p21] then
            u4[p21] = {};
        end;

        if not u3[p21] then
            u3[p21] = {};
        end;

        if not u8[p21] then
            u8[p21] = {};
        end;

        if not u9[1][p21] then
            u9[1][p21] = {};
        end;

        if not u9[2][p21] then
            u9[2][p21] = {};
        end;

        if not u10[1][p21] then
            u10[1][p21] = {};
        end;

        if not u10[2][p21] then
            u10[2][p21] = {};
        end;

        for _, v in ipairs(Players:GetPlayers()) do
            task.spawn(initializeEachPlayer, v);
        end;
    end;
end;

function u1.remove(p24: string) -- Line: 186
    -- upvalues: u6 (copy), u2 (copy), u5 (copy), u4 (copy), u3 (copy), u8 (copy), u9 (copy), u10 (copy), script_Logger (copy)
    if not table.find(u6, p24) then
        return;
    end;

    table.remove(u6, table.find(u6, p24));
    u2[p24] = nil;
    u5[p24] = nil;
    u4[p24] = nil;
    u3[p24] = nil;
    u8[p24] = nil;
    u9[1][p24] = nil;
    u9[2][p24] = nil;
    u10[1][p24] = nil;
    u10[2][p24] = nil;
    script_Logger.clear(p24);
end;

function u1.logger(p25: string, p26: boolean, p27: boolean) -- Line: 201
    -- upvalues: u11 (copy), script_Logger (copy)
    u11[p25] = p26;
    script_Logger.write(p25, `state: change -> {p27 == true and "enabled" or "disabled"} logger.`, p27);
end;

function u1.getlogs(p28: string) -- Line: 206
    -- upvalues: script_Logger (copy)
    return script_Logger.read(p28);
end;

function u1.addCallback(p29: string, p30: string, p31: any) -- Line: 210
    -- upvalues: u4 (copy), u11 (copy), script_Logger (copy)
    u4[p29][p30] = p31;

    if u11[p29] then
        task.defer(script_Logger.write, p29, "state: change -> new callback added.");
    end;
end;

function u1.removeCallback(p32: string, p33: string) -- Line: 217
    -- upvalues: u4 (copy), u11 (copy), script_Logger (copy)
    u4[p32][p33] = nil;

    if u11[p32] then
        task.defer(script_Logger.write, p32, "state: change -> removed a callback.");
    end;
end;

function u1.start() -- Line: 224
    -- upvalues: RunService (copy), u3 (copy), Unreliable (copy), Buffer (copy), u11 (copy), script_Logger (copy), u2 (copy), u7 (copy), Reliable (copy), u10 (copy), Request (copy), u6 (copy), u5 (copy), u4 (copy), u8 (copy), Spawn (copy), u9 (copy)
    debug.setmemorycategory("Warp");
    RunService.PostSimulation:Connect(function() -- Line: 226
        -- upvalues: u3 (ref), Unreliable (ref), Buffer (ref), u11 (ref), script_Logger (ref), u2 (ref), u7 (ref), Reliable (ref), u10 (ref), Request (ref), u6 (ref), u5 (ref), u4 (ref), u8 (ref), Spawn (ref), u9 (ref)
        for i, v in u3 do
            local v34 = i;

            for i2, v2 in v do
                if #v2 ~= 0 then
                    Unreliable:FireClient(i2, Buffer.revert(v34), v2);

                    if u11[v34] then
                        task.defer(script_Logger.write, v34, (`state: out -> unreliable -> {#v2} data.`));
                    end;

                    u3[v34][i2] = nil;
                end;
            end;

            u3[v34] = nil;
        end;

        for i, v in u2 do
            local v35 = i;

            for i2, v2 in v do
                if #v2 > 0 and u7[i2] then
                    Reliable:FireClient(i2, Buffer.revert(v35), v2);
                end;

                u2[v35][i2] = nil;
            end;

            u2[v35] = nil;
        end;

        for i, v in u10[1] do
            local v36 = i;

            for i2, v2 in v do
                if #v2 > 0 then
                    Request:FireClient(i2, Buffer.revert(v36), "\1", v2);

                    if u11[v36] then
                        task.defer(script_Logger.write, v36, (`state: out -> request -> {#v2} data.`));
                    end;
                end;

                u10[1][v36][i2] = nil;
            end;

            u10[1][v36] = nil;
        end;

        for i, v in u10[2] do
            local v37 = i;

            for i2, v2 in v do
                if #v2 > 0 then
                    Request:FireClient(i2, Buffer.revert(v37), "\0", v2);

                    if u11[v37] then
                        task.defer(script_Logger.write, v37, (`state: out -> return request -> {#v2} data.`));
                    end;
                end;

                u10[2][v37][i2] = nil;
            end;

            u10[2][v37] = nil;
        end;

        for _, v in u6 do
            local u38;

            if u5[v] then
                u38 = v;

                for i, v2 in u5[v] do
                    if #v2 == 0 then
                        u5[u38][i] = nil;
                    else
                        local v39 = i;

                        for _, v3 in v2 do
                            if v3[3] then
                                if not u10[1][u38] then
                                    u10[1][u38] = {};
                                end;

                                if not u10[1][u38][v39] then
                                    u10[1][u38][v39] = {};
                                end;

                                table.insert(u10[1][u38][v39], { v3[1], v3[3] });
                                v3[3] = nil;
                            end;
                        end;
                    end;
                end;
            else
                u38 = v;
            end;

            local v40 = u4[u38] or nil;

            if v40 then
                for i, v2 in u8[u38] do
                    if not v40 then
                        break;
                    end;

                    local v41 = i;

                    for _, v3 in v2 do
                        if not v40 then
                            break;
                        end;

                        if #v3 ~= 0 then
                            local v42 = v3;

                            for _, v4 in v40 do
                                local v43 = v4;

                                for i2 = 1, #v42 do
                                    Spawn(v43, v41, table.unpack(v42[i2] or {}));
                                    local _ = i2;
                                end;
                            end;
                        end;
                    end;

                    u8[u38][v41] = nil;
                end;

                for i, v2 in u9[1][u38] do
                    if not v40 then
                        break;
                    end;

                    local u44 = i;

                    for _, v3 in v2 do
                        if not v40 then
                            break;
                        end;

                        if #v3 ~= 0 then
                            local v45 = v3;

                            for _, v4 in v40 do
                                local u46 = v4;

                                for i2 = 1, #v45 do
                                    local v47;

                                    if v45[i2] then
                                        local u48 = v45[i2][1];
                                        local u49 = v45[i2][2];
                                        Spawn(function() -- Line: 323
                                            -- upvalues: u46 (copy), u44 (copy), u49 (ref), u10 (ref), u38 (copy), u48 (ref)
                                            local v50 = { u46(u44, table.unpack(u49)) };

                                            if not u10[2][u38] then
                                                u10[2][u38] = {};
                                            end;

                                            if not u10[2][u38][u44] then
                                                u10[2][u38][u44] = {};
                                            end;

                                            table.insert(u10[2][u38][u44], { u48, v50 });
                                            u48 = nil;
                                            u49 = nil;
                                        end);
                                        v47 = i2;
                                    else
                                        v47 = i2;
                                    end;
                                end;
                            end;
                        end;
                    end;

                    u9[1][u38][u44] = nil;
                end;

                for i, v2 in u9[2][u38] do
                    if not v40 then
                        break;
                    end;

                    local v51 = i;

                    for _, v3 in v2 do
                        for _, v4 in v3 do
                            if not v40 then
                                break;
                            end;

                            if #v4 ~= 1 then
                                local v52 = u5[u38][v51];
                                local v53 = v4;

                                for i2 = 1, #v52 do
                                    local v54 = v52[i2];

                                    if v54 and v54[1] == v53[1] then
                                        Spawn(v54[2], table.unpack(v53[2]));
                                        table.remove(v52, i2);
                                        break;
                                    end;

                                    local _ = i2;
                                end;
                            end;
                        end;
                    end;

                    u9[2][u38][v51] = nil;
                end;
            end;
        end;
    end);

    local function onServerNetworkReceive(p55: userdata, p56: any, p57: any) -- Line: 364
        -- upvalues: Buffer (ref), u2 (ref), u8 (ref), u11 (ref), script_Logger (ref)
        if not (p56 and p57) then
            return;
        end;

        local v58 = Buffer.convert(p56);

        if not u2[v58] then
            u2[v58] = {};
        end;

        if not u2[v58][p55] then
            u2[v58][p55] = {};
        end;

        if not u8[v58][p55] then
            u8[v58][p55] = {};
        end;

        if u11[v58] then
            task.defer(script_Logger.write, v58, (`state: in -> net -> {#p57} data.`));
        end;

        table.insert(u8[v58][p55], p57);
    end;

    Reliable.OnServerEvent:Connect(onServerNetworkReceive);
    Unreliable.OnServerEvent:Connect(onServerNetworkReceive);
    Request.OnServerEvent:Connect(function(p59: userdata, p60: any, p61: string, p62: any) -- Line: 383
        -- upvalues: Buffer (ref), u9 (ref), u2 (ref), u11 (ref), script_Logger (ref)
        if not (p60 and p62) then
            return;
        end;

        local v63 = Buffer.convert(p60);

        if not u9[1][v63][p59] then
            u9[1][v63][p59] = {};
        end;

        if not u9[2][v63][p59] then
            u9[2][v63][p59] = {};
        end;

        if not u2[v63] then
            u2[v63] = {};
        end;

        if not u2[v63][p59] then
            u2[v63][p59] = {};
        end;

        if p61 == "\1" then
            table.insert(u9[1][v63][p59], p62);
        else
            table.insert(u9[2][v63][p59], p62);
        end;

        if u11[v63] then
            task.defer(script_Logger.write, v63, (`state: in -> request -> {#p62} data.`));
        end;
    end);
end;

for _, v in ipairs(Players:GetPlayers()) do
    task.spawn(initializeEachPlayer, v);
end;

return u1;