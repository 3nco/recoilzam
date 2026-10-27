-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.__MODULES.AdminAPI
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.__MODULES
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");

return {
    GetPermissionLevel = function(u1: userdata) -- Line: 5
        local success, result = pcall(function() -- Line: 8
            -- upvalues: u1 (copy)
            return u1:GetRankInGroup(12471718);
        end);

        if success and result then
            if result >= 251 then
                return 4;
            end;

            if result >= 249 then
                return 3;
            end;

            if result == 248 then
                return 2;
            end;
        end;

        return 1;
    end,

    GetUserIdAndNameFromInput = function(u2) -- Line: 28
        -- upvalues: Players (copy)
        if u2 then
            local v3 = nil;
            local v4 = nil;
            local v5;

            if tonumber(u2) then
                local v6;
                v6, v5 = pcall(function() -- Line: 36
                    -- upvalues: Players (ref), u2 (copy)
                    return Players:GetNameFromUserIdAsync(u2);
                end);

                if v6 then
                    if v5 then
                        v3 = u2;
                    else
                        v5 = v4;
                    end;
                else
                    v5 = v4;
                end;
            else
                v5 = v4;
            end;

            local v7;

            if v3 and v5 then
                u2 = v5;
                v7 = v3;
            else
                local v8;
                v8, v7 = pcall(function() -- Line: 48
                    -- upvalues: Players (ref), u2 (copy)
                    return Players:GetUserIdFromNameAsync(u2);
                end);

                if v8 then
                    if not v7 then
                        u2 = v5;
                        v7 = v3;
                    end;
                else
                    u2 = v5;
                    v7 = v3;
                end;
            end;

            return u2, v7;
        end;
    end
};