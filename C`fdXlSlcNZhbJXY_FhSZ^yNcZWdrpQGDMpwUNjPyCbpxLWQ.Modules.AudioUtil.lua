-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.AudioUtil
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local u6 = {
    CreateWire = function(p1: userdata, p2: userdata, p3: userdata?) -- Line: 20, Name: CreateWire
        local Wire = Instance.new("Wire");
        Wire.SourceInstance = p1;
        Wire.TargetInstance = p2;
        Wire.Parent = p3 or p2;

        return Wire;
    end,

    GetPlayersAudioDeviceInput = function(p4: userdata, p5: boolean?) -- Line: 41, Name: GetPlayersAudioDeviceInput
        if p5 then
            return p4:WaitForChild("AudioDeviceInput", 10);
        end;

        return p4:FindFirstChild("AudioDeviceInput");
    end
};

function u6.ConnectWires(p7: userdata, p8: userdata, p9: table, p10: any) -- Line: 61
    -- upvalues: u6 (copy)
    local v11 = p7;

    for _, v in p9 or {} do
        local v12 = p10:Add(v:Clone());
        v12.Parent = p7;
        p10:Add(u6.CreateWire(v11, v12, p7));
        v11 = v12;
    end;

    p10:Add(u6.CreateWire(v11, p8, p7));
end;

return u6;