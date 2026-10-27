-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.SharedSpeakerMethods
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local u2 = {
    IsSpeaking = function(p1) -- Line: 16, Name: IsSpeaking
        return p1.Replica.Data.IsSpeaking == true;
    end
};

return function(p3) -- Line: 22
    -- upvalues: u2 (copy)
    for i, v in pairs(u2) do
        p3[i] = v;
    end;
end;