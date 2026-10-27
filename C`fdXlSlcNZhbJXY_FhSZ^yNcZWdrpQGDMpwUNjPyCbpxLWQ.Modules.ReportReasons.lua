-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.ReportReasons
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

return {
    Reasons = { {
            Reason = "Exploiting",
            Description = "Flying, locking onto heads, looking through walls, etc"
        }, {
            Reason = "Glitch Abuse",
            Description = "Clipping through floors, going outside during prep phase, etc."
        }, {
            Reason = "Inappropriate Chat",
            Description = "Sending explicit, hateful, or unwanted content in chat"
        }, {
            Reason = "Inappropriate Username",
            Description = "Sending explicit, hateful, or unwanted content in username"
        } },

    GetReasons = function(p1) -- Line: 24, Name: GetReasons
        return p1.Reasons;
    end,

    GetReasonByIndex = function(p2: table, p3: number) -- Line: 28, Name: GetReasonByIndex
        return p2.Reasons[p3];
    end,

    GetReasonById = function(p4: table, p5: string) -- Line: 32, Name: GetReasonById
        for _, v in p4.Reasons do
            if v.Reason == p5 then
                return v;
            end;
        end;
    end,

    IsValidReasonById = function(p6: table, p7: string) -- Line: 40, Name: IsValidReasonById
        for _, v in p6.Reasons do
            if v.Reason == p7 then
                return true;
            end;
        end;

        return false;
    end
};