-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.RateLimiter
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local v1 = {
    Default = nil
};
local Players = game:GetService("Players");
local u2 = {};
local u3 = {};
local u4 = {};
u4.__index = u4;

function u4.CheckRate(p5, p6) -- Line: 59
    -- upvalues: u2 (copy)
    local _sources = p5._sources;
    local os_clock_ret = os.clock();
    local v7 = _sources[p6];

    if v7 == nil then
        if typeof(p6) == "Instance" and (p6:IsA("Player") and u2[p6] == nil) then
            return false;
        end;

        _sources[p6] = os_clock_ret + p5._rate_period;

        return true;
    end;

    local math_max_ret = math.max(os_clock_ret, v7 + p5._rate_period);

    if math_max_ret - os_clock_ret >= 1 then
        return false;
    end;

    _sources[p6] = math_max_ret;

    return true;
end;

function u4.CleanSource(p8, p9) -- Line: 83
    p8._sources[p9] = nil;
end;

function u4.Cleanup(p10) -- Line: 87
    p10._sources = {};
end;

function u4.Destroy(p11) -- Line: 91
    -- upvalues: u3 (copy)
    u3[p11] = nil;
end;

function v1.NewRateLimiter(p12) -- Line: 96
    -- upvalues: u4 (copy), u3 (copy)
    if p12 <= 0 then
        error("[RateLimiter]: Invalid rate");
    end;

    local v13 = {
        _sources = {},
        _rate_period = 1 / p12
    };
    setmetatable(v13, u4);
    u3[v13] = true;

    return v13;
end;

for _, v in ipairs(Players:GetPlayers()) do
    u2[v] = true;
end;

v1.Default = v1.NewRateLimiter(120);
Players.PlayerAdded:Connect(function(p14) -- Line: 122
    -- upvalues: u2 (copy)
    u2[p14] = true;
end);
Players.PlayerRemoving:Connect(function(p15) -- Line: 126
    -- upvalues: u2 (copy), u3 (copy)
    u2[p15] = nil;

    for i in pairs(u3) do
        i._sources[p15] = nil;
    end;
end);

return v1;