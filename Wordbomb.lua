local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")

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

-- New Buttons
local WhitelistBtn = Instance.new("TextButton")
local BlacklistBtn = Instance.new("TextButton")

-- Setup GUI
Unpatchabomb.Name = "Unpatchabomb"
local success = pcall(function() Unpatchabomb.Parent = CoreGui end)
if not success then Unpatchabomb.Parent = Players.LocalPlayer:WaitForChild("PlayerGui") end
Unpatchabomb.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Unpatchabomb.ResetOnSpawn = false

UnpatchabombFrame.Name = "UnpatchabombFrame"
UnpatchabombFrame.Parent = Unpatchabomb
UnpatchabombFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UnpatchabombFrame.BackgroundTransparency = 1.000
UnpatchabombFrame.BorderSizePixel = 0
UnpatchabombFrame.Position = UDim2.new(0, 100, 0, 100)
UnpatchabombFrame.Size = UDim2.new(0, 305, 0, 350)

TopFrame.Name = "TopFrame"
TopFrame.Parent = UnpatchabombFrame
TopFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
TopFrame.BorderSizePixel = 0
TopFrame.Size = UDim2.new(1, 0, 0, 28)

T1.Name = "T1"
T1.Parent = TopFrame
T1.BackgroundTransparency = 1.000
T1.Position = UDim2.new(0.01, 0, 0, 0)
T1.Size = UDim2.new(0.25, 0, 1, 0)
T1.Font = Enum.Font.GothamBold
T1.Text = "UNPATCHA"
T1.TextColor3 = Color3.fromRGB(255, 255, 255)
T1.TextSize = 14.000
T1.TextXAlignment = Enum.TextXAlignment.Right

T2.Name = "T2"
T2.Parent = TopFrame
T2.BackgroundTransparency = 1.000
T2.Position = UDim2.new(0.26, 0, 0, 0)
T2.Size = UDim2.new(0.5, 0, 1, 0)
T2.Font = Enum.Font.Gotham
T2.Text = "BOMB (EN)"
T2.TextColor3 = Color3.fromRGB(255, 255, 255)
T2.TextSize = 14.000
T2.TextXAlignment = Enum.TextXAlignment.Left

MainFrame.Name = "MainFrame"
MainFrame.Parent = UnpatchabombFrame
MainFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0, 0, 0, 28)
MainFrame.Size = UDim2.new(1, 0, 1, -28)

LetterBox.Name = "LetterBox"
LetterBox.Parent = MainFrame
LetterBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
LetterBox.BorderColor3 = Color3.fromRGB(255, 255, 255)
LetterBox.BorderSizePixel = 0
LetterBox.Position = UDim2.new(0.02, 0, 0.05, 0)
LetterBox.Size = UDim2.new(0.66, 0, 0.12, 0)
LetterBox.Font = Enum.Font.GothamBold
LetterBox.Text = ""
LetterBox.PlaceholderText = "Letters (Press Enter)"
LetterBox.TextColor3 = Color3.fromRGB(255, 255, 255)
LetterBox.TextSize = 14.000
LetterBox.ClearTextOnFocus = false

AutoBtn.Name = "AutoBtn"
AutoBtn.Parent = MainFrame
AutoBtn.BackgroundColor3 = Color3.fromRGB(45, 35, 35)
AutoBtn.Position = UDim2.new(0.70, 0, 0.05, 0)
AutoBtn.Size = UDim2.new(0.28, 0, 0.12, 0)
AutoBtn.Font = Enum.Font.GothamBold
AutoBtn.Text = "AUTO: OFF"
AutoBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
AutoBtn.TextSize = 12.000

CategoryBtn.Name = "CategoryBtn"
CategoryBtn.Parent = MainFrame
CategoryBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
CategoryBtn.Position = UDim2.new(0.02, 0, 0.19, 0)
CategoryBtn.Size = UDim2.new(0.66, 0, 0.1, 0)
CategoryBtn.Font = Enum.Font.GothamBold
CategoryBtn.Text = "Category: LONG WORDS"
CategoryBtn.TextColor3 = Color3.fromRGB(0, 200, 255)
CategoryBtn.TextSize = 12.000

ReloadBtn.Name = "ReloadBtn"
ReloadBtn.Parent = MainFrame
ReloadBtn.BackgroundColor3 = Color3.fromRGB(45, 35, 35)
ReloadBtn.Position = UDim2.new(0.70, 0, 0.19, 0)
ReloadBtn.Size = UDim2.new(0.28, 0, 0.1, 0)
ReloadBtn.Font = Enum.Font.GothamBold
ReloadBtn.Text = "RELOAD"
ReloadBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
ReloadBtn.TextSize = 12.000

DelayBox.Name = "DelayBox"
DelayBox.Parent = MainFrame
DelayBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
DelayBox.BorderSizePixel = 0
DelayBox.Position = UDim2.new(0.02, 0, 0.31, 0)
DelayBox.Size = UDim2.new(0.96, 0, 0.08, 0)
DelayBox.Font = Enum.Font.GothamBold
DelayBox.Text = "0.035"
DelayBox.PlaceholderText = "Type Delay (e.g. 0.05)"
DelayBox.TextColor3 = Color3.fromRGB(0, 255, 150)
DelayBox.TextSize = 12.000
DelayBox.ClearTextOnFocus = false

WordText.Name = "WordText"
WordText.Parent = MainFrame
WordText.BackgroundTransparency = 1.000
WordText.Position = UDim2.new(0, 0, 0.41, 0)
WordText.Size = UDim2.new(1, 0, 0.08, 0)
WordText.Font = Enum.Font.GothamBold
WordText.Text = "Waiting for input..."
WordText.TextColor3 = Color3.fromRGB(255, 255, 255)
WordText.TextSize = 12.000

SuggestionList.Name = "SuggestionList"
SuggestionList.Parent = MainFrame
SuggestionList.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
SuggestionList.BorderSizePixel = 0
SuggestionList.Position = UDim2.new(0.02, 0, 0.51, 0)
SuggestionList.Size = UDim2.new(0.96, 0, 0.35, 0)
SuggestionList.ScrollBarThickness = 4

ListLayout.Parent = SuggestionList
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.Padding = UDim.new(0, 2)

WhitelistBtn.Name = "WhitelistBtn"
WhitelistBtn.Parent = MainFrame
WhitelistBtn.BackgroundColor3 = Color3.fromRGB(35, 45, 35)
WhitelistBtn.Position = UDim2.new(0.02, 0, 0.88, 0)
WhitelistBtn.Size = UDim2.new(0.47, 0, 0.1, 0)
WhitelistBtn.Font = Enum.Font.GothamBold
WhitelistBtn.Text = "WHITELIST"
WhitelistBtn.TextColor3 = Color3.fromRGB(100, 255, 100)
WhitelistBtn.TextSize = 12.000

BlacklistBtn.Name = "BlacklistBtn"
BlacklistBtn.Parent = MainFrame
BlacklistBtn.BackgroundColor3 = Color3.fromRGB(45, 35, 35)
BlacklistBtn.Position = UDim2.new(0.51, 0, 0.88, 0)
BlacklistBtn.Size = UDim2.new(0.47, 0, 0.1, 0)
BlacklistBtn.Font = Enum.Font.GothamBold
BlacklistBtn.Text = "BLACKLIST"
BlacklistBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
BlacklistBtn.TextSize = 12.000

-- Make GUI Draggable
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

-- ADD THIS LINE: Forward declare the function so earlier code can see it
local updateSuggestions 

-- Whitelist and Blacklist Maps & Saving Logic
local CustomWhitelist = {}
local CustomBlacklist = {}

local function SaveData()
    if writefile then
        pcall(function()
            writefile("Unpatchabomb_Whitelist.json", HttpService:JSONEncode(CustomWhitelist))
            writefile("Unpatchabomb_Blacklist.json", HttpService:JSONEncode(CustomBlacklist))
        end)
    end
end

local function LoadData()
    if readfile then
        pcall(function()
            local wlData = readfile("Unpatchabomb_Whitelist.json")
            if wlData then CustomWhitelist = HttpService:JSONDecode(wlData) end
        end)
        pcall(function()
            local blData = readfile("Unpatchabomb_Blacklist.json")
            if blData then CustomBlacklist = HttpService:JSONDecode(blData) end
        end)
    end
end

-- Load previously saved data on start
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
            "https://raw.githubusercontent.com/amazingtriton-ui/Test/refs/heads/main/Uvulopalatopharyngoplasty.lua",
        }

        local loadedCount = 0
        
        for _, url in ipairs(urls) do
            local fetchSuccess, result = pcall(function()
             return game:HttpGet(url)
                         
                    end)

            if fetchSuccess and result then
                for word in string.gmatch(result, "[^\r\n]+") do
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
            -- Re-inject whitelisted words upon reload
            for w, _ in pairs(CustomWhitelist) do
                if not table.find(WORDS, w) then
                    table.insert(WORDS, w)
                end
            end
            
            WordText.Text = "Loaded " .. #WORDS .. " words."
            if lastQuery ~= "" then updateSuggestions(lastQuery) end
        else
            WordText.Text = "Failed to load dictionaries."
        end
    end)


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

-- Menus Logic for Whitelist/Blacklist
local function CreateListMenu(titleText)
    local Menu = Instance.new("Frame")
    Menu.Name = titleText.."Menu"
    Menu.Parent = MainFrame
    Menu.Size = UDim2.new(1, 0, 1, 0)
    Menu.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    Menu.ZIndex = 10
    Menu.Visible = false
    
    local Title = Instance.new("TextLabel", Menu)
    Title.Size = UDim2.new(0.8, 0, 0.15, 0)
    Title.BackgroundTransparency = 1
    Title.Text = titleText .. " MENU"
    Title.Font = Enum.Font.GothamBold
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 14
    Title.ZIndex = 11
    
    local CloseBtn = Instance.new("TextButton", Menu)
    CloseBtn.Size = UDim2.new(0.2, 0, 0.15, 0)
    CloseBtn.Position = UDim2.new(0.8, 0, 0, 0)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    CloseBtn.Text = "CLOSE"
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.TextSize = 12
    CloseBtn.BorderSizePixel = 0
    CloseBtn.ZIndex = 11
    
        local InputBox = Instance.new("TextBox", Menu)
    InputBox.Size = UDim2.new(0.5, 0, 0.1, 0)
    InputBox.Position = UDim2.new(0.05, 0, 0.18, 0)
    InputBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    InputBox.PlaceholderText = "Type word here..."
    InputBox.Font = Enum.Font.Gotham
    InputBox.TextSize = 12
    InputBox.BorderSizePixel = 0
    InputBox.ZIndex = 11
    InputBox.ClearTextOnFocus = false
    
    local AddBtn = Instance.new("TextButton", Menu)
    AddBtn.Size = UDim2.new(0.2, 0, 0.1, 0)
    AddBtn.Position = UDim2.new(0.55, 0, 0.18, 0)
    AddBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
    AddBtn.Text = "ADD"
    AddBtn.Font = Enum.Font.GothamBold
    AddBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    AddBtn.TextSize = 12
    AddBtn.BorderSizePixel = 0
    AddBtn.ZIndex = 11

    local CopyBtn = Instance.new("TextButton", Menu)
    CopyBtn.Size = UDim2.new(0.2, 0, 0.1, 0)
    CopyBtn.Position = UDim2.new(0.75, 0, 0.18, 0)
    CopyBtn.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
    CopyBtn.Text = "COPY"
    CopyBtn.Font = Enum.Font.GothamBold
    CopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CopyBtn.TextSize = 12
    CopyBtn.BorderSizePixel = 0
    CopyBtn.ZIndex = 11

    
    local ScrollList = Instance.new("ScrollingFrame", Menu)
    ScrollList.Size = UDim2.new(0.9, 0, 0.65, 0)
    ScrollList.Position = UDim2.new(0.05, 0, 0.32, 0)
    ScrollList.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
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
local BLMenu, BLInput, BLAdd, BLCopy, BLList = CreateListMenu("BLACKLIST")

local function UpdateMenuVisuals(listUI, mapData, isWhitelist)
    for _, c in ipairs(listUI:GetChildren()) do
        if not c:IsA("UIListLayout") then c:Destroy() end
    end
    
    local ySize = 0
    for w, _ in pairs(mapData) do
        local Item = Instance.new("Frame", listUI)
        Item.Size = UDim2.new(1, 0, 0, 25)
        Item.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        Item.BorderSizePixel = 0
        Item.ZIndex = 12
        
        local Lbl = Instance.new("TextLabel", Item)
        Lbl.Size = UDim2.new(0.8, 0, 1, 0)
        Lbl.BackgroundTransparency = 1
        Lbl.Text = " " .. string.upper(w)
        Lbl.Font = Enum.Font.Gotham
        Lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
        Lbl.TextSize = 12
        Lbl.TextXAlignment = Enum.TextXAlignment.Left
        Lbl.ZIndex = 12
        
        local DelBtn = Instance.new("TextButton", Item)
        DelBtn.Size = UDim2.new(0.2, 0, 1, 0)
        DelBtn.Position = UDim2.new(0.8, 0, 0, 0)
        DelBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
        DelBtn.Text = "X"
        DelBtn.Font = Enum.Font.GothamBold
        DelBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        DelBtn.TextSize = 12
        DelBtn.BorderSizePixel = 0
        DelBtn.ZIndex = 12
        
        DelBtn.MouseButton1Click:Connect(function()
            mapData[w] = nil
            if isWhitelist then
                local idx = table.find(WORDS, w)
                if idx then table.remove(WORDS, idx) end
            end
            SaveData() -- Save after removal
            UpdateMenuVisuals(listUI, mapData, isWhitelist)
            if lastQuery ~= "" then updateSuggestions(lastQuery) end
        end)
        
        ySize = ySize + 27
    end
    listUI.CanvasSize = UDim2.new(0, 0, 0, ySize)
end

-- Populate initial lists if data was loaded
UpdateMenuVisuals(WLList, CustomWhitelist, true)
UpdateMenuVisuals(BLList, CustomBlacklist, false)

-- Open Menus
WhitelistBtn.MouseButton1Click:Connect(function()
    WLMenu.Visible = true
    BLMenu.Visible = false
    UpdateMenuVisuals(WLList, CustomWhitelist, true)
end)

BlacklistBtn.MouseButton1Click:Connect(function()
    BLMenu.Visible = true
    WLMenu.Visible = false
    UpdateMenuVisuals(BLList, CustomBlacklist, false)
end)

-- Copy Logic
WLCopy.MouseButton1Click:Connect(function()
    local wlWords = {}
    for w, _ in pairs(CustomWhitelist) do table.insert(wlWords, w) end
    if setclipboard then
        setclipboard(table.concat(wlWords, "\n"))
        WLCopy.Text = "COPIED!"
        task.delay(1, function() WLCopy.Text = "COPY" end)
    end
end)

BLCopy.MouseButton1Click:Connect(function()
    local blWords = {}
    for w, _ in pairs(CustomBlacklist) do table.insert(blWords, w) end
    if setclipboard then
        setclipboard(table.concat(blWords, "\n"))
        BLCopy.Text = "COPIED!"
        task.delay(1, function() BLCopy.Text = "COPY" end)
    end
end)


-- Add Logic
WLAdd.MouseButton1Click:Connect(function()
    local w = string.lower(string.gsub(WLInput.Text, "%s+", ""))
    if w ~= "" and not CustomWhitelist[w] then
        CustomWhitelist[w] = true
        if not table.find(WORDS, w) then
            table.insert(WORDS, w)
        end
        SaveData() -- Save after addition
        WLInput.Text = ""
        UpdateMenuVisuals(WLList, CustomWhitelist, true)
        if lastQuery ~= "" then updateSuggestions(lastQuery) end
    end
end)

BLAdd.MouseButton1Click:Connect(function()
    local w = string.lower(string.gsub(BLInput.Text, "%s+", ""))
    if w ~= "" and not CustomBlacklist[w] then
        CustomBlacklist[w] = true
        SaveData() -- Save after addition
        BLInput.Text = ""
        UpdateMenuVisuals(BLList, CustomBlacklist, false)
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
    local color = Color3.fromRGB(255, 255, 255)
    
    if mode == "LONG" then color = Color3.fromRGB(0, 200, 255)
    elseif mode == "SHORT" then color = Color3.fromRGB(255, 200, 0)
    elseif mode == "RANDOM" then color = Color3.fromRGB(150, 100, 255) end
    
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

    updateSuggestions(query)
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
        -- Skip if word is in Blacklist!
        if not CustomBlacklist[w] then
            if string.find(w, query, 1, true) and not IDA_tableItemExists(IDA_alreadyUsed, w) then
                table.insert(matches, w)
            end
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
        btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        btn.Text = string.upper(word) .. " (" .. #word .. ")"
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 12
        btn.Parent = SuggestionList

        btn.MouseButton1Click:Connect(function()
            btn.BackgroundColor3 = Color3.fromRGB(40, 150, 40)
            btn.Text = "TYPING..."
            table.insert(IDA_alreadyUsed, word)
            
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

-----------------------------------
-- AUTO GET LETTER LOGIC
-----------------------------------
AutoBtn.MouseButton1Click:Connect(function()
    autoGetEnabled = not autoGetEnabled
    if autoGetEnabled then
        AutoBtn.Text = "AUTO: ON"
        AutoBtn.TextColor3 = Color3.fromRGB(100, 255, 100)
    else
        AutoBtn.Text = "AUTO: OFF"
        AutoBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

local function GetGameLetters()
    local combinedLetters = ""
    pcall(function()
        local textFrame = Players.LocalPlayer.PlayerGui.GameUI.Container.GameSpace.DefaultUI.GameContainer.Mobile.MobileContainer.InfoFrame.TextFrame
        
        for _, child in ipairs(textFrame:GetChildren()) do
            if string.lower(child.Name) == "letterframe" and child.Visible == true then
                local letterHolder = child:FindFirstChild("Letter")
                if letterHolder then
                    local textLabel = letterHolder:FindFirstChild("TextLabel")
                    if textLabel and textLabel.Text then
                        combinedLetters = combinedLetters .. textLabel.Text
                    end
                end
            end
        end
    end)
    return combinedLetters
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
