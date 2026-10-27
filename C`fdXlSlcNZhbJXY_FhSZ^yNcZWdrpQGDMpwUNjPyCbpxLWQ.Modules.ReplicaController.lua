-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.ReplicaController
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local RunService = game:GetService("RunService");

local function WaitForDescendant(p1, u2, p3) -- Line: 127
    -- upvalues: RunService (copy)
    local u4 = p1:FindFirstChild(u2, true);

    if u4 ~= nil then
        return u4;
    end;

    local os_clock_ret = os.clock();
    local v6 = p1.DescendantAdded:Connect(function(p5) -- Line: 132
        -- upvalues: u2 (copy), u4 (ref)
        if p5.Name == u2 then
            u4 = p5;
        end;
    end);

    while u4 == nil do
        if os_clock_ret ~= nil and (os.clock() - os_clock_ret > 1 and (RunService:IsServer() == true or game:IsLoaded() == true)) then
            warn("[" .. script.Name .. "]: Missing " .. p3 .. " \"" .. u2 .. "\" in " .. p1:GetFullName() .. "; Please check setup documentation");
            os_clock_ret = nil;
        end;

        task.wait();
    end;

    v6:Disconnect();

    return u4;
end;

local u7;

if RunService:IsServer() == true then
    u7 = Instance.new("Folder");
    u7.Name = "ReplicaRemoteEvents";
    u7.Parent = game:GetService("ReplicatedStorage");
else
    u7 = WaitForDescendant(game:GetService("ReplicatedStorage"), "ReplicaRemoteEvents", "folder");
end;

local u13 = {
    GetShared = function(p8, p9) -- Line: 163, Name: GetShared
        -- upvalues: WaitForDescendant (copy)
        return WaitForDescendant(game:GetService("ReplicatedStorage"), p9, "module");
    end,

    GetModule = function(p10, p11) -- Line: 167, Name: GetModule
        -- upvalues: WaitForDescendant (copy)
        return WaitForDescendant(game:GetService("ServerScriptService"), p11, "module");
    end,

    SetupRemoteEvent = function(p12) -- Line: 170, Name: SetupRemoteEvent
        -- upvalues: RunService (copy), u7 (ref), WaitForDescendant (copy)
        if RunService:IsServer() ~= true then
            return WaitForDescendant(u7, p12, "remote event");
        end;

        local RemoteEvent = Instance.new("RemoteEvent");
        RemoteEvent.Name = p12;
        RemoteEvent.Parent = u7;

        return RemoteEvent;
    end,

    Shared = {}
};
local Shared = require(u13.GetShared("Madwork", "MadworkScriptSignal"));
u13.NewScriptSignal = Shared.NewScriptSignal;
u13.NewArrayScriptConnection = Shared.NewArrayScriptConnection;
local u14 = {
    InitialDataReceived = false,
    NewReplicaSignal = u13.NewScriptSignal(),
    InitialDataReceivedSignal = u13.NewScriptSignal(),
    _replicas = {},
    _class_listeners = {},
    _child_listeners = {}
};
local Shared2 = require(u13.GetShared("Madwork", "MadworkMaid"));
local u15 = nil;
local _replicas = u14._replicas;
local NewReplicaSignal = u14.NewReplicaSignal;
local _class_listeners = u14._class_listeners;
local _child_listeners = u14._child_listeners;
local u16 = u13.SetupRemoteEvent("Replica_ReplicaRequestData");
local v17 = u13.SetupRemoteEvent("Replica_ReplicaSetValue");
local v18 = u13.SetupRemoteEvent("Replica_ReplicaSetValues");
local v19 = u13.SetupRemoteEvent("Replica_ReplicaArrayInsert");
local v20 = u13.SetupRemoteEvent("Replica_ReplicaArraySet");
local v21 = u13.SetupRemoteEvent("Replica_ReplicaArrayRemove");
local v22 = u13.SetupRemoteEvent("Replica_ReplicaWrite");
local u23 = u13.SetupRemoteEvent("Replica_ReplicaSignal");
local v24 = u13.SetupRemoteEvent("Replica_ReplicaSetParent");
local v25 = u13.SetupRemoteEvent("Replica_ReplicaCreate");
local v26 = u13.SetupRemoteEvent("Replica_ReplicaDestroy");
local u27 = false;
local u28 = {};
local u29 = false;

local function GetWriteLibFunctionsRecursive(p30, p31, p32) -- Line: 300
    -- upvalues: GetWriteLibFunctionsRecursive (copy)
    for i, v in pairs(p31) do
        if type(v) == "table" then
            GetWriteLibFunctionsRecursive(p30, v, p32 .. i .. ".");
        elseif type(v) == "function" then
            table.insert(p30, { p32 .. i, v });
        else
            error("[ReplicaController]: Invalid write function value \"" .. tostring(v) .. "\" (" .. typeof(v) .. "); name_stack = \"" .. p32 .. "\"");
        end;
    end;
end;

local function LoadWriteLib(p33) -- Line: 312
    -- upvalues: u28 (copy), GetWriteLibFunctionsRecursive (copy)
    local v34 = u28[p33];

    if v34 ~= nil then
        return v34;
    end;

    local v35 = {};
    GetWriteLibFunctionsRecursive(v35, require(p33), "");
    table.sort(v35, function(p36, p37) -- Line: 323
        return p36[1] < p37[1];
    end);
    local v38 = {};
    local v39 = {};

    for i, v in ipairs(v35) do
        v38[i] = v[2];
        v39[v[1]] = i;
    end;

    local v40 = { v38, v39 };
    u28[p33] = v40;

    return v40;
end;

local function StringPathToArray(p41) -- Line: 342
    local v42 = {};

    if p41 ~= "" then
        for i in string.gmatch(p41, "[^%.]+") do
            table.insert(v42, i);
        end;
    end;

    return v42;
end;

local function DestroyReplicaAndDescendantsRecursive(p43, p44) -- Line: 352
    -- upvalues: DestroyReplicaAndDescendantsRecursive (copy), _replicas (copy), _child_listeners (copy)
    for _, v in ipairs(p43.Children) do
        DestroyReplicaAndDescendantsRecursive(v, true);
    end;

    local Id = p43.Id;
    _replicas[Id] = nil;
    p43._maid:Cleanup();

    if p44 ~= true and p43.Parent ~= nil then
        local Children = p43.Parent.Children;
        table.remove(Children, table.find(Children, p43));
    end;

    _child_listeners[Id] = nil;
end;

local function CreateTableListenerPathIndex(p45, p46, p47) -- Line: 374
    local _table_listeners = p45._table_listeners;

    for i = 1, #p46 do
        local v48 = _table_listeners[1][p46[i]];

        if v48 == nil then
            v48 = { {} };
            _table_listeners[1][p46[i]] = v48;
        end;

        _table_listeners = v48;
        local _ = i;
    end;

    local v49 = _table_listeners[p47];

    if v49 == nil then
        v49 = {};
        _table_listeners[p47] = v49;
    end;

    return v49;
end;

local function CleanTableListenerTable(p50) -- Line: 395
    local v51 = p50[1];
    local v52 = p50[2];
    local v53 = { v51 };

    for i = 1, #v52 do
        v51 = v51[1][v52[i]];
        table.insert(v53, v51);
        local _ = i;
    end;

    for i = #v53, 2, -1 do
        local v54 = v53[i];

        if next(v54[1]) ~= nil then
            return;
        end;

        local v55 = i;

        for i2 = 2, 6 do
            if v54[i2] ~= nil and #v54[i2] > 0 then
                return;
            end;

            local _ = i2;
        end;

        v53[v55 - 1][1][v52[v55 - 1]] = nil;
    end;
end;

local function CreateReplicaBranch(p56, p57) -- Line: 420
    -- upvalues: _replicas (copy), LoadWriteLib (copy), Shared2 (copy), u15 (ref)
    local v58 = {};

    for i, v in pairs(p56) do
        v[6] = tonumber(i);
        table.insert(v58, v);
    end;

    table.sort(v58, function(p59, p60) -- Line: 428
        return p59[6] < p60[6];
    end);
    local v61 = {};
    local v62 = p57 or {};

    for _, v in ipairs(v58) do
        local v63 = v[6];
        local v64 = v[4];
        local v65 = false;
        local v66;

        if v64 == 0 then
            v66 = nil;
        else
            v66 = _replicas[v64];

            if v66 == nil then
                v65 = true;
            end;
        end;

        local v67, v68;

        if v[5] == nil then
            v67 = nil;
            v68 = nil;
        else
            local v69 = LoadWriteLib(v[5]);
            v67 = v69[1];
            v68 = v69[2];
        end;

        local v70 = {
            Data = v[3],
            Id = v63,
            Class = v[1],
            Tags = v[2],
            Parent = v66,
            Children = {},
            _write_lib = v67,
            _write_lib_dictionary = v68,
            _table_listeners = { {} },
            _function_listeners = {},
            _raw_listeners = {},
            _signal_listeners = {},
            _maid = Shared2.NewMaid()
        };
        setmetatable(v70, u15);

        if v66 == nil then
            if v65 == true then
                local v71 = v61[v64];

                if v71 == nil then
                    v71 = {};
                    v61[v64] = v71;
                end;

                table.insert(v71, v70);
            end;
        else
            table.insert(v66.Children, v70);
        end;

        _replicas[v63] = v70;
        table.insert(v62, v70);
        local v72 = v61[v63];

        if v72 ~= nil then
            v61[v63] = nil;

            for _, v2 in ipairs(v72) do
                v2.Parent = v70;
                table.insert(v70.Children, v2);
            end;
        end;
    end;

    if next(v61) ~= nil then
        local v73 = "[ReplicaService]: BRANCH REPLICATION ERROR - Missing parents: ";

        for i, v in pairs(v61) do
            local v74 = v73 .. "[" .. tostring(i) .. "]: {";

            for i2, v2 in ipairs(v) do
                v74 = v74 .. (i2 == 1 and "" or ", ") .. v2:Identify();
            end;

            v73 = v74 .. "}; ";
        end;

        error(v73);
    end;

    return v62;
end;

local function ReplicaSetValue(p75, p76, p77) -- Line: 514
    -- upvalues: _replicas (copy)
    local v78 = _replicas[p75];
    local Data = v78.Data;
    local _table_listeners = v78._table_listeners;

    for i = 1, #p76 - 1 do
        Data = Data[p76[i]];
        local v79;

        if _table_listeners == nil then
            v79 = i;
        else
            _table_listeners = _table_listeners[1][p76[i]];
            v79 = i;
        end;
    end;

    local v80 = p76[#p76];
    local v81 = Data[v80];
    Data[v80] = p77;

    if v81 ~= p77 and _table_listeners ~= nil then
        if v81 == nil and _table_listeners[3] ~= nil then
            for _, v in ipairs(_table_listeners[3]) do
                v(p77, v80);
            end;
        end;

        local v82 = _table_listeners[1][p76[#p76]];

        if v82 ~= nil and v82[2] ~= nil then
            for _, v in ipairs(v82[2]) do
                v(p77, v81);
            end;
        end;
    end;

    for _, v in ipairs(v78._raw_listeners) do
        v("SetValue", p76, p77);
    end;
end;

local function ReplicaSetValues(p83, p84, p85) -- Line: 553
    -- upvalues: _replicas (copy)
    local v86 = _replicas[p83];
    local Data = v86.Data;
    local _table_listeners = v86._table_listeners;

    for i = 1, #p84 do
        Data = Data[p84[i]];
        local v87;

        if _table_listeners == nil then
            v87 = i;
        else
            _table_listeners = _table_listeners[1][p84[i]];
            v87 = i;
        end;
    end;

    for i, v in pairs(p85) do
        local v88 = Data[i];
        Data[i] = v;

        if v88 ~= v and _table_listeners ~= nil then
            local v89, v90;

            if v88 == nil and _table_listeners[3] ~= nil then
                v89 = i;
                v90 = v;

                for _, v2 in ipairs(_table_listeners[3]) do
                    v2(v90, v89);
                end;
            else
                v90 = v;
                v89 = i;
            end;

            local v91 = _table_listeners[1][v89];

            if v91 ~= nil and v91[2] ~= nil then
                for _, v2 in ipairs(v91[2]) do
                    v2(v90, v88);
                end;
            end;
        end;
    end;

    for _, v in ipairs(v86._raw_listeners) do
        v("SetValues", p84, p85);
    end;
end;

local function ReplicaArrayInsert(p92, p93, p94) -- Line: 594
    -- upvalues: _replicas (copy)
    local v95 = _replicas[p92];
    local Data = v95.Data;
    local _table_listeners = v95._table_listeners;

    for i = 1, #p93 do
        Data = Data[p93[i]];
        local v96;

        if _table_listeners == nil then
            v96 = i;
        else
            _table_listeners = _table_listeners[1][p93[i]];
            v96 = i;
        end;
    end;

    table.insert(Data, p94);
    local v97 = #Data;

    if _table_listeners ~= nil and _table_listeners[4] ~= nil then
        for _, v in ipairs(_table_listeners[4]) do
            v(v97, p94);
        end;
    end;

    for _, v in ipairs(v95._raw_listeners) do
        v("ArrayInsert", p93, p94, v97);
    end;

    return v97;
end;

local function ReplicaArraySet(p98, p99, p100, p101) -- Line: 623
    -- upvalues: _replicas (copy)
    local v102 = _replicas[p98];
    local Data = v102.Data;
    local _table_listeners = v102._table_listeners;

    for i = 1, #p99 do
        Data = Data[p99[i]];
        local v103;

        if _table_listeners == nil then
            v103 = i;
        else
            _table_listeners = _table_listeners[1][p99[i]];
            v103 = i;
        end;
    end;

    Data[p100] = p101;

    if _table_listeners ~= nil and _table_listeners[5] ~= nil then
        for _, v in ipairs(_table_listeners[5]) do
            v(p100, p101);
        end;
    end;

    for _, v in ipairs(v102._raw_listeners) do
        v("ArraySet", p99, p100, p101);
    end;
end;

local function ReplicaArrayRemove(p104, p105, p106) -- Line: 650
    -- upvalues: _replicas (copy)
    local v107 = _replicas[p104];
    local Data = v107.Data;
    local _table_listeners = v107._table_listeners;

    for i = 1, #p105 do
        Data = Data[p105[i]];
        local v108;

        if _table_listeners == nil then
            v108 = i;
        else
            _table_listeners = _table_listeners[1][p105[i]];
            v108 = i;
        end;
    end;

    local table_remove_ret = table.remove(Data, p106);

    if _table_listeners ~= nil and _table_listeners[6] ~= nil then
        for _, v in ipairs(_table_listeners[6]) do
            v(p106, table_remove_ret);
        end;
    end;

    for _, v in ipairs(v107._raw_listeners) do
        v("ArrayRemove", p105, p106, table_remove_ret);
    end;

    return table_remove_ret;
end;

u15 = {};
u15.__index = u15;

function u15.ListenToChange(p109, p110, p111) -- Line: 686
    -- upvalues: StringPathToArray (copy), CreateTableListenerPathIndex (copy), u13 (ref), CleanTableListenerTable (copy)
    if type(p111) ~= "function" then
        error("[ReplicaController]: Only a function can be set as listener in Replica:ListenToChange()");
    end;

    if type(p110) == "string" then
        p110 = StringPathToArray(p110) or p110;
    end;

    if #p110 < 1 then
        error("[ReplicaController]: Passed empty path - a value key must be specified");
    end;

    local v112 = CreateTableListenerPathIndex(p109, p110, 2);
    table.insert(v112, p111);

    return u13.NewArrayScriptConnection(v112, p111, CleanTableListenerTable, { p109._table_listeners, p110 });
end;

function u15.ListenToNewKey(p113, p114, p115) -- Line: 702
    -- upvalues: StringPathToArray (copy), CreateTableListenerPathIndex (copy), u13 (ref), CleanTableListenerTable (copy)
    if type(p115) ~= "function" then
        error("[ReplicaController]: Only a function can be set as listener in Replica:ListenToNewKey()");
    end;

    if type(p114) == "string" then
        p114 = StringPathToArray(p114) or p114;
    end;

    local v116 = CreateTableListenerPathIndex(p113, p114, 3);
    table.insert(v116, p115);

    if #p114 == 0 then
        return u13.NewArrayScriptConnection(v116, p115);
    end;

    return u13.NewArrayScriptConnection(v116, p115, CleanTableListenerTable, { p113._table_listeners, p114 });
end;

function u15.ListenToArrayInsert(p117, p118, p119) -- Line: 719
    -- upvalues: StringPathToArray (copy), CreateTableListenerPathIndex (copy), u13 (ref), CleanTableListenerTable (copy)
    if type(p119) ~= "function" then
        error("[ReplicaController]: Only a function can be set as listener in Replica:ListenToArrayInsert()");
    end;

    if type(p118) == "string" then
        p118 = StringPathToArray(p118) or p118;
    end;

    local v120 = CreateTableListenerPathIndex(p117, p118, 4);
    table.insert(v120, p119);

    if #p118 == 0 then
        return u13.NewArrayScriptConnection(v120, p119);
    end;

    return u13.NewArrayScriptConnection(v120, p119, CleanTableListenerTable, { p117._table_listeners, p118 });
end;

function u15.ListenToArraySet(p121, p122, p123) -- Line: 736
    -- upvalues: StringPathToArray (copy), CreateTableListenerPathIndex (copy), u13 (ref), CleanTableListenerTable (copy)
    if type(p123) ~= "function" then
        error("[ReplicaController]: Only a function can be set as listener in Replica:ListenToArraySet()");
    end;

    if type(p122) == "string" then
        p122 = StringPathToArray(p122) or p122;
    end;

    local v124 = CreateTableListenerPathIndex(p121, p122, 5);
    table.insert(v124, p123);

    if #p122 == 0 then
        return u13.NewArrayScriptConnection(v124, p123);
    end;

    return u13.NewArrayScriptConnection(v124, p123, CleanTableListenerTable, { p121._table_listeners, p122 });
end;

function u15.ListenToArrayRemove(p125, p126, p127) -- Line: 753
    -- upvalues: StringPathToArray (copy), CreateTableListenerPathIndex (copy), u13 (ref), CleanTableListenerTable (copy)
    if type(p127) ~= "function" then
        error("[ReplicaController]: Only a function can be set as listener in Replica:ListenToArrayRemove()");
    end;

    if type(p126) == "string" then
        p126 = StringPathToArray(p126) or p126;
    end;

    local v128 = CreateTableListenerPathIndex(p125, p126, 6);
    table.insert(v128, p127);

    if #p126 == 0 then
        return u13.NewArrayScriptConnection(v128, p127);
    end;

    return u13.NewArrayScriptConnection(v128, p127, CleanTableListenerTable, { p125._table_listeners, p126 });
end;

function u15.ListenToWrite(p129, p130, p131) -- Line: 770
    -- upvalues: u13 (ref)
    if type(p131) ~= "function" then
        error("[ReplicaController]: Only a function can be set as listener in Replica:ListenToWrite()");
    end;

    if p129._write_lib == nil then
        error("[ReplicaController]: _write_lib was not declared for this replica");
    end;

    local v132 = p129._write_lib_dictionary[p130];

    if v132 == nil then
        error("[ReplicaController]: Write function \"" .. p130 .. "\" not declared inside _write_lib of this replica");
    end;

    local v133 = p129._function_listeners[v132];

    if v133 == nil then
        v133 = {};
        p129._function_listeners[v132] = v133;
    end;

    table.insert(v133, p131);

    return u13.NewArrayScriptConnection(v133, p131);
end;

function u15.ListenToRaw(p134, p135) -- Line: 794
    -- upvalues: u13 (ref)
    local _raw_listeners = p134._raw_listeners;
    table.insert(_raw_listeners, p135);

    return u13.NewArrayScriptConnection(_raw_listeners, p135);
end;

function u15.ConnectOnClientEvent(p136, p137) -- Line: 801
    -- upvalues: u13 (ref)
    if type(p137) ~= "function" then
        error("[ReplicaController]: Only functions can be passed to Replica:ConnectOnClientEvent()");
    end;

    table.insert(p136._signal_listeners, p137);

    return u13.NewArrayScriptConnection(p136._signal_listeners, p137);
end;

function u15.FireServer(p138, ...) -- Line: 809
    -- upvalues: u23 (copy)
    u23:FireServer(p138.Id, ...);
end;

function u15.ListenToChildAdded(p139, p140) -- Line: 814
    -- upvalues: _replicas (copy), _child_listeners (copy), u13 (ref)
    if type(p140) ~= "function" then
        error("[ReplicaController]: Only a function can be set as listener");
    end;

    if _replicas[p139.Id] ~= nil then
        local v141 = _child_listeners[p139.Id];

        if v141 == nil then
            v141 = {};
            _child_listeners[p139.Id] = v141;
        end;

        table.insert(v141, p140);

        return u13.NewArrayScriptConnection(v141, p140);
    end;
end;

function u15.FindFirstChildOfClass(p142, p143) -- Line: 832
    for _, v in ipairs(p142.Children) do
        if v.Class == p143 then
            return v;
        end;
    end;

    return nil;
end;

function u15.Identify(p144) -- Line: 842
    local v145 = "";

    for i, v in pairs(p144.Tags) do
        v145 = v145 .. "" .. tostring(i) .. "=" .. tostring(v);
    end;

    return "[Id:" .. tostring(p144.Id) .. ";Class:" .. p144.Class .. ";Tags:{" .. v145 .. "}]";
end;

function u15.IsActive(p146) -- Line: 853
    -- upvalues: _replicas (copy)
    return _replicas[p146.Id] ~= nil;
end;

function u15.AddCleanupTask(p147, p148) -- Line: 857
    return p147._maid:AddCleanupTask(p148);
end;

function u15.RemoveCleanupTask(p149, p150) -- Line: 861
    p149._maid:RemoveCleanupTask(p150);
end;

function u15.SetValue(p151, p152, p153) -- Line: 867
    -- upvalues: u29 (ref), StringPathToArray (copy), ReplicaSetValue (copy)
    if u29 == false then
        error("[ReplicaController]: Replica setters can only be called inside write functions");
    end;

    if type(p152) == "string" then
        p152 = StringPathToArray(p152) or p152;
    end;

    ReplicaSetValue(p151.Id, p152, p153);
end;

function u15.SetValues(p154, p155, p156) -- Line: 875
    -- upvalues: u29 (ref), StringPathToArray (copy), ReplicaSetValues (copy)
    if u29 == false then
        error("[ReplicaController]: Replica setters can only be called inside write functions");
    end;

    if type(p155) == "string" then
        p155 = StringPathToArray(p155) or p155;
    end;

    ReplicaSetValues(p154.Id, p155, p156);
end;

function u15.ArrayInsert(p157, p158, p159) -- Line: 883
    -- upvalues: u29 (ref), StringPathToArray (copy), ReplicaArrayInsert (copy)
    if u29 == false then
        error("[ReplicaController]: Replica setters can only be called inside write functions");
    end;

    if type(p158) == "string" then
        p158 = StringPathToArray(p158) or p158;
    end;

    return ReplicaArrayInsert(p157.Id, p158, p159);
end;

function u15.ArraySet(p160, p161, p162, p163) -- Line: 891
    -- upvalues: u29 (ref), StringPathToArray (copy), ReplicaArraySet (copy)
    if u29 == false then
        error("[ReplicaController]: Replica setters can only be called inside write functions");
    end;

    if type(p161) == "string" then
        p161 = StringPathToArray(p161) or p161;
    end;

    ReplicaArraySet(p160.Id, p161, p162, p163);
end;

function u15.ArrayRemove(p164, p165, p166) -- Line: 899
    -- upvalues: u29 (ref), StringPathToArray (copy), ReplicaArrayRemove (copy)
    if u29 == false then
        error("[ReplicaController]: Replica setters can only be called inside write functions");
    end;

    if type(p165) == "string" then
        p165 = StringPathToArray(p165) or p165;
    end;

    return ReplicaArrayRemove(p164.Id, p165, p166);
end;

function u15.Write(p167, p168, ...) -- Line: 907
    -- upvalues: u29 (ref)
    if u29 == false then
        error("[ReplicaController]: Replica setters can only be called inside write functions");
    end;

    local v169 = p167._write_lib_dictionary[p168];
    local table_pack_ret = table.pack(p167._write_lib[v169](p167, ...));
    local v170 = p167._function_listeners[v169];

    if v170 ~= nil then
        for _, v in ipairs(v170) do
            v(...);
        end;
    end;

    return table.unpack(table_pack_ret);
end;

function u14.RequestData() -- Line: 925
    -- upvalues: u27 (ref), u16 (copy), u14 (copy)
    if u27 == true then
        return;
    end;

    u27 = true;
    task.spawn(function() -- Line: 930
        -- upvalues: u16 (ref), u14 (ref)
        while game:IsLoaded() == false do
            task.wait();
        end;

        u16:FireServer();

        while task.wait(10) and u14.InitialDataReceived ~= true do
            u16:FireServer();
        end;
    end);
end;

function u14.ReplicaOfClassCreated(u171, p172) -- Line: 944
    -- upvalues: _class_listeners (copy), u13 (ref)
    if type(u171) ~= "string" then
        error("[ReplicaController]: replica_class must be a string");
    end;

    if type(p172) ~= "function" then
        error("[ReplicaController]: Only a function can be set as listener in ReplicaController.ReplicaOfClassCreated()");
    end;

    local u173 = _class_listeners[u171];

    if u173 == nil then
        u173 = u13.NewScriptSignal();
        _class_listeners[u171] = u173;
    end;

    return u173:Connect(p172, function() -- Line: 957
        -- upvalues: u173 (ref), _class_listeners (ref), u171 (copy)
        if u173:GetListenerCount() == 0 and _class_listeners[u171] == u173 then
            _class_listeners[u171] = nil;
        end;
    end);
end;

function u14.GetReplicaById(p174) -- Line: 965
    -- upvalues: _replicas (copy)
    return _replicas[p174];
end;

u16.OnClientEvent:Connect(function() -- Line: 972
    -- upvalues: u14 (copy)
    u14.InitialDataReceived = true;
    print("[ReplicaController]: Initial data received");
    u14.InitialDataReceivedSignal:Fire();
end);
v17.OnClientEvent:Connect(ReplicaSetValue);
v18.OnClientEvent:Connect(ReplicaSetValues);
v19.OnClientEvent:Connect(ReplicaArrayInsert);
v20.OnClientEvent:Connect(ReplicaArraySet);
v21.OnClientEvent:Connect(ReplicaArrayRemove);
v22.OnClientEvent:Connect(function(p175, p176, ...) -- Line: 989
    -- upvalues: _replicas (copy), u29 (ref)
    local v177 = _replicas[p175];
    u29 = true;
    v177._write_lib[p176](v177, ...);
    u29 = false;
    local v178 = v177._function_listeners[p176];

    if v178 ~= nil then
        for _, v in ipairs(v178) do
            v(...);
        end;
    end;
end);
u23.OnClientEvent:Connect(function(p179, ...) -- Line: 1005
    -- upvalues: _replicas (copy)
    for _, v in ipairs(_replicas[p179]._signal_listeners) do
        v(...);
    end;
end);
v24.OnClientEvent:Connect(function(p180, p181) -- Line: 1015
    -- upvalues: _replicas (copy), _child_listeners (copy)
    local v182 = _replicas[p180];
    local Children = v182.Parent.Children;
    local v183 = _replicas[p181];
    table.remove(Children, table.find(Children, v182));
    table.insert(v183.Children, v182);
    v182.Parent = v183;
    local v184 = _child_listeners[p181];

    if v184 ~= nil then
        for i = 1, #v184 do
            v184[i](v182);
            local _ = i;
        end;
    end;
end);
v25.OnClientEvent:Connect(function(p185, p186) -- Line: 1032
    -- upvalues: CreateReplicaBranch (copy), _child_listeners (copy), NewReplicaSignal (copy), _class_listeners (copy)
    local v187 = {};

    if type(p185) == "table" then
        table.sort(p185, function(p188, p189) -- Line: 1046
            return p188[1] < p189[1];
        end);

        for _, v in ipairs(p185) do
            CreateReplicaBranch(v[2], v187);
        end;
    elseif p186[1] == nil then
        CreateReplicaBranch(p186, v187);
    else
        CreateReplicaBranch({
            [tostring(p185)] = p186
        }, v187);
    end;

    table.sort(v187, function(p190, p191) -- Line: 1058
        return p190.Id < p191.Id;
    end);

    for _, v in ipairs(v187) do
        local Parent = v.Parent;

        if Parent ~= nil then
            local v192 = _child_listeners[Parent.Id];

            if v192 ~= nil then
                local v193 = v;

                for i = 1, #v192 do
                    v192[i](v193);
                    local _ = i;
                end;
            end;
        end;
    end;

    for _, v in ipairs(v187) do
        NewReplicaSignal:Fire(v);
        local v194 = _class_listeners[v.Class];

        if v194 ~= nil then
            v194:Fire(v);
        end;
    end;
end);
v26.OnClientEvent:Connect(function(p195) -- Line: 1084
    -- upvalues: _replicas (copy), DestroyReplicaAndDescendantsRecursive (copy)
    DestroyReplicaAndDescendantsRecursive(_replicas[p195]);
end);

return u14;