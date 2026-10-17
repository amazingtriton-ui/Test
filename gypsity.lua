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
DelayBox.Text = "0.035"
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
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

local WORDS = {}
local IDA_alreadyUsed = {}
local autoGetEnabled = false
local currentTypeDelay = 0.035 
local lastQuery = ""

local updateSuggestions 
local UpdateUsedMenuVisuals

local CustomWhitelist = {}

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
        Item.Size = UDim2.new(1, 0, 0, 25)
        Item.BackgroundColor3 = THEME.ItemBG
        Item.BorderSizePixel = 0
        Item.ZIndex = 12
        
        local Lbl = Instance.new("TextLabel", Item)
        Lbl.Size = UDim2.new(0.8, 0, 1, 0)
        Lbl.BackgroundTransparency = 1
        Lbl.Text = " " .. string.upper(w)
        Lbl.Font = Enum.Font.Gotham
        Lbl.TextColor3 = THEME.Text
        Lbl.TextSize = 12
        Lbl.TextXAlignment = Enum.TextXAlignment.Left
        Lbl.ZIndex = 12
        
        local DelBtn = Instance.new("TextButton", Item)
        DelBtn.Size = UDim2.new(0.2, 0, 1, 0)
        DelBtn.Position = UDim2.new(0.8, 0, 0, 0)
        DelBtn.BackgroundColor3 = THEME.Slider
        DelBtn.Text = "X"
        DelBtn.Font = Enum.Font.GothamBold
        DelBtn.TextColor3 = THEME.Text
        DelBtn.TextSize = 12
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
        
        ySize = ySize + 27
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
        Item.Size = UDim2.new(1, 0, 0, 25)
        Item.BackgroundColor3 = THEME.ItemBG
        Item.BorderSizePixel = 0
        Item.ZIndex = 12
        
        local Lbl = Instance.new("TextLabel", Item)
        Lbl.Size = UDim2.new(0.8, 0, 1, 0)
        Lbl.BackgroundTransparency = 1
        Lbl.Text = " " .. string.upper(w)
        Lbl.Font = Enum.Font.Gotham
        Lbl.TextColor3 = THEME.Text
        Lbl.TextSize = 12
        Lbl.TextXAlignment = Enum.TextXAlignment.Left
        Lbl.ZIndex = 12
        
        local DelBtn = Instance.new("TextButton", Item)
        DelBtn.Size = UDim2.new(0.2, 0, 1, 0)
        DelBtn.Position = UDim2.new(0.8, 0, 0, 0)
        DelBtn.BackgroundColor3 = THEME.Slider
        DelBtn.Text = "X"
        DelBtn.Font = Enum.Font.GothamBold
        DelBtn.TextColor3 = THEME.Text
        DelBtn.TextSize = 12
        DelBtn.BorderSizePixel = 0
        DelBtn.ZIndex = 12
        
        DelBtn.MouseButton1Click:Connect(function()
            local idx = table.find(IDA_alreadyUsed, w)
            if idx then table.remove(IDA_alreadyUsed, idx) end
            UpdateUsedMenuVisuals()
            if lastQuery ~= "" then updateSuggestions(lastQuery) end
        end)
        
        ySize = ySize + 27
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
    local vimSuccess = pcall(function()
        VirtualInputManager:SendTextInput(char)
    end)
    
    if not vimSuccess then
        local key = SpecialKeys[char]
        
        if not key then
            pcall(function() key = Enum.KeyCode[char:upper()] end)
        end
        
        if key then
            pcall(function()
                VirtualInputManager:SendKeyEvent(true, key, false, game)
                task.wait(0.01)
                VirtualInputManager:SendKeyEvent(false, key, false, game)
            end)
        end
    end
end

local function IDA_autoType(word)
    if not word or word == "" then return end
    
    for i = 1, #word do
        local ch = word:sub(i, i)
        SimulateKey(ch)
        task.wait(currentTypeDelay)
    end
    
    task.wait(currentTypeDelay * 1.5)
    pcall(function()
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
        task.wait(0.015)
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
        for i = #matches, 2, -1 do
            local j = math.random(i)
            matches[i], matches[j] = matches[j], matches[i]
        end
    end

    local ySize = 0
    local limit = math.min(50, #matches)
    
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
        btn.BackgroundColor3 = THEME.ItemBG
        btn.Text = string.upper(word) .. " (" .. #word .. ")"
        btn.TextColor3 = THEME.Text
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 12
        btn.Parent = SuggestionList

        btn.MouseButton1Click:Connect(function()
            btn.BackgroundColor3 = THEME.Success
            btn.Text = "TYPING..."
            table.insert(IDA_alreadyUsed, word)
            UpdateUsedMenuVisuals()
            
            task.spawn(function()
                IDA_autoType(word)
                task.wait(0.5)
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
