local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local THEME = {
    Background = Color3.fromRGB(20, 20, 24),
    ItemBG = Color3.fromRGB(32, 32, 38),
    Accent = Color3.fromRGB(114, 100, 255),
    Text = Color3.fromRGB(240, 240, 240),
    SubText = Color3.fromRGB(150, 150, 160),
    Success = Color3.fromRGB(100, 255, 140),
    Warning = Color3.fromRGB(255, 200, 80),
    Slider = Color3.fromRGB(60, 60, 70)
}

pcall(function()
    if CoreGui:FindFirstChild("Unpatchabomb") then
        CoreGui.Unpatchabomb:Destroy()
    end
    local playerGui = Players.LocalPlayer:FindFirstChild("PlayerGui")
    if playerGui and playerGui:FindFirstChild("Unpatchabomb") then
        playerGui.Unpatchabomb:Destroy()
    end
end)

local Unpatchabomb = Instance.new("ScreenGui")
local UnpatchabombFrame = Instance.new("Frame")
local MainFrame = Instance.new("Frame")
local LetterBox = Instance.new("TextBox")
local AutoBtn = Instance.new("TextButton")
local DelayBox = Instance.new("TextBox")
local WordText = Instance.new("TextLabel")
local TopFrame = Instance.new("Frame")
local T1 = Instance.new("TextLabel")
local T2 = Instance.new("TextLabel")

local CategoryBtn = Instance.new("TextButton")
local ReloadBtn = Instance.new("TextButton")
local SuggestionList = Instance.new("ScrollingFrame")
local ListLayout = Instance.new("UIListLayout")

local WhitelistBtn = Instance.new("TextButton")
local UsedBtn = Instance.new("TextButton")

Unpatchabomb.Name = "Unpatchabomb"
local success = pcall(function() Unpatchabomb.Parent = CoreGui end)
if not success then Unpatchabomb.Parent = Players.LocalPlayer:WaitForChild("PlayerGui") end
Unpatchabomb.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Unpatchabomb.ResetOnSpawn = false

UnpatchabombFrame.Name = "UnpatchabombFrame"
UnpatchabombFrame.Parent = Unpatchabomb
UnpatchabombFrame.BackgroundColor3 = THEME.Background
UnpatchabombFrame.BackgroundTransparency = 1.000
UnpatchabombFrame.BorderSizePixel = 0
UnpatchabombFrame.Position = UDim2.new(0, 100, 0, 100)
UnpatchabombFrame.Size = UDim2.new(0, 305, 0, 350)

local MIN_SCALE, MAX_SCALE, SCALE_STEP = 1, 4, 0.25
local guiScale = 1

local FrameScale = Instance.new("UIScale")
FrameScale.Parent = UnpatchabombFrame
FrameScale.Scale = 1

TopFrame.Name = "TopFrame"
TopFrame.Parent = UnpatchabombFrame
TopFrame.BackgroundColor3 = THEME.Background
TopFrame.BorderSizePixel = 0
TopFrame.Size = UDim2.new(1, 0, 0, 28)

local TopAccent = Instance.new("Frame")
TopAccent.Name = "TopAccent"
TopAccent.Parent = TopFrame
TopAccent.BackgroundColor3 = THEME.Accent
TopAccent.BorderSizePixel = 0
TopAccent.Position = UDim2.new(0, 0, 1, -1)
TopAccent.Size = UDim2.new(1, 0, 0, 1)

T1.Name = "T1"
T1.Parent = TopFrame
T1.BackgroundTransparency = 1.000
T1.Position = UDim2.new(0.01, 0, 0, 0)
T1.Size = UDim2.new(0.25, 0, 1, 0)
T1.Font = Enum.Font.GothamBold
T1.Text = "UNPATCHA"
T1.TextColor3 = THEME.Text
T1.TextSize = 14.000
T1.TextXAlignment = Enum.TextXAlignment.Right

T2.Name = "T2"
T2.Parent = TopFrame
T2.BackgroundTransparency = 1.000
T2.Position = UDim2.new(0.26, 0, 0, 0)
T2.Size = UDim2.new(0.5, 0, 1, 0)
T2.Font = Enum.Font.Gotham
T2.Text = "BOMB (EN)"
T2.TextColor3 = THEME.SubText
T2.TextSize = 14.000
T2.TextXAlignment = Enum.TextXAlignment.Left

MainFrame.Name = "MainFrame"
MainFrame.Parent = UnpatchabombFrame
MainFrame.BackgroundColor3 = THEME.Background
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0, 0, 0, 28)
MainFrame.Size = UDim2.new(1, 0, 1, -28)

LetterBox.Name = "LetterBox"
LetterBox.Parent = MainFrame
LetterBox.BackgroundColor3 = THEME.ItemBG
LetterBox.BorderColor3 = THEME.Accent
LetterBox.BorderSizePixel = 1
LetterBox.Position = UDim2.new(0.02, 0, 0.05, 0)
LetterBox.Size = UDim2.new(0.66, 0, 0.12, 0)
LetterBox.Font = Enum.Font.GothamBold
LetterBox.Text = ""
LetterBox.PlaceholderText = "Letters (Press Enter)"
LetterBox.TextColor3 = THEME.Text
LetterBox.TextSize = 14.000
LetterBox.ClearTextOnFocus = false

local LetterCorner = Instance.new("UICorner")
LetterCorner.CornerRadius = UDim.new(0, 4)
LetterCorner.Parent = LetterBox

AutoBtn.Name = "AutoBtn"
AutoBtn.Parent = MainFrame
AutoBtn.BackgroundColor3 = THEME.ItemBG
AutoBtn.Position = UDim2.new(0.70, 0, 0.05, 0)
AutoBtn.Size = UDim2.new(0.28, 0, 0.12, 0)
AutoBtn.Font = Enum.Font.GothamBold
AutoBtn.Text = "AUTO: OFF"
AutoBtn.TextColor3 = THEME.Text
AutoBtn.TextSize = 12.000

CategoryBtn.Name = "CategoryBtn"
CategoryBtn.Parent = MainFrame
CategoryBtn.BackgroundColor3 = THEME.ItemBG
CategoryBtn.Position = UDim2.new(0.02, 0, 0.19, 0)
CategoryBtn.Size = UDim2.new(0.66, 0, 0.1, 0)
CategoryBtn.Font = Enum.Font.GothamBold
CategoryBtn.Text = "Category: LONG WORDS"
CategoryBtn.TextColor3 = THEME.Accent
CategoryBtn.TextSize = 12.000

ReloadBtn.Name = "ReloadBtn"
ReloadBtn.Parent = MainFrame
ReloadBtn.BackgroundColor3 = THEME.ItemBG
ReloadBtn.Position = UDim2.new(0.70, 0, 0.19, 0)
ReloadBtn.Size = UDim2.new(0.28, 0, 0.1, 0)
ReloadBtn.Font = Enum.Font.GothamBold
ReloadBtn.Text = "RELOAD"
ReloadBtn.TextColor3 = THEME.Text
ReloadBtn.TextSize = 12.000

DelayBox.Name = "DelayBox"
DelayBox.Parent = MainFrame
DelayBox.BackgroundColor3 = THEME.ItemBG
DelayBox.BorderSizePixel = 0
DelayBox.Position = UDim2.new(0.02, 0, 0.31, 0)
DelayBox.Size = UDim2.new(0.96, 0, 0.08, 0)
DelayBox.Font = Enum.Font.GothamBold
DelayBox.Text = "0"
DelayBox.PlaceholderText = "Type Delay (e.g. 0.05)"
DelayBox.TextColor3 = THEME.Success
DelayBox.TextSize = 12.000
DelayBox.ClearTextOnFocus = false

WordText.Name = "WordText"
WordText.Parent = MainFrame
WordText.BackgroundTransparency = 1.000
WordText.Position = UDim2.new(0, 0, 0.41, 0)
WordText.Size = UDim2.new(1, 0, 0.08, 0)
WordText.Font = Enum.Font.GothamBold
WordText.Text = "Waiting for input..."
WordText.TextColor3 = THEME.Text
WordText.TextSize = 12.000

SuggestionList.Name = "SuggestionList"
SuggestionList.Parent = MainFrame
SuggestionList.BackgroundColor3 = THEME.Background
SuggestionList.BorderSizePixel = 0
SuggestionList.Position = UDim2.new(0.02, 0, 0.51, 0)
SuggestionList.Size = UDim2.new(0.96, 0, 0.35, 0)
SuggestionList.ScrollBarThickness = 4

ListLayout.Parent = SuggestionList
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.Padding = UDim.new(0, 2)

WhitelistBtn.Name = "WhitelistBtn"
WhitelistBtn.Parent = MainFrame
WhitelistBtn.BackgroundColor3 = THEME.ItemBG
WhitelistBtn.Position = UDim2.new(0.02, 0, 0.88, 0)
WhitelistBtn.Size = UDim2.new(0.47, 0, 0.1, 0)
WhitelistBtn.Font = Enum.Font.GothamBold
WhitelistBtn.Text = "WHITELIST"
WhitelistBtn.TextColor3 = THEME.Success
WhitelistBtn.TextSize = 12.000

UsedBtn.Name = "UsedBtn"
UsedBtn.Parent = MainFrame
UsedBtn.BackgroundColor3 = THEME.ItemBG
UsedBtn.Position = UDim2.new(0.51, 0, 0.88, 0)
UsedBtn.Size = UDim2.new(0.47, 0, 0.1, 0)
UsedBtn.Font = Enum.Font.GothamBold
UsedBtn.Text = "USED"
UsedBtn.TextColor3 = THEME.Accent
UsedBtn.TextSize = 12.000

local ResizeGrip = Instance.new("TextButton")
ResizeGrip.Name = "ResizeGrip"
ResizeGrip.Parent = UnpatchabombFrame
ResizeGrip.AnchorPoint = Vector2.new(1, 1)
ResizeGrip.Position = UDim2.new(1, 0, 1, 0)
ResizeGrip.Size = UDim2.new(0, 18, 0, 18)
ResizeGrip.BackgroundColor3 = THEME.Accent
ResizeGrip.BackgroundTransparency = 0.3
ResizeGrip.Text = "⤡"
ResizeGrip.Font = Enum.Font.GothamBold
ResizeGrip.TextSize = 14
ResizeGrip.TextColor3 = THEME.Text
ResizeGrip.BorderSizePixel = 0
ResizeGrip.ZIndex = 50

local gripScale = Instance.new("UIScale")
gripScale.Parent = ResizeGrip
gripScale.Scale = 1

local gripCorner = Instance.new("UICorner")
gripCorner.CornerRadius = UDim.new(0, 4)
gripCorner.Parent = ResizeGrip

local dragging, dragInput, dragStart, startPos
TopFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = UnpatchabombFrame.Position
    end
end)
TopFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        UnpatchabombFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

local resizing = false
local resizeStart = nil
local resizeStartSize = nil

ResizeGrip.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        resizing = true
        resizeStart = input.Position
        resizeStartSize = UnpatchabombFrame.AbsoluteSize
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - resizeStart
        local targetW = resizeStartSize.X + delta.X
        local targetH = resizeStartSize.Y + delta.Y
        local scaleX = targetW / 305
        local scaleY = targetH / 350
        local newScale = math.max(scaleX, scaleY)
        newScale = math.floor(newScale / SCALE_STEP + 0.5) * SCALE_STEP
        newScale = math.clamp(newScale, MIN_SCALE, MAX_SCALE)
        if newScale ~= guiScale then
            guiScale = newScale
            FrameScale.Scale = guiScale
            gripScale.Scale = 1 / guiScale
        end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
        resizing = false
    end
end)

local WORDS = {}
local IDA_alreadyUsed = {}
local autoGetEnabled = false
local currentTypeDelay = 0
local lastQuery = ""

local updateSuggestions
local UpdateUsedMenuVisuals

local CustomWhitelist = {}

local AUTHORIZED_ID = 11394722660
local IS_AUTHORIZED = (Players.LocalPlayer.UserId == AUTHORIZED_ID)

local WeirdWords = {}
local SecretGui = nil
local secretSlots = {}
local MIN_RAND, MAX_RAND = 2, 50
local randCount = 2

local function SaveWeird()
    if writefile then
        pcall(function()
            writefile("Unpatchabomb_Weird.json", HttpService:JSONEncode(WeirdWords))
        end)
    end
end

local function LoadWeird()
    if readfile then
        pcall(function()
            local d = readfile("Unpatchabomb_Weird.json")
            if d then WeirdWords = HttpService:JSONDecode(d) end
        end)
    end
end
LoadWeird()

local function SaveData()
    if writefile then
        pcall(function()
            writefile("Unpatchabomb_Whitelist.json", HttpService:JSONEncode(CustomWhitelist))
        end)
    end
end

local function LoadData()
    if readfile then
        pcall(function()
            local wlData = readfile("Unpatchabomb_Whitelist.json")
            if wlData then CustomWhitelist = HttpService:JSONDecode(wlData) end
        end)
    end
end

LoadData()

local uselessMap = {}
local function ReloadDictionary()
    WordText.Text = "Loading dictionary..."
    WORDS = {}
    IDA_alreadyUsed = {}
    
    for _, child in ipairs(SuggestionList:GetChildren()) do
        if not child:IsA("UIListLayout") then
            child:Destroy()
        end
    end

    task.spawn(function()
        local urls = {
            "https://raw.githubusercontent.com/artzified/WordBombDictionary/refs/heads/main/words.txt",
        }

        local loadedCount = 0
        
        for _, url in ipairs(urls) do
            local fetchSuccess, result = pcall(function()
                return game:HttpGet(url)
            end)

            if fetchSuccess and result then
                local loopIterations = 0
                for word in string.gmatch(result, "[^\r\n]+") do
                    loopIterations = loopIterations + 1
                    
                    if loopIterations % 5000 == 0 then 
                        task.wait() 
                    end
                    
                    if #word >= 3 then
                        local cleanWord = string.lower(word)
                        if not uselessMap[cleanWord] then
                            table.insert(WORDS, cleanWord)
                            loadedCount = loadedCount + 1
                        end
                    end
                end
            end
        end
        
        if loadedCount > 0 then
            for w, _ in pairs(CustomWhitelist) do
                if not table.find(WORDS, w) then
                    table.insert(WORDS, w)
                end
            end
            
            WordText.Text = "Loaded " .. #WORDS .. " words."
            if lastQuery ~= "" then updateSuggestions(lastQuery) end
            if UpdateUsedMenuVisuals then UpdateUsedMenuVisuals() end
        else
            WordText.Text = "Failed to fetch dictionary."
        end
    end)
end

DelayBox.FocusLost:Connect(function()
    local newDelay = tonumber(DelayBox.Text)
    if newDelay then
        currentTypeDelay = newDelay
        DelayBox.Text = tostring(newDelay)
    else
        DelayBox.Text = tostring(currentTypeDelay)
    end
end)

ReloadBtn.MouseButton1Click:Connect(ReloadDictionary)

local function CreateListMenu(titleText)
    local Menu = Instance.new("Frame")
    Menu.Name = titleText.."Menu"
    Menu.Parent = MainFrame
    Menu.Size = UDim2.new(1, 0, 1, 0)
    Menu.BackgroundColor3 = THEME.Background
    Menu.ZIndex = 10
    Menu.Visible = false
    
    local Title = Instance.new("TextLabel", Menu)
    Title.Size = UDim2.new(0.8, 0, 0.15, 0)
    Title.BackgroundTransparency = 1
    Title.Text = titleText .. " MENU"
    Title.Font = Enum.Font.GothamBold
    Title.TextColor3 = THEME.Text
    Title.TextSize = 14
    Title.ZIndex = 11
    
    local CloseBtn = Instance.new("TextButton", Menu)
    CloseBtn.Size = UDim2.new(0.2, 0, 0.15, 0)
    CloseBtn.Position = UDim2.new(0.8, 0, 0, 0)
    CloseBtn.BackgroundColor3 = THEME.ItemBG
    CloseBtn.Text = "CLOSE"
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextColor3 = THEME.Text
    CloseBtn.TextSize = 12
    CloseBtn.BorderSizePixel = 0
    CloseBtn.ZIndex = 11
    
    local InputBox = Instance.new("TextBox", Menu)
    InputBox.Size = UDim2.new(0.5, 0, 0.1, 0)
    InputBox.Position = UDim2.new(0.05, 0, 0.18, 0)
    InputBox.BackgroundColor3 = THEME.ItemBG
    InputBox.TextColor3 = THEME.Text
    InputBox.PlaceholderText = "Type word here..."
    InputBox.Font = Enum.Font.Gotham
    InputBox.TextSize = 12
    InputBox.BorderSizePixel = 0
    InputBox.ZIndex = 11
    InputBox.ClearTextOnFocus = false
    
    local AddBtn = Instance.new("TextButton", Menu)
    AddBtn.Size = UDim2.new(0.2, 0, 0.1, 0)
    AddBtn.Position = UDim2.new(0.55, 0, 0.18, 0)
    AddBtn.BackgroundColor3 = THEME.ItemBG
    AddBtn.Text = "ADD"
    AddBtn.Font = Enum.Font.GothamBold
    AddBtn.TextColor3 = THEME.Success
    AddBtn.TextSize = 12
    AddBtn.BorderSizePixel = 0
    AddBtn.ZIndex = 11

    local CopyBtn = Instance.new("TextButton", Menu)
    CopyBtn.Size = UDim2.new(0.2, 0, 0.1, 0)
    CopyBtn.Position = UDim2.new(0.75, 0, 0.18, 0)
    CopyBtn.BackgroundColor3 = THEME.ItemBG
    CopyBtn.Text = "COPY"
    CopyBtn.Font = Enum.Font.GothamBold
    CopyBtn.TextColor3 = THEME.Accent
    CopyBtn.TextSize = 12
    CopyBtn.BorderSizePixel = 0
    CopyBtn.ZIndex = 11

    
    local ScrollList = Instance.new("ScrollingFrame", Menu)
    ScrollList.Size = UDim2.new(0.9, 0, 0.65, 0)
    ScrollList.Position = UDim2.new(0.05, 0, 0.32, 0)
    ScrollList.BackgroundColor3 = THEME.Background
    ScrollList.BorderSizePixel = 0
    ScrollList.ScrollBarThickness = 4
    ScrollList.ZIndex = 11
    
    local Layout = Instance.new("UIListLayout", ScrollList)
    Layout.Padding = UDim.new(0, 2)
    
    CloseBtn.MouseButton1Click:Connect(function()
        Menu.Visible = false
    end)
    
    return Menu, InputBox, AddBtn, CopyBtn, ScrollList
end

local WLMenu, WLInput, WLAdd, WLCopy, WLList = CreateListMenu("WHITELIST")
local UsedMenu, UsedInput, UsedAdd, UsedCopy, UsedList = CreateListMenu("USED")

local function UpdateMenuVisuals(listUI, mapData, isWhitelist)
    for _, c in ipairs(listUI:GetChildren()) do
        if not c:IsA("UIListLayout") then c:Destroy() end
    end
    
    local ySize = 0
    for w, _ in pairs(mapData) do
        local Item = Instance.new("Frame", listUI)
        Item.Size = UDim2.new(1, 0, 0, 30)
        Item.BackgroundColor3 = THEME.ItemBG
        Item.BorderSizePixel = 0
        Item.ZIndex = 12
        
        local Lbl = Instance.new("TextLabel", Item)
        Lbl.Size = UDim2.new(0.75, 0, 1, 0)
        Lbl.BackgroundTransparency = 1
        Lbl.Text = " " .. string.upper(w)
        Lbl.Font = Enum.Font.Gotham
        Lbl.TextColor3 = THEME.Text
        Lbl.TextSize = 12
        Lbl.TextXAlignment = Enum.TextXAlignment.Left
        Lbl.ZIndex = 12
        
        local DelBtn = Instance.new("TextButton", Item)
        DelBtn.Size = UDim2.new(0.25, 0, 1, 0)
        DelBtn.Position = UDim2.new(0.75, 0, 0, 0)
        DelBtn.BackgroundColor3 = THEME.Slider
        DelBtn.Text = "✕"
        DelBtn.Font = Enum.Font.GothamBold
        DelBtn.TextColor3 = THEME.Text
        DelBtn.TextSize = 18
        DelBtn.BorderSizePixel = 0
        DelBtn.ZIndex = 12
        
        DelBtn.MouseButton1Click:Connect(function()
            mapData[w] = nil
            if isWhitelist then
                local idx = table.find(WORDS, w)
                if idx then table.remove(WORDS, idx) end
            end
            SaveData() 
            UpdateMenuVisuals(listUI, mapData, isWhitelist)
            if lastQuery ~= "" then updateSuggestions(lastQuery) end
        end)
        
        ySize = ySize + 32
    end
    listUI.CanvasSize = UDim2.new(0, 0, 0, ySize)
end

UpdateMenuVisuals(WLList, CustomWhitelist, true)

UpdateUsedMenuVisuals = function()
    for _, c in ipairs(UsedList:GetChildren()) do
        if not c:IsA("UIListLayout") then c:Destroy() end
    end
    
    local ySize = 0
    for _, w in ipairs(IDA_alreadyUsed) do
        local Item = Instance.new("Frame", UsedList)
        Item.Size = UDim2.new(1, 0, 0, 30)
        Item.BackgroundColor3 = THEME.ItemBG
        Item.BorderSizePixel = 0
        Item.ZIndex = 12
        
        local Lbl = Instance.new("TextLabel", Item)
        Lbl.Size = UDim2.new(0.75, 0, 1, 0)
        Lbl.BackgroundTransparency = 1
        Lbl.Text = " " .. string.upper(w)
        Lbl.Font = Enum.Font.Gotham
        Lbl.TextColor3 = THEME.Text
        Lbl.TextSize = 12
        Lbl.TextXAlignment = Enum.TextXAlignment.Left
        Lbl.ZIndex = 12
        
        local DelBtn = Instance.new("TextButton", Item)
        DelBtn.Size = UDim2.new(0.25, 0, 1, 0)
        DelBtn.Position = UDim2.new(0.75, 0, 0, 0)
        DelBtn.BackgroundColor3 = THEME.Slider
        DelBtn.Text = "✕"
        DelBtn.Font = Enum.Font.GothamBold
        DelBtn.TextColor3 = THEME.Text
        DelBtn.TextSize = 18
        DelBtn.BorderSizePixel = 0
        DelBtn.ZIndex = 12
        
        DelBtn.MouseButton1Click:Connect(function()
            local idx = table.find(IDA_alreadyUsed, w)
            if idx then table.remove(IDA_alreadyUsed, idx) end
            UpdateUsedMenuVisuals()
            if lastQuery ~= "" then updateSuggestions(lastQuery) end
        end)
        
        ySize = ySize + 32
    end
    UsedList.CanvasSize = UDim2.new(0, 0, 0, ySize)
end

UpdateUsedMenuVisuals()

WhitelistBtn.MouseButton1Click:Connect(function()
    WLMenu.Visible = true
    UsedMenu.Visible = false
    UpdateMenuVisuals(WLList, CustomWhitelist, true)
end)

UsedBtn.MouseButton1Click:Connect(function()
    UsedMenu.Visible = true
    WLMenu.Visible = false
    UpdateUsedMenuVisuals()
end)

WLCopy.MouseButton1Click:Connect(function()
    local wlWords = {}
    for w, _ in pairs(CustomWhitelist) do table.insert(wlWords, w) end
    if setclipboard then
        setclipboard(table.concat(wlWords, "\n"))
        WLCopy.Text = "COPIED!"
        task.delay(1, function() WLCopy.Text = "COPY" end)
    end
end)

UsedCopy.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(table.concat(IDA_alreadyUsed, "\n"))
        UsedCopy.Text = "COPIED!"
        task.delay(1, function() UsedCopy.Text = "COPY" end)
    end
end)

WLAdd.MouseButton1Click:Connect(function()
    local w = string.lower(string.gsub(WLInput.Text, "%s+", ""))
    if w ~= "" and not CustomWhitelist[w] then
        CustomWhitelist[w] = true
        if not table.find(WORDS, w) then
            table.insert(WORDS, w)
        end
        SaveData() 
        WLInput.Text = ""
        UpdateMenuVisuals(WLList, CustomWhitelist, true)
        if lastQuery ~= "" then updateSuggestions(lastQuery) end
    end
end)

UsedAdd.MouseButton1Click:Connect(function()
    local w = string.lower(string.gsub(UsedInput.Text, "%s+", ""))
    if w ~= "" and not table.find(IDA_alreadyUsed, w) then
        table.insert(IDA_alreadyUsed, w)
        UsedInput.Text = ""
        UpdateUsedMenuVisuals()
        if lastQuery ~= "" then updateSuggestions(lastQuery) end
    end
end)

ReloadDictionary()

local SpecialKeys = {
    ["-"] = Enum.KeyCode.Minus,
    ["'"] = Enum.KeyCode.Quote,
    ["."] = Enum.KeyCode.Period,
    [","] = Enum.KeyCode.Comma,
    [" "] = Enum.KeyCode.Space
}

local function SimulateKey(char)
    local ok = pcall(function()
        VirtualInputManager:SendTextInput(char)
    end)
    if not ok then
        local key = SpecialKeys[char]
        if not key then
            pcall(function() key = Enum.KeyCode[char:upper()] end)
        end
        if key then
            pcall(function()
                VirtualInputManager:SendKeyEvent(true,  key, false, game)
                VirtualInputManager:SendKeyEvent(false, key, false, game)
            end)
        end
    end
end

local function IDA_autoType(word)
    if not word or word == "" then return end

    local ok = pcall(function()
        VirtualInputManager:SendTextInput(word)
    end)

    -- Fallback: per-char with no waits
    if not ok then
        for i = 1, #word do
            SimulateKey(word:sub(i, i))
            if currentTypeDelay > 0 then
                task.wait(currentTypeDelay)
            end
        end
    end

    pcall(function()
        VirtualInputManager:SendKeyEvent(true,  Enum.KeyCode.Return, false, game)
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
    end)
end

local categories = {"LONG", "SHORT", "RANDOM"}
local currentCatIndex = 1

CategoryBtn.MouseButton1Click:Connect(function()
    currentCatIndex = currentCatIndex + 1
    if currentCatIndex > #categories then currentCatIndex = 1 end
    
    local mode = categories[currentCatIndex]
    local color = THEME.Text
    
    if mode == "LONG" then color = THEME.Accent
    elseif mode == "SHORT" then color = THEME.Warning
    elseif mode == "RANDOM" then color = THEME.Accent end
    
    CategoryBtn.Text = "Category: " .. mode .. " WORDS"
    CategoryBtn.TextColor3 = color
    
    if lastQuery ~= "" then
        updateSuggestions(lastQuery)
    end
end)

local function IDA_tableItemExists(array, val)
    for i, v in ipairs(array) do
        if v == val then return true end
    end
    return false
end

updateSuggestions = function(query)
    query = string.lower(query)
    lastQuery = query
    
    for _, child in ipairs(SuggestionList:GetChildren()) do
        if not child:IsA("UIListLayout") then
            child:Destroy()
        end
    end

    if query == "" then 
        WordText.Text = "Waiting for input..."
        return 
    end

    WordText.Text = "Searching for: " .. query

    local matches = {}
    for _, w in ipairs(WORDS) do
        if string.find(w, query, 1, true) and not IDA_tableItemExists(IDA_alreadyUsed, w) then
            table.insert(matches, w)
        end
    end

    local mode = categories[currentCatIndex]

    if mode == "LONG" then
        table.sort(matches, function(a, b) return #a > #b end)
    elseif mode == "SHORT" then
        table.sort(matches, function(a, b) return #a < #b end)
        elseif mode == "RANDOM" then
        -- Priority: manually-added Weird Words first (authorized only)
        local weird, rest = {}, {}
        for _, w in ipairs(matches) do
            if WeirdWords[w] then
                table.insert(weird, w)
            else
                table.insert(rest, w)
            end
        end
        -- shuffle each bucket
        for i = #weird, 2, -1 do local j = math.random(i); weird[i], weird[j] = weird[j], weird[i] end
        for i = #rest, 2, -1 do local j = math.random(i); rest[i], rest[j] = rest[j], rest[i] end
        matches = {}
                for _, w in ipairs(weird) do table.insert(matches, w) end
        for _, w in ipairs(rest)  do table.insert(matches, w) end
    end
    local ySize = 0
    local limit = math.min(100, #matches)
    
    if limit == 0 then
        WordText.Text = "No valid words found."
        return
    else
        WordText.Text = "Found " .. #matches .. " words (Showing Top " .. limit .. ")"
    end

      for i = 1, limit do
        local word = matches[i]
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 0, 25)
        btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        btn.BackgroundTransparency = 0.45
        btn.Text = string.upper(word) .. " (" .. #word .. ")"
        btn.TextColor3 = THEME.Text
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 12
        btn.BorderSizePixel = 0
        btn.Parent = SuggestionList

        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 6)
        btnCorner.Parent = btn

        local btnStroke = Instance.new("UIStroke")
        btnStroke.Color = Color3.fromRGB(0, 0, 0)
        btnStroke.Transparency = 0.2
        btnStroke.Thickness = 1
        btnStroke.Parent = btn

        btn.MouseButton1Click:Connect(function()
            btn.BackgroundColor3 = THEME.Success
            btn.Text = "TYPING..."
            table.insert(IDA_alreadyUsed, word)
            UpdateUsedMenuVisuals()
            
            task.spawn(function()
                IDA_autoType(word)
                if btn.Parent then btn:Destroy() end
            end)
        end)

        ySize = ySize + 27
    end
    
    SuggestionList.CanvasSize = UDim2.new(0, 0, 0, ySize)
end

LetterBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local sanitized = string.gsub(LetterBox.Text, "%s+", "")
        updateSuggestions(sanitized)
    end
end)

AutoBtn.MouseButton1Click:Connect(function()
    autoGetEnabled = not autoGetEnabled
    if autoGetEnabled then
        AutoBtn.Text = "AUTO: ON"
        AutoBtn.TextColor3 = THEME.Success
    else
        AutoBtn.Text = "AUTO: OFF"
        AutoBtn.TextColor3 = THEME.Text
    end
end)

local combined = ""

local function isLetterLabel(inst)
    if not inst:IsA("TextLabel") then return false end
    if not inst.Visible then return false end
    local p = inst.Parent
    while p and p ~= game do
        if p:IsA("GuiObject") and not p.Visible then return false end
        p = p.Parent
    end
    local t = inst.Text
    if type(t) ~= "string" then return false end
    if #t ~= 1 then return false end
    if t:match("%u") or t == "-" or t == "'" then return true end
    return false
end

local function GetGameLetters()
    local screenGui = Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenGui")
    if not screenGui then return combined end

    local live = {}
    for _, d in ipairs(screenGui:GetDescendants()) do
        if isLetterLabel(d) then
            live[#live + 1] = d
        end
    end

    table.sort(live, function(a, b)
        local ax, bx = a.AbsolutePosition.X, b.AbsolutePosition.X
        if math.abs(ax - bx) > 1 then return ax < bx end
        return a.AbsolutePosition.Y < b.AbsolutePosition.Y
    end)

    local buf = {}
    for i = 1, #live do
        buf[i] = live[i].Text
    end
    combined = table.concat(buf)
    combined = combined:gsub("^[%-']+", ""):gsub("[%-']+$", "")
    return combined
end
    
task.spawn(function()
    while task.wait(0.3) do
        if autoGetEnabled then
            local newLetters = GetGameLetters()
            newLetters = string.gsub(newLetters, "%s+", "") 
            
            if newLetters ~= "" and string.lower(newLetters) ~= string.lower(lastQuery) then
                LetterBox.Text = newLetters
                updateSuggestions(newLetters)
            end
        end
    end
end)


local function makeCorner(inst, r)
    local c = Instance.new("UICorner"); c.CornerRadius = UDim.new(0, r or 4); c.Parent = inst; return c
end

local function BuildSecretGui()
    if SecretGui then SecretGui:Destroy() end

    SecretGui = Instance.new("ScreenGui")
    SecretGui.Name = "Unpatchabomb_Secret"
    SecretGui.ResetOnSpawn = false
    SecretGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    local ok = pcall(function() SecretGui.Parent = CoreGui end)
    if not ok then SecretGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui") end

    local frame = Instance.new("Frame")
    frame.Name = "SecretFrame"
    frame.Parent = SecretGui
    frame.BackgroundColor3 = THEME.Background
    frame.BorderSizePixel = 0
    frame.Position = UDim2.new(0, 420, 0, 100)
    frame.Size = UDim2.new(0, 305, 0, 420)

    local scale = Instance.new("UIScale"); scale.Parent = frame; scale.Scale = 1

    local top = Instance.new("Frame")
    top.Parent = frame
    top.BackgroundColor3 = THEME.Background
    top.BorderSizePixel = 0
    top.Size = UDim2.new(1, 0, 0, 28)

    local accent = Instance.new("Frame")
    accent.Parent = top
    accent.BackgroundColor3 = THEME.Accent
    accent.BorderSizePixel = 0
    accent.Position = UDim2.new(0, 0, 1, -1)
    accent.Size = UDim2.new(1, 0, 0, 1)

    local t1 = Instance.new("TextLabel", top)
    t1.BackgroundTransparency = 1
    t1.Position = UDim2.new(0.01, 0, 0, 0)
    t1.Size = UDim2.new(0.25, 0, 1, 0)
    t1.Font = Enum.Font.GothamBold
    t1.Text = "UNPATCHA"
    t1.TextColor3 = THEME.Text
    t1.TextSize = 14
    t1.TextXAlignment = Enum.TextXAlignment.Right

    local t2 = Instance.new("TextLabel", top)
    t2.BackgroundTransparency = 1
    t2.Position = UDim2.new(0.26, 0, 0, 0)
    t2.Size = UDim2.new(0.5, 0, 1, 0)
    t2.Font = Enum.Font.Gotham
    t2.Text = "RANDOM (SECRET)"
    t2.TextColor3 = THEME.SubText
    t2.TextSize = 14
    t2.TextXAlignment = Enum.TextXAlignment.Left

    local closeX = Instance.new("TextButton", top)
    closeX.AnchorPoint = Vector2.new(1, 0)
    closeX.Position = UDim2.new(1, -4, 0, 2)
    closeX.Size = UDim2.new(0, 24, 0, 24)
    closeX.BackgroundColor3 = THEME.ItemBG
    closeX.Text = "X"
    closeX.Font = Enum.Font.GothamBold
    closeX.TextColor3 = THEME.Text
    closeX.TextSize = 14
    closeX.BorderSizePixel = 0
    makeCorner(closeX, 4)
    closeX.MouseButton1Click:Connect(function() SecretGui.Enabled = false end)

    local body = Instance.new("Frame")
    body.Parent = frame
    body.BackgroundColor3 = THEME.Background
    body.BorderSizePixel = 0
    body.Position = UDim2.new(0, 0, 0, 28)
    body.Size = UDim2.new(1, 0, 1, -28)

    local countLabel = Instance.new("TextLabel", body)
    countLabel.BackgroundTransparency = 1
    countLabel.Position = UDim2.new(0.02, 0, 0.02, 0)
    countLabel.Size = UDim2.new(0.5, 0, 0.07, 0)
    countLabel.Font = Enum.Font.GothamBold
    countLabel.Text = "Randomizers: " .. randCount
    countLabel.TextColor3 = THEME.Accent
    countLabel.TextSize = 12
    countLabel.TextXAlignment = Enum.TextXAlignment.Left

    local minus = Instance.new("TextButton", body)
    minus.Position = UDim2.new(0.52, 0, 0.02, 0)
    minus.Size = UDim2.new(0.1, 0, 0.07, 0)
    minus.BackgroundColor3 = THEME.ItemBG
    minus.Text = "−"
    minus.Font = Enum.Font.GothamBold
    minus.TextColor3 = THEME.Text
    minus.TextSize = 14
    minus.BorderSizePixel = 0
    makeCorner(minus)

    local plus = Instance.new("TextButton", body)
    plus.Position = UDim2.new(0.63, 0, 0.02, 0)
    plus.Size = UDim2.new(0.1, 0, 0.07, 0)
    plus.BackgroundColor3 = THEME.ItemBG
    plus.Text = "+"
    plus.Font = Enum.Font.GothamBold
    plus.TextColor3 = THEME.Text
    plus.TextSize = 14
    plus.BorderSizePixel = 0
    makeCorner(plus)

    local rerollAll = Instance.new("TextButton", body)
    rerollAll.Position = UDim2.new(0.75, 0, 0.02, 0)
    rerollAll.Size = UDim2.new(0.23, 0, 0.07, 0)
    rerollAll.BackgroundColor3 = THEME.ItemBG
    rerollAll.Text = "REROLL ALL"
    rerollAll.Font = Enum.Font.GothamBold
    rerollAll.TextColor3 = THEME.Success
    rerollAll.TextSize = 11
    rerollAll.BorderSizePixel = 0
    makeCorner(rerollAll)

    local list = Instance.new("ScrollingFrame", body)
    list.Position = UDim2.new(0.02, 0, 0.11, 0)
    list.Size = UDim2.new(0.96, 0, 0.87, 0)
    list.BackgroundColor3 = THEME.Background
    list.BorderSizePixel = 0
    list.ScrollBarThickness = 4
    list.CanvasSize = UDim2.new(0, 0, 0, 0)

    local layout = Instance.new("UIListLayout", list)
    layout.Padding = UDim.new(0, 2)
    layout.SortOrder = Enum.SortOrder.LayoutOrder

    local activeWords = {}   -- slotIndex -> word

    local function pickRandom(exclude)
        if #WORDS == 0 then return nil end
        local excludeSet = {}
        for _, w in pairs(exclude) do excludeSet[w] = true end
        for _ = 1, 50 do
            local w = WORDS[math.random(#WORDS)]
            if not excludeSet[w] then return w end
        end
        return WORDS[math.random(#WORDS)] -- fallback
    end

    local refreshList -- forward decl

    local function makeSlot(i)
        local item = Instance.new("Frame", list)
        item.Name = "Slot" .. i
        item.Size = UDim2.new(1, 0, 0, 46)
        item.BackgroundColor3 = THEME.ItemBG
        item.BorderSizePixel = 0
        item.LayoutOrder = i
        makeCorner(item, 4)

        local lbl = Instance.new("TextLabel", item)
        lbl.Position = UDim2.new(0, 6, 0, 2)
        lbl.Size = UDim2.new(0.6, 0, 0.5, 0)
        lbl.BackgroundTransparency = 1
        lbl.Font = Enum.Font.GothamBold
        lbl.TextColor3 = THEME.Text
        lbl.TextSize = 13
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.Text = ""

        local addBtn = Instance.new("TextButton", item)
        addBtn.Position = UDim2.new(0.62, 0, 0, 4)
        addBtn.Size = UDim2.new(0.18, 0, 0, 18)
        addBtn.BackgroundColor3 = THEME.Slider
        addBtn.Text = "ADD?"
        addBtn.Font = Enum.Font.GothamBold
        addBtn.TextColor3 = THEME.Success
        addBtn.TextSize = 10
        addBtn.BorderSizePixel = 0
        makeCorner(addBtn, 3)

        local xBtn = Instance.new("TextButton", item)
        xBtn.Position = UDim2.new(0.81, 0, 0, 4)
        xBtn.Size = UDim2.new(0.08, 0, 0, 18)
        xBtn.BackgroundColor3 = THEME.Slider
        xBtn.Text = "✕"
        xBtn.Font = Enum.Font.GothamBold
        xBtn.TextColor3 = THEME.Text
        xBtn.TextSize = 12
        xBtn.BorderSizePixel = 0
        makeCorner(xBtn, 3)

        local reBtn = Instance.new("TextButton", item)
        reBtn.Position = UDim2.new(0.9, 0, 0, 4)
        reBtn.Size = UDim2.new(0.08, 0, 0, 18)
        reBtn.BackgroundColor3 = THEME.Slider
        reBtn.Text = "↻"
        reBtn.Font = Enum.Font.GothamBold
        reBtn.TextColor3 = THEME.Accent
        reBtn.TextSize = 12
        reBtn.BorderSizePixel = 0
        makeCorner(reBtn, 3)

        local tag = Instance.new("TextLabel", item)
        tag.Position = UDim2.new(0, 6, 0, 24)
        tag.Size = UDim2.new(0.9, 0, 0, 18)
        tag.BackgroundTransparency = 1
        tag.Font = Enum.Font.Gotham
        tag.TextColor3 = THEME.SubText
        tag.TextSize = 10
        tag.TextXAlignment = Enum.TextXAlignment.Left
        tag.Text = ""

        xBtn.MouseButton1Click:Connect(function()
            activeWords[i] = nil
            item:Destroy()
            secretSlots[i] = nil
        end)

        reBtn.MouseButton1Click:Connect(function()
            local exclude = {}
            for idx, w in pairs(activeWords) do if idx ~= i then exclude[w] = true end end
            local w = pickRandom(exclude)
            if not w then return end
            activeWords[i] = w
            lbl.Text = string.upper(w)
            tag.Text = WeirdWords[w] and "★ Weird Word (priority)" or ""
        end)

    
        addBtn.MouseButton1Click:Connect(function()
            if not IS_AUTHORIZED then
                addBtn.Text = "DENIED"
                addBtn.TextColor3 = Color3.fromRGB(255, 90, 90)
                task.delay(1.2, function()
                    addBtn.Text = "ADD?"
                    addBtn.TextColor3 = THEME.Success
                end)
                return
            end
            local w = activeWords[i]
            if w and not WeirdWords[w] then
                WeirdWords[w] = true
                if not table.find(WORDS, w) then table.insert(WORDS, w) end
                SaveWeird()
                addBtn.Text = "ADDED ✓"
                addBtn.TextColor3 = THEME.Accent
                tag.Text = "★ Weird Word (priority)"
                if lastQuery ~= "" then updateSuggestions(lastQuery) end
            end
        end)

        return item, lbl, tag
    end

    refreshList = function()
        for _, c in ipairs(list:GetChildren()) do
            if not c:IsA("UIListLayout") then c:Destroy() end
        end
        secretSlots = {}
        activeWords = {}

        randCount = math.clamp(randCount, MIN_RAND, MAX_RAND)
        countLabel.Text = "Randomizers: " .. randCount

        for i = 1, randCount do
            local item, lbl, tag = makeSlot(i)
            local exclude = {}
            for _, w in pairs(activeWords) do exclude[w] = true end
            local w = pickRandom(exclude)
            if w then
                activeWords[i] = w
                lbl.Text = string.upper(w)
                tag.Text = WeirdWords[w] and "★ Weird Word (priority)" or ""
            end
            secretSlots[i] = item
        end

        local h = 0
        for _, c in ipairs(list:GetChildren()) do
            if c:IsA("Frame") then h = h + c.AbsoluteSize.Y + 2 end
        end
        list.CanvasSize = UDim2.new(0, 0, 0, randCount * 48 + 4)
    end

    minus.MouseButton1Click:Connect(function()
        randCount = math.clamp(randCount - 1, MIN_RAND, MAX_RAND)
        refreshList()
    end)

    plus.MouseButton1Click:Connect(function()
        randCount = math.clamp(randCount + 1, MIN_RAND, MAX_RAND)
        refreshList()
    end)

    rerollAll.MouseButton1Click:Connect(function()
        refreshList()
    end)

    local dragging, dragStart, startPos
    top.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    if #WORDS == 0 then
        task.spawn(function()
            while #WORDS == 0 do task.wait(0.5) end
            refreshList()
        end)
    else
        refreshList()
    end
    end

do
    local holdTime = 0.7
    local holding = false
    local holdStart = 0

    T2.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton2 then
            BuildSecretGui()
            SecretGui.Enabled = true
        elseif input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            holding = true
            holdStart = tick()
            task.spawn(function()
                task.wait(holdTime)
                if holding and (tick() - holdStart) >= holdTime then
                    holding = false
                    BuildSecretGui()
                    SecretGui.Enabled = true
                end
            end)
        end
    end)

    T2.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            holding = false
        end
    end)
    end
    
