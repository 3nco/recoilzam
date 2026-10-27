-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index.Event
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Warp.Index
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local RunService = game:GetService("RunService");
require(script.Parent.Type);

if RunService:IsServer() then
    if not script:FindFirstChild("Reliable") then
        Instance.new("RemoteEvent", script).Name = "Reliable";
    end;

    if not script:FindFirstChild("Unreliable") then
        Instance.new("UnreliableRemoteEvent", script).Name = "Unreliable";
    end;

    if not script:FindFirstChild("Request") then
        Instance.new("RemoteEvent", script).Name = "Request";
    end;
elseif not (script:FindFirstChild("Reliable") and (script:FindFirstChild("Unreliable") and script:FindFirstChild("Request"))) then
    repeat
        task.wait();
    until script:FindFirstChild("Reliable") and (script:FindFirstChild("Unreliable") and script:FindFirstChild("Request"));
end;

return {
    Reliable = script.Reliable,
    Unreliable = script.Unreliable,
    Request = script.Request
};