-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.SharedChannelMethods
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local u10 = {
    HasSpeaker = function(p1: table, p2: userdata) -- Line: 22, Name: HasSpeaker
        return table.find(p1.Replica.Data.Members, p2) ~= nil;
    end,

    GetSpeakers = function(p3) -- Line: 26, Name: GetSpeakers
        return p3.Replica.Data.Members;
    end,

    GetIdentifier = function(p4) -- Line: 30, Name: GetIdentifier
        return p4.Replica.Data.Identifier;
    end,

    IsActive = function(p5) -- Line: 34, Name: IsActive
        return p5.Replica.Data.IsActive;
    end,

    GetModifiers = function(p6) -- Line: 38, Name: GetModifiers
        return p6.Replica.Data.Modifiers;
    end,

    HasModifier = function(p7: table, p8: string) -- Line: 42, Name: HasModifier
        for _, v in p7.Replica.Data.Modifiers do
            if v.Name == p8 then
                return true;
            end;
        end;

        return false;
    end,

    GetPriority = function(p9) -- Line: 52, Name: GetPriority
        return p9.Replica.Data.Priority;
    end
};

return function(p11) -- Line: 58
    -- upvalues: u10 (copy)
    for i, v in pairs(u10) do
        p11[i] = v;
    end;
end;