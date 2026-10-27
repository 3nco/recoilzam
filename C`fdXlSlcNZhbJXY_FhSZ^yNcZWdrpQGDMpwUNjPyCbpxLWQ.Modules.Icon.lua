-- Path   : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules.Icon
-- Class  : ModuleScript
-- Parent : C`fdXlSlcNZhbJXY\FhSZ^yNcZWdrpQGDMpwUNjPyCbpxLWQ.Modules
-- PlaceId: 13997264379
-- Dumped : 2026-10-26 22:15:36
------------------------------------------------------------

-- Decompiled with Potassium's decompiler.

local UserInputService = game:GetService("UserInputService");
local ContentProvider = game:GetService("ContentProvider");
local StarterGui = game:GetService("StarterGui");
local Players = game:GetService("Players");
require(script.Types);
local l_script = script;
local Reference = require(l_script.Reference);
local Object = Reference.getObject();
local v1;

if Object then
    v1 = Object.Value;
else
    v1 = Object;
end;

if v1 and v1 ~= l_script then
    return require(v1);
end;

if not Object then
    Reference.addToReplicatedStorage();
end;

local GoodSignal = require(l_script.Packages.GoodSignal);
local Janitor = require(l_script.Packages.Janitor);
local Utility = require(l_script.Utility);
local Themes = require(l_script.Features.Themes);
local Gamepad = require(l_script.Features.Gamepad);
local Overflow = require(l_script.Features.Overflow);
local u2 = {};
u2.__index = u2;
local LocalPlayer = Players.LocalPlayer;
local Themes2 = l_script.Features.Themes;
local u3 = {};
local u4 = GoodSignal.new();
local Elements = l_script.Elements;
local u5 = 0;
local u6 = {
    mobile = Enum.PreferredInput.Touch,
    desktop = Enum.PreferredInput.KeyboardAndMouse,
    console = Enum.PreferredInput.Gamepad
};
u2.baseDisplayOrderChanged = GoodSignal.new();
u2.baseDisplayOrder = 10;
u2.baseTheme = require(Themes2.Default);
u2.isOldTopbar = false;
u2.iconsDictionary = u3;
u2.insetHeightChanged = GoodSignal.new();
u2.container = require(Elements.Container)(u2);
u2.topbarEnabled = true;
u2.iconAdded = GoodSignal.new();
u2.iconRemoved = GoodSignal.new();
u2.iconChanged = GoodSignal.new();

function u2.getIcons() -- Line: 110
    -- upvalues: u2 (copy)
    return u2.iconsDictionary;
end;

function u2.getIconByUID(p7) -- Line: 114
    -- upvalues: u2 (copy)
    return u2.iconsDictionary[p7] or nil;
end;

function u2.getIcon(p8) -- Line: 122
    -- upvalues: u2 (copy), u3 (copy)
    local IconByUID = u2.getIconByUID(p8);

    if IconByUID then
        return IconByUID;
    end;

    for _, v in pairs(u3) do
        if v.name == p8 then
            return v;
        end;
    end;

    return nil;
end;

function u2.setTopbarEnabled(p9, p10) -- Line: 135
    -- upvalues: u2 (copy)
    if typeof(p9) ~= "boolean" then
        p9 = u2.topbarEnabled;
    end;

    if not p10 then
        u2.topbarEnabled = p9;
    end;

    for _, v in pairs(u2.container) do
        v.Enabled = p9;
    end;
end;

function u2.modifyBaseTheme(p11) -- Line: 147
    -- upvalues: Themes (copy), u2 (copy), u3 (copy)
    local Modifications = Themes.getModifications(p11);

    for _, v in pairs(Modifications) do
        local v12 = v;

        for _, v2 in pairs(u2.baseTheme) do
            Themes.merge(v2, v12);
        end;
    end;

    for _, v in pairs(u3) do
        v:setTheme(u2.baseTheme);
    end;
end;

function u2.setDisplayOrder(p13) -- Line: 159
    -- upvalues: u2 (copy)
    u2.baseDisplayOrder = p13;
    u2.baseDisplayOrderChanged:Fire(p13);
end;

task.defer(Gamepad.start, u2);
task.defer(Overflow.start, u2);
task.defer(function() -- Line: 169
    -- upvalues: LocalPlayer (copy), u2 (copy), l_script (copy)
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui");

    for _, v in pairs(u2.container) do
        v.Parent = PlayerGui;
    end;

    require(l_script.Attribute);
end);

function u2.new() -- Line: 180
    -- upvalues: u2 (copy), Janitor (copy), Utility (copy), u3 (copy), GoodSignal (copy), l_script (copy), Elements (copy), u5 (ref), UserInputService (copy), u6 (copy), u4 (copy), StarterGui (copy)
    local u14 = {};
    setmetatable(u14, u2);
    local v15 = Janitor.new();
    u14.janitor = v15;
    u14.themesJanitor = v15:add(Janitor.new());
    u14.singleClickJanitor = v15:add(Janitor.new());
    u14.captionJanitor = v15:add(Janitor.new());
    u14.joinJanitor = v15:add(Janitor.new());
    u14.menuJanitor = v15:add(Janitor.new());
    u14.dropdownJanitor = v15:add(Janitor.new());
    local u16 = Utility.generateUID();
    u3[u16] = u14;
    v15:add(function() -- Line: 197
        -- upvalues: u3 (ref), u16 (copy)
        u3[u16] = nil;
    end);
    u14.selected = v15:add(GoodSignal.new());
    u14.deselected = v15:add(GoodSignal.new());
    u14.toggled = v15:add(GoodSignal.new());
    u14.viewingStarted = v15:add(GoodSignal.new());
    u14.viewingEnded = v15:add(GoodSignal.new());
    u14.stateChanged = v15:add(GoodSignal.new());
    u14.notified = v15:add(GoodSignal.new());
    u14.noticeStarted = v15:add(GoodSignal.new());
    u14.noticeChanged = v15:add(GoodSignal.new());
    u14.endNotices = v15:add(GoodSignal.new());
    u14.toggleKeyAdded = v15:add(GoodSignal.new());
    u14.fakeToggleKeyChanged = v15:add(GoodSignal.new());
    u14.alignmentChanged = v15:add(GoodSignal.new());
    u14.updateSize = v15:add(GoodSignal.new());
    u14.resizingComplete = v15:add(GoodSignal.new());
    u14.joinedParent = v15:add(GoodSignal.new());
    u14.menuSet = v15:add(GoodSignal.new());
    u14.dropdownSet = v15:add(GoodSignal.new());
    u14.updateMenu = v15:add(GoodSignal.new());
    u14.startMenuUpdate = v15:add(GoodSignal.new());
    u14.childThemeModified = v15:add(GoodSignal.new());
    u14.indicatorSet = v15:add(GoodSignal.new());
    u14.dropdownChildAdded = v15:add(GoodSignal.new());
    u14.menuChildAdded = v15:add(GoodSignal.new());
    u14.iconModule = l_script;
    u14.UID = u16;
    u14.isEnabled = true;
    u14.enabled = u14.isEnabled;
    u14.isSelected = false;
    u14.isViewing = false;
    u14.joinedFrame = false;
    u14.parentIconUID = false;
    u14.deselectWhenOtherIconSelected = true;
    u14.totalNotices = 0;
    u14.activeState = "Deselected";
    u14.alignment = "";
    u14.originalAlignment = "";
    u14.appliedTheme = {};
    u14.appearance = {};
    u14.cachedInstances = {};
    u14.cachedNamesToInstances = {};
    u14.cachedCollectives = {};
    u14.bindedToggleKeys = {};
    u14.customBehaviours = {};
    u14.toggleItems = {};
    u14.bindedEvents = {};
    u14.notices = {};
    u14.menuIcons = {};
    u14.dropdownIcons = {};
    u14.childIconsDict = {};
    u14.creationTime = os.clock();
    u14.widget = v15:add(require(Elements.Widget)(u14, u2));
    u14:setAlignment();
    u5 = u5 + 1;
    local v17 = u5 * 0.01 + 1;
    u14:setOrder(v17, "deselected");
    u14:setOrder(v17, "selected");
    u14:setTheme(u2.baseTheme);
    local Instance = u14:getInstance("ClickRegion");
    local u18 = false;
    local u19 = 0;

    local function handleToggle() -- Line: 277
        -- upvalues: u14 (copy), u19 (ref)
        if u14.locked then
            return;
        end;

        local v20 = tick();

        if v20 - u19 < 0.1 then
            return;
        end;

        u19 = v20;

        if u14.isSelected then
            u14:deselect("User", u14);

            return;
        end;

        u14:select("User", u14);
    end;

    Instance.MouseButton1Click:Connect(function() -- Line: 296
        -- upvalues: u18 (ref), u14 (copy), u19 (ref)
        u18 = true;

        if u14.locked then
            return;
        end;

        local v21 = tick();

        if v21 - u19 < 0.1 then
            return;
        end;

        u19 = v21;

        if u14.isSelected then
            u14:deselect("User", u14);

            return;
        end;

        u14:select("User", u14);
    end);
    Instance.TouchTap:Connect(function() -- Line: 301
        -- upvalues: u18 (ref), u14 (copy), u19 (ref)
        if not u18 then
            if u14.locked then
                return;
            end;

            local v22 = tick();

            if v22 - u19 < 0.1 then
                return;
            end;

            u19 = v22;

            if u14.isSelected then
                u14:deselect("User", u14);

                return;
            end;

            u14:select("User", u14);
        end;
    end);
    v15:add(UserInputService.InputBegan:Connect(function(p23, p24) -- Line: 314
        -- upvalues: u14 (copy), u19 (ref)
        if u14.locked then
            return;
        end;

        if u14.bindedToggleKeys[p23.KeyCode] and not p24 then
            if u14.locked then
                return;
            end;

            local v25 = tick();

            if v25 - u19 < 0.1 then
                return;
            end;

            u19 = v25;

            if u14.isSelected then
                u14:deselect("User", u14);

                return;
            end;

            u14:select("User", u14);
        end;
    end));

    local function viewingEnded() -- Line: 336
        -- upvalues: u14 (copy)
        if u14.locked then
            return;
        end;

        u14.isViewing = false;
        u14.viewingEnded:Fire(true);
        u14:setState(nil, "User", u14);
    end;

    u14.joinedParent:Connect(function() -- Line: 344
        -- upvalues: u14 (copy)
        if u14.isViewing then
            if u14.locked then
                return;
            end;

            u14.isViewing = false;
            u14.viewingEnded:Fire(true);
            u14:setState(nil, "User", u14);
        end;
    end);
    Instance.MouseEnter:Connect(function() -- Line: 349
        -- upvalues: UserInputService (ref), u6 (ref), u14 (copy)
        local v26 = UserInputService.PreferredInput ~= u6.desktop;

        if u14.locked then
            return;
        end;

        u14.isViewing = true;
        u14.viewingStarted:Fire(true);

        if not v26 then
            u14:setState("Viewing", "User", u14);
        end;
    end);
    local u27 = 0;
    v15:add(UserInputService.TouchEnded:Connect(viewingEnded));
    Instance.MouseLeave:Connect(viewingEnded);
    Instance.SelectionGained:Connect(function(p28) -- Line: 326, Name: viewingStarted
        -- upvalues: u14 (copy)
        if u14.locked then
            return;
        end;

        u14.isViewing = true;
        u14.viewingStarted:Fire(true);

        if not p28 then
            u14:setState("Viewing", "User", u14);
        end;
    end);
    Instance.SelectionLost:Connect(viewingEnded);
    Instance.MouseButton1Down:Connect(function() -- Line: 358
        -- upvalues: u14 (copy), UserInputService (ref), u6 (ref), u27 (ref)
        if not u14.locked and UserInputService.PreferredInput == u6.mobile then
            u27 = u27 + 1;
            local u29 = u27;
            task.delay(0.2, function() -- Line: 362
                -- upvalues: u29 (copy), u27 (ref), u14 (ref)
                if u29 == u27 then
                    if u14.locked then
                        return;
                    end;

                    u14.isViewing = true;
                    u14.viewingStarted:Fire(true);
                    u14:setState("Viewing", "User", u14);
                end;
            end);
        end;
    end);
    Instance.MouseButton1Up:Connect(function() -- Line: 369
        -- upvalues: u27 (ref)
        u27 = u27 + 1;
    end);
    local Instance2 = u14:getInstance("IconOverlay");
    u14.viewingStarted:Connect(function() -- Line: 375
        -- upvalues: Instance2 (copy), u14 (copy)
        Instance2.Visible = not u14.overlayDisabled;
    end);
    u14.viewingEnded:Connect(function() -- Line: 378
        -- upvalues: Instance2 (copy)
        Instance2.Visible = false;
    end);
    v15:add(u4:Connect(function(p30) -- Line: 383
        -- upvalues: u14 (copy)
        if p30 ~= u14 and (u14.deselectWhenOtherIconSelected and p30.deselectWhenOtherIconSelected) then
            u14:deselect("AutoDeselect", p30);
        end;
    end));
    local debug_info_ret = debug.info(2, "s");
    local string_split_ret = string.split(debug_info_ret, ".");
    local l_game = game;
    local v31 = nil;

    for _, v in pairs(string_split_ret) do
        l_game = l_game:FindFirstChild(v);

        if not l_game then
            break;
        end;

        if l_game:IsA("ScreenGui") then
            v31 = l_game;
        end;
    end;

    if l_game and (v31 and v31.ResetOnSpawn == true) then
        u14.originsScreenGui = v31;
        Utility.localPlayerRespawned(function() -- Line: 409
            -- upvalues: u14 (copy)
            u14:destroy();
        end);
    end;

    u14.toggled:Connect(function(p32) -- Line: 415
        -- upvalues: u14 (copy), u2 (ref)
        u14.noticeChanged:Fire(u14.totalNotices);

        for i, _ in pairs(u14.childIconsDict) do
            local IconByUID = u2.getIconByUID(i);
            IconByUID.noticeChanged:Fire(IconByUID.totalNotices);

            if not p32 and IconByUID.isSelected then
                for _, _ in pairs(IconByUID.childIconsDict) do
                    IconByUID:deselect("HideParentFeature", u14);
                end;
            end;
        end;
    end);
    u14.selected:Connect(function() -- Line: 438
        -- upvalues: u14 (copy), StarterGui (ref)
        if #u14.dropdownIcons > 0 then
            if StarterGui:GetCore("ChatActive") and u14.alignment ~= "Right" then
                u14.chatWasPreviouslyActive = true;
                StarterGui:SetCore("ChatActive", false);
            end;

            if StarterGui:GetCoreGuiEnabled("PlayerList") and u14.alignment ~= "Left" then
                u14.playerlistWasPreviouslyActive = true;
                StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);
            end;
        end;
    end);
    u14.deselected:Connect(function() -- Line: 451
        -- upvalues: u14 (copy), StarterGui (ref)
        if u14.chatWasPreviouslyActive then
            u14.chatWasPreviouslyActive = nil;
            StarterGui:SetCore("ChatActive", true);
        end;

        if u14.playerlistWasPreviouslyActive then
            u14.playerlistWasPreviouslyActive = nil;
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true);
        end;
    end);
    task.delay(0.1, function() -- Line: 465
        -- upvalues: u14 (copy)
        if u14.activeState == "Deselected" then
            u14.stateChanged:Fire("Deselected");
            u14:refresh();
        end;
    end);
    u2.iconAdded:Fire(u14);

    return u14;
end;

function u2.setName(p33, p34) -- Line: 481
    p33.widget.Name = p34;
    p33.name = p34;

    return p33;
end;

function u2.setState(p35, p36, p37, p38) -- Line: 487
    -- upvalues: Utility (copy), u4 (copy)
    local v39 = Utility.formatStateName(p36 or (p35.isSelected and "Selected" or "Deselected"));

    if p35.activeState == v39 then
        return;
    end;

    local isSelected = p35.isSelected;
    p35.activeState = v39;

    if v39 == "Deselected" then
        p35.isSelected = false;

        if isSelected then
            p35.toggled:Fire(false, p37, p38);
            p35.deselected:Fire(p37, p38);
        end;

        p35:_setToggleItemsVisible(false, p37, p38);
    elseif v39 == "Selected" then
        p35.isSelected = true;

        if not isSelected then
            p35.toggled:Fire(true, p37, p38);
            p35.selected:Fire(p37, p38);
            u4:Fire(p35, p37, p38);
        end;

        p35:_setToggleItemsVisible(true, p37, p38);
    end;

    p35.stateChanged:Fire(v39, p37, p38);
end;

function u2.getInstance(u40, u41) -- Line: 520
    -- upvalues: Themes (copy)
    local v42 = u40.cachedNamesToInstances[u41];

    if v42 then
        return v42;
    end;

    local function cacheInstance(u43, u44) -- Line: 528
        -- upvalues: u40 (copy)
        if not u40.cachedInstances[u44] then
            local Attribute = u44:GetAttribute("Collective");

            if Attribute then
                Attribute = u40.cachedCollectives[Attribute];
            end;

            if Attribute then
                table.insert(Attribute, u44);
            end;

            u40.cachedNamesToInstances[u43] = u44;
            u40.cachedInstances[u44] = true;
            u44.Destroying:Once(function() -- Line: 538
                -- upvalues: u40 (ref), u43 (copy), u44 (copy)
                u40.cachedNamesToInstances[u43] = nil;
                u40.cachedInstances[u44] = nil;
            end);
        end;
    end;

    local widget = u40.widget;
    cacheInstance("Widget", widget);

    if u41 == "Widget" then
        return widget;
    end;

    local u45 = nil;

    local function scanChildren(p46) -- Line: 551
        -- upvalues: u40 (copy), Themes (ref), scanChildren (copy), cacheInstance (copy), u41 (copy), u45 (ref)
        for _, child in pairs(p46:GetChildren()) do
            local Attribute = child:GetAttribute("WidgetUID");

            if not Attribute or Attribute == u40.UID then
                local v47 = Themes.getRealInstance(child) or child;
                scanChildren(v47);

                if v47:IsA("GuiBase") or (v47:IsA("UIBase") or v47:IsA("ValueBase")) then
                    local Name = v47.Name;
                    cacheInstance(Name, v47);

                    if Name == u41 then
                        u45 = v47;
                    end;
                end;
            end;
        end;
    end;

    scanChildren(widget);

    return u45;
end;

function u2.getCollective(p48, p49) -- Line: 580
    local v50 = p48.cachedCollectives[p49];

    if v50 then
        return v50;
    end;

    local v51 = {};

    for i, _ in pairs(p48.cachedInstances) do
        if i:GetAttribute("Collective") == p49 then
            table.insert(v51, i);
        end;
    end;

    p48.cachedCollectives[p49] = v51;

    return v51;
end;

function u2.getInstanceOrCollective(p52, p53) -- Line: 601
    local v54 = {};
    local Instance = p52:getInstance(p53);

    if Instance then
        table.insert(v54, Instance);
    end;

    if #v54 == 0 then
        v54 = p52:getCollective(p53);
    end;

    return v54;
end;

function u2.getStateGroup(p55, p56) -- Line: 615
    local v57 = p56 or p55.activeState;
    local v58 = p55.appearance[v57];

    if not v58 then
        v58 = {};
        p55.appearance[v57] = v58;
    end;

    return v58;
end;

function u2.refreshAppearance(p59, p60, p61) -- Line: 625
    -- upvalues: Themes (copy)
    Themes.refresh(p59, p60, p61);

    return p59;
end;

function u2.refresh(p62) -- Line: 630
    p62:refreshAppearance(p62.widget);
    p62.updateSize:Fire();

    return p62;
end;

function u2.updateParent(p63) -- Line: 636
    -- upvalues: u2 (copy)
    local IconByUID = u2.getIconByUID(p63.parentIconUID);

    if IconByUID then
        IconByUID.updateSize:Fire();
    end;
end;

function u2.setBehaviour(p64, p65, p66, p67, p68) -- Line: 643
    p64.customBehaviours[p65 .. "-" .. p66] = p67;

    if p68 then
        local InstanceOrCollective = p64:getInstanceOrCollective(p65);

        for _, v in pairs(InstanceOrCollective) do
            p64:refreshAppearance(v, p66);
        end;
    end;
end;

function u2.modifyTheme(p69, p70, p71) -- Line: 656
    -- upvalues: Themes (copy)
    return p69, Themes.modify(p69, p70, p71);
end;

function u2.modifyChildTheme(p72, p73, p74) -- Line: 661
    -- upvalues: u2 (copy)
    p72.childModifications = p73;
    p72.childModificationsUID = p74;

    for i, _ in pairs(p72.childIconsDict) do
        u2.getIconByUID(i):modifyTheme(p73, p74);
    end;

    p72.childThemeModified:Fire();

    return p72;
end;

function u2.removeModification(p75, p76) -- Line: 674
    -- upvalues: Themes (copy)
    Themes.remove(p75, p76);

    return p75;
end;

function u2.removeModificationWith(p77, p78, p79, p80) -- Line: 679
    -- upvalues: Themes (copy)
    Themes.removeWith(p77, p78, p79, p80);

    return p77;
end;

function u2.setTheme(p81, p82) -- Line: 684
    -- upvalues: Themes (copy)
    Themes.set(p81, p82);

    return p81;
end;

function u2.setEnabled(p83, p84) -- Line: 689
    p83.isEnabled = p84;
    p83.enabled = p83.isEnabled;
    p83.widget.Visible = p84;
    p83:updateParent();

    return p83;
end;

function u2.select(p85, p86, p87) -- Line: 697
    p85:setState("Selected", p86, p87);

    return p85;
end;

function u2.deselect(p88, p89, p90) -- Line: 702
    p88:setState("Deselected", p89, p90);

    return p88;
end;

function u2.notify(p91, p92, p93) -- Line: 707
    -- upvalues: Elements (copy), u2 (copy)
    if not p91.notice then
        p91.notice = require(Elements.Notice)(p91, u2);
    end;

    p91.noticeStarted:Fire(p92, p93);

    return p91;
end;

function u2.clearNotices(p94) -- Line: 721
    p94.endNotices:Fire();

    return p94;
end;

function u2.disableOverlay(p95, p96) -- Line: 726
    p95.overlayDisabled = p96;

    return p95;
end;

u2.disableStateOverlay = u2.disableOverlay;

function u2.setImage(p97, u98, p99) -- Line: 732
    -- upvalues: ContentProvider (copy)
    p97:modifyTheme({
        "IconImage",
        "Image",
        u98,
        p99
    });
    task.spawn(function() -- Line: 736
        -- upvalues: u98 (copy), ContentProvider (ref)
        local v100;

        if tonumber(u98) then
            v100 = `rbxassetid://{u98}`;
        else
            v100 = u98;
        end;

        if ContentProvider:GetAssetFetchStatus(v100) ~= Enum.AssetFetchStatus.Success then
            pcall(ContentProvider.PreloadAsync, ContentProvider, { v100 });
        end;
    end);

    return p97;
end;

function u2.setLabel(p101, p102, p103) -- Line: 748
    p101:modifyTheme({
        "IconLabel",
        "Text",
        p102,
        p103
    });

    return p101;
end;

function u2.setOrder(p104, p105, p106) -- Line: 753
    local v107 = p105 * 100;
    p104:modifyTheme({
        "IconSpot",
        "LayoutOrder",
        v107,
        p106
    });
    p104:modifyTheme({
        "Widget",
        "LayoutOrder",
        v107,
        p106
    });

    return p104;
end;

function u2.setCornerRadius(p108, p109, p110) -- Line: 762
    p108:modifyTheme({
        "IconCorners",
        "CornerRadius",
        p109,
        p110
    });

    return p108;
end;

function u2.align(p111, p112, p113) -- Line: 767
    -- upvalues: u2 (copy)
    local v114 = tostring(p112):lower();
    local v115 = (v114 == "mid" or v114 == "centre") and "center" or v114;
    local v116 = v115 ~= "left" and (v115 ~= "center" and v115 ~= "right") and "left" or v115;
    local v117 = v116 == "center" and u2.container.TopbarCentered or u2.container.TopbarStandard;
    local Holders = v117.Holders;
    local v118 = string.upper((string.sub(v116, 1, 1))) .. string.sub(v116, 2);

    if not p113 then
        p111.originalAlignment = v118;
    end;

    local joinedFrame = p111.joinedFrame;
    local v119 = Holders[v118];
    p111.screenGui = v117;
    p111.alignmentHolder = v119;

    if not p111.isDestroyed then
        p111.widget.Parent = joinedFrame or v119;
    end;

    p111.alignment = v118;
    p111.alignmentChanged:Fire(v118);
    u2.iconChanged:Fire(p111);

    return p111;
end;

u2.setAlignment = u2.align;

function u2.setLeft(p120) -- Line: 796
    p120:setAlignment("Left");

    return p120;
end;

function u2.setMid(p121) -- Line: 801
    p121:setAlignment("Center");

    return p121;
end;

function u2.setRight(p122) -- Line: 806
    p122:setAlignment("Right");

    return p122;
end;

function u2.setWidth(p123, p124, p125) -- Line: 811
    p123:modifyTheme({
        "Widget",
        "DesiredWidth",
        p124,
        p125
    });

    return p123;
end;

function u2.setImageScale(p126, p127, p128) -- Line: 819
    p126:modifyTheme({
        "IconImageScale",
        "Value",
        p127,
        p128
    });

    return p126;
end;

function u2.setImageRatio(p129, p130, p131) -- Line: 824
    p129:modifyTheme({
        "IconImageRatio",
        "AspectRatio",
        p130,
        p131
    });

    return p129;
end;

function u2.setTextSize(p132, p133, p134) -- Line: 829
    p132:modifyTheme({
        "IconLabel",
        "TextSize",
        p133,
        p134
    });

    return p132;
end;

function u2.setTextFont(p135, p136, p137, p138, p139) -- Line: 834
    local v140 = p137 or Enum.FontWeight.Regular;
    local v141 = p138 or Enum.FontStyle.Normal;
    local v142 = nil;
    local v143 = typeof(p136);

    if v143 == "number" then
        v142 = Font.fromId(p136, v140, v141);
    elseif v143 == "EnumItem" then
        v142 = Font.fromEnum(p136);
    elseif v143 == "string" and not p136:match("rbxasset") then
        v142 = Font.fromName(p136, v140, v141);
    end;

    p135:modifyTheme({
        "IconLabel",
        "FontFace",
        v142 or Font.new(p136, v140, v141),
        p139
    });

    return p135;
end;

function u2.setTextColor(p144, p145, p146) -- Line: 855
    if p145 == nil or (p145 == "" or (type(p145) ~= "userdata" or typeof(p145) ~= "Color3")) then
        if p145 ~= nil and p145 ~= "" then
            warn("setTextColor item must be a Color3 value! Changed the color to white.");
        end;

        p145 = Color3.fromRGB(255, 255, 255);
    end;

    p144:modifyTheme({
        "IconLabel",
        "TextColor3",
        p145,
        p146
    });

    return p144;
end;

function u2.bindToggleItem(p147, p148) -- Line: 867
    if not (p148:IsA("GuiObject") or p148:IsA("LayerCollector")) then
        error("Toggle item must be a GuiObject or LayerCollector!");
    end;

    p147.toggleItems[p148] = true;
    p147:_updateSelectionInstances();

    return p147;
end;

function u2.unbindToggleItem(p149, p150) -- Line: 876
    p149.toggleItems[p150] = nil;
    p149:_updateSelectionInstances();

    return p149;
end;

function u2._updateSelectionInstances(p151) -- Line: 882
    for i, _ in pairs(p151.toggleItems) do
        local v152 = {};

        for _, descendant in pairs(i:GetDescendants()) do
            if (descendant:IsA("TextButton") or descendant:IsA("ImageButton")) and descendant.Active then
                table.insert(v152, descendant);
            end;
        end;

        p151.toggleItems[i] = v152;
    end;
end;

function u2._setToggleItemsVisible(p153, p154, p155, p156) -- Line: 896
    for i, _ in pairs(p153.toggleItems) do
        if not (p156 and (p156 ~= p153 and p156.toggleItems[i] ~= nil)) then
            i[i:IsA("LayerCollector") and "Enabled" or "Visible"] = p154;
        end;
    end;
end;

function u2.bindEvent(u157, p158, u159) -- Line: 908
    local v160 = u157[p158];
    local v161;

    if v160 then
        if typeof(v160) == "table" then
            v161 = v160.Connect;
        else
            v161 = false;
        end;
    else
        v161 = v160;
    end;

    assert(v161, "argument[1] must be a valid topbarplus icon event name!");
    local v162 = typeof(u159) == "function";
    assert(v162, "argument[2] must be a function!");
    u157.bindedEvents[p158] = v160:Connect(function(...) -- Line: 912
        -- upvalues: u159 (copy), u157 (copy)
        u159(u157, ...);
    end);

    return u157;
end;

function u2.unbindEvent(p163, p164) -- Line: 918
    local v165 = p163.bindedEvents[p164];

    if v165 then
        v165:Disconnect();
        p163.bindedEvents[p164] = nil;
    end;

    return p163;
end;

function u2.bindToggleKey(p166, p167) -- Line: 927
    local v168 = typeof(p167) == "EnumItem";
    assert(v168, "argument[1] must be a KeyCode EnumItem!");
    p166.bindedToggleKeys[p167] = true;
    p166.toggleKeyAdded:Fire(p167);
    p166:setCaption("_hotkey_");

    return p166;
end;

function u2.unbindToggleKey(p169, p170) -- Line: 935
    local v171 = typeof(p170) == "EnumItem";
    assert(v171, "argument[1] must be a KeyCode EnumItem!");
    p169.bindedToggleKeys[p170] = nil;

    return p169;
end;

function u2.call(u172, u173, ...) -- Line: 941
    local table_pack_ret = table.pack(...);
    task.spawn(function() -- Line: 943
        -- upvalues: u173 (copy), u172 (copy), table_pack_ret (copy)
        u173(u172, table.unpack(table_pack_ret));
    end);

    return u172;
end;

function u2.addToJanitor(p174, p175, p176, p177) -- Line: 949
    p174.janitor:add(p175, p176, p177);

    return p174;
end;

function u2.lock(p178) -- Line: 954
    p178:getInstance("ClickRegion").Visible = false;
    p178.locked = true;

    return p178;
end;

function u2.unlock(p179) -- Line: 962
    p179:getInstance("ClickRegion").Visible = true;
    p179.locked = false;

    return p179;
end;

function u2.debounce(p180, p181) -- Line: 969
    p180:lock();
    task.wait(p181);
    p180:unlock();

    return p180;
end;

function u2.autoDeselect(p182, p183) -- Line: 976
    p182.deselectWhenOtherIconSelected = p183 == nil and true or p183;

    return p182;
end;

function u2.oneClick(u184, p185) -- Line: 986
    local singleClickJanitor = u184.singleClickJanitor;
    singleClickJanitor:clean();

    if p185 or p185 == nil then
        singleClickJanitor:add(u184.selected:Connect(function() -- Line: 992
            -- upvalues: u184 (copy)
            u184:deselect("OneClick", u184);
        end));
    end;

    u184.oneClickEnabled = true;

    return u184;
end;

function u2.setCaption(p186, p187) -- Line: 1000
    -- upvalues: Elements (copy)
    if p187 == "_hotkey_" and p186.captionText then
        return p186;
    end;

    local captionJanitor = p186.captionJanitor;
    p186.captionJanitor:clean();

    if not p187 or p187 == "" then
        p186.caption = nil;
        p186.captionText = nil;

        return p186;
    end;

    local v188 = captionJanitor:add(require(Elements.Caption)(p186));
    v188:SetAttribute("CaptionText", p187);
    p186.caption = v188;
    p186.captionText = p187;

    return p186;
end;

function u2.setCaptionHint(p189, p190) -- Line: 1018
    local v191 = typeof(p190) == "EnumItem";
    assert(v191, "argument[1] must be a KeyCode EnumItem!");
    p189.fakeToggleKey = p190;
    p189.fakeToggleKeyChanged:Fire(p190);
    p189:setCaption("_hotkey_");

    return p189;
end;

function u2.leave(p192) -- Line: 1026
    p192.joinJanitor:clean();

    return p192;
end;

function u2.joinMenu(p193, p194) -- Line: 1032
    -- upvalues: Utility (copy)
    Utility.joinFeature(p193, p194, p194.menuIcons, p194:getInstance("Menu"));
    p194.menuChildAdded:Fire(p193);

    return p193;
end;

function u2.setMenu(p195, p196) -- Line: 1038
    p195.menuSet:Fire(p196);

    return p195;
end;

function u2.setFixedMenu(p197, p198) -- Line: 1043
    p197:freezeMenu(p198);
    p197:setMenu(p198);
end;

u2.setFrozenMenu = u2.setFixedMenu;

function u2.freezeMenu(u199) -- Line: 1049
    u199:select("FrozenMenu", u199);
    u199:bindEvent("deselected", function(p200) -- Line: 1053
        -- upvalues: u199 (copy)
        p200:select("FrozenMenu", u199);
    end);
    u199:modifyTheme({ "IconSpot", "Visible", false });
end;

function u2.joinDropdown(p201, p202) -- Line: 1059
    -- upvalues: Utility (copy)
    p202:getDropdown();
    Utility.joinFeature(p201, p202, p202.dropdownIcons, p202:getInstance("DropdownScroller"));
    p202.dropdownChildAdded:Fire(p201);

    return p201;
end;

function u2.getDropdown(p203) -- Line: 1066
    -- upvalues: Elements (copy)
    local dropdown = p203.dropdown;

    if not dropdown then
        dropdown = require(Elements.Dropdown)(p203);
        p203.dropdown = dropdown;
        p203:clipOutside(dropdown);
    end;

    return dropdown;
end;

function u2.setDropdown(p204, p205) -- Line: 1076
    p204:getDropdown();
    p204.dropdownSet:Fire(p205);

    return p204;
end;

function u2.clipOutside(p206, p207) -- Line: 1082
    -- upvalues: Utility (copy)
    local v208 = Utility.clipOutside(p206, p207);
    p206:refreshAppearance(p207);

    return p206, v208;
end;

function u2.setIndicator(p209, p210) -- Line: 1093
    -- upvalues: Elements (copy), u2 (copy)
    if not p209.indicator then
        p209.indicator = p209.janitor:add(require(Elements.Indicator)(p209, u2));
    end;

    p209.indicatorSet:Fire(p210);
end;

function u2.convertLabelToNumberSpinner(u211, u212, u213) -- Line: 1105
    task.defer(function() -- Line: 1106
        -- upvalues: u211 (copy), u212 (copy), u213 (copy)
        local Instance = u211:getInstance("IconLabel");
        Instance.Transparency = 1;
        u212.Parent = Instance.Parent;
        u212.Size = UDim2.fromScale(1, 1);
        u212.AnchorPoint = Vector2.new(0.5, 0.5);
        u212.Position = UDim2.new(0.5, 0, 0.5, 0);
        u212.TextXAlignment = Enum.TextXAlignment.Center;
        u212.ClipsDescendants = false;

        for _, v in ipairs({ "FontFace", "BorderSizePixel", "BorderColor3", "Rotation", "TextStrokeTransparency", "TextStrokeColor3", "TextStrokeTransparency", "TextColor3" }) do
            u212[v] = Instance[v];
            u211:addToJanitor(Instance:GetPropertyChangedSignal(v):Connect(function() -- Line: 1129
                -- upvalues: u212 (ref), v (copy), Instance (copy)
                u212[v] = Instance[v];
            end));
        end;

        local function getSpinnerSizeAndDigitCount() -- Line: 1136
            -- upvalues: u212 (ref)
            local v214 = 0;
            local v215 = 0;

            for _, child in u212.Frame:GetChildren() do
                local string_lower_ret = string.lower(child.Name);

                if string_lower_ret == "digit" then
                    v214 = v214 + child.AbsoluteSize.X;
                    v215 = v215 + 1;
                elseif (string_lower_ret == "prefix" or (string_lower_ret == "suffix" or string_lower_ret == "comma")) and child.Text ~= "" then
                    v214 = v214 + child.AbsoluteSize.X;
                    v215 = v215 + 1;
                end;
            end;

            return v214, v215;
        end;

        local function getLabelParentContainerXSize() -- Line: 1154
            -- upvalues: Instance (copy), u212 (ref)
            local Parent = Instance.Parent;

            if Parent then
                Parent = Parent.Parent;
            end;

            if Parent == nil then
                return 0;
            end;

            if Parent.IconImage.Visible == true then
                return u212.Frame.AbsoluteSize.X + Instance.Parent.Parent.IconImage.AbsoluteSize.X;
            end;

            return Parent.AbsoluteSize.X;
        end;

        local function getNumberSpinnerXSize() -- Line: 1166
            -- upvalues: u212 (ref)
            return u212.Frame.AbsoluteSize.X;
        end;

        local function adjustSize() -- Line: 1170
            -- upvalues: getSpinnerSizeAndDigitCount (copy), u211 (ref), u212 (ref), Instance (copy)
            local v216, v217 = getSpinnerSizeAndDigitCount();

            if v217 < 18 then
                u211:setLabel(u212.Value);
            end;

            local X = u212.Frame.AbsoluteSize.X;

            while v216 < X and u211.isDestroyed ~= true do
                task.wait(0.05);

                if v217 > 0 and v217 < 8 then
                    u212.TextSize = Instance.TextSize;
                    break;
                end;

                local v218 = u212;
                v218.TextSize = v218.TextSize + 1;
                X = u212.Frame.AbsoluteSize.X;
                v216, v217 = getSpinnerSizeAndDigitCount();
            end;

            local Parent = Instance.Parent;

            if Parent then
                Parent = Parent.Parent;
            end;

            local v219;

            if Parent == nil then
                v219 = 0;
            elseif Parent.IconImage.Visible == true then
                v219 = u212.Frame.AbsoluteSize.X + Instance.Parent.Parent.IconImage.AbsoluteSize.X;
            else
                v219 = Parent.AbsoluteSize.X;
            end;

            while v219 < v216 and u211.isDestroyed ~= true do
                task.wait(0.05);

                if v217 < 8 and v217 > 0 then
                    u212.TextSize = Instance.TextSize;

                    return;
                end;

                local v220 = u212;
                v220.TextSize = v220.TextSize - 1;
                local Parent2 = Instance.Parent;

                if Parent2 then
                    Parent2 = Parent2.Parent;
                end;

                if Parent2 == nil then
                    v219 = 0;
                elseif Parent2.IconImage.Visible == true then
                    v219 = u212.Frame.AbsoluteSize.X + Instance.Parent.Parent.IconImage.AbsoluteSize.X;
                else
                    v219 = Parent2.AbsoluteSize.X;
                end;

                v216, v217 = getSpinnerSizeAndDigitCount();
            end;
        end;

        u211:addToJanitor(u212.Frame.ChildAdded:Connect(adjustSize));
        u211:addToJanitor(u212.Frame.ChildRemoved:Connect(adjustSize));
        u211:addToJanitor(u211.iconAdded:Connect(function() -- Line: 1208
            -- upvalues: adjustSize (copy)
            task.wait(1);
            adjustSize();
        end));
        u211:updateParent();
        u212.Name = "LabelSpinner";
        u212.Prefix = "$";
        u212.Commas = true;
        u212.Decimals = 0;
        u212.Duration = 0.25;
        u212.Value = 10;
        task.wait(0.2);

        if typeof(u213) == "function" then
            u213();
        end;
    end);

    return u211;
end;

function u2.destroy(p221) -- Line: 1235
    -- upvalues: u2 (copy)
    if p221.isDestroyed then
        return;
    end;

    p221:clearNotices();

    if p221.parentIconUID then
        p221:leave();
    end;

    p221.isDestroyed = true;
    p221.janitor:clean();
    u2.iconRemoved:Fire(p221);
end;

u2.Destroy = u2.destroy;

return u2;