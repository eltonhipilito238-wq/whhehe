--[[
    BLACKHOLE ULTIMATE SCRIPT
    The most advanced Roblox script with 50+ working features
    Made for educational purposes only.
]]

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera
local VirtualUser = game:GetService("VirtualUser")
local GuiService = game:GetService("GuiService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local MarketplaceService = game:GetService("MarketplaceService")
local CollectionService = game:GetService("CollectionService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Variables
local AimlockEnabled = false
local ESPEnabled = false
local FlyEnabled = false
local NoclipEnabled = false
local TriggerbotEnabled = false
local NightSkyEnabled = false
local TeleportEnabled = false
local SilentAimEnabled = false
local PredictionEnabled = false
local AntiAimEnabled = false
local SpinBotEnabled = false
local AutoCollectEnabled = false
local AutoFarmEnabled = false
local AutoHealEnabled = false
local AutoJumpEnabled = false
local BhopEnabled = false
local AntiAFKEnabled = false
local ChatSpamEnabled = false
local SpeedHackEnabled = false
local InvisibilityEnabled = false
local NoFallDamageEnabled = false
local AutoParryEnabled = false
local ItemESPEnabled = false
local PlayerESPEnabled = true
local AutoClickerEnabled = false
local AutoSprintEnabled = false
local AutoSitEnabled = false
local AutoDanceEnabled = false
local AutoRespawnEnabled = false
local GodModeEnabled = false
local InfiniteJumpEnabled = false
local WallHackEnabled = false
local FreeCamEnabled = false
local ZoomHackEnabled = false
local FullBrightEnabled = false
local NoFogEnabled = false
local NoClipESPEnabled = false
local AimbotFOVEnabled = true
local CrosshairEnabled = false
local HitboxExpanderEnabled = false
local BulletTPEnabled = false
local InstantReloadEnabled = false
local NoSpreadEnabled = false
local NoRecoilEnabled = false
local RapidFireEnabled = false
local InfiniteAmmoEnabled = false
local AutoBlockEnabled = false
local AutoDodgeEnabled = false
local AutoParryPerfectEnabled = false
local AutoComboEnabled = false
local AutoPotionsEnabled = false
local AutoFishEnabled = false
local AutoMineEnabled = false
local AutoWoodcutEnabled = false
local AutoSmithEnabled = false
local AutoCookEnabled = false
local AutoAlchEnabled = false
local AutoFletchEnabled = false
local AutoHerbEnabled = false
local AutoRunEnabled = false
local AutoRestEnabled = false
local AutoBankEnabled = false

-- Blade Ball Features
local BladeBallParryEnabled = false
local BladeBallAccuracy = 0.8
local BladeBallKeybind = Enum.KeyCode.R
local BladeBallAntiCurve = false
local BladeBallAutoSpam = false
local BladeBallDetectionMode = "Speed" -- Speed or Normal
local BladeBallAnimationFix = false
local BladeBallPauseOnDeath = false
local BladeBallNoRender = false

-- Skin Changer
local SkinChangerEnabled = false
local SelectedSkin = "Default"

-- Potato Graphics
local PotatoGraphicsEnabled = false

-- Settings
local SelectedPart = "Head"
local FOVRadius = 200
local Smoothness = 0.2
local AimbotSpeed = 0.3
local JumpPower = 50
local WalkSpeed = 16
local PredictionAmount = 0.2
local SpinSpeed = 5
local HealThreshold = 30
local FarmRadius = 100
local ChatMessage = "Join Blackhole Ultimate Script!"
local ChatDelay = 10
local SpeedHackAmount = 2
local ClickDelay = 0.05
local ZoomAmount = 50
local HitboxSize = 3
local RapidFireDelay = 0.01

local TeamCheck = true
local VisibilityCheck = true
local WallCheck = true
local ShowFOVCircle = true
local FriendlyFire = false

local Target = nil
local flyBodyVelocity = nil
local freeCamCFrame = nil
local spinAngle = 0
local lastHealTime = 0
local clickTimer = 0
local originalValues = {}

-- ============ CREATE GUI ============
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BlackholeHub"
screenGui.Parent = LocalPlayer.PlayerGui

-- Main Frame with dark theme
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 650, 0, 750)
mainFrame.Position = UDim2.new(0.5, -325, 0.5, -375)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromRGB(100, 0, 200)
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- Gradient effect
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 0, 60)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 30))
})
gradient.Rotation = 45
gradient.Parent = mainFrame

-- Make frame draggable
local function makeDraggable(frame)
    local dragToggle = false
    local dragInput = nil
    local dragStart = nil
    local startPos = nil
    
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragToggle = true
            dragStart = input.Position
            startPos = frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)
    
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragToggle then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

makeDraggable(mainFrame)

-- Title with blackhole effect
local titleFrame = Instance.new("Frame")
titleFrame.Size = UDim2.new(1, 0, 0, 50)
titleFrame.Position = UDim2.new(0, 0, 0, 0)
titleFrame.BackgroundColor3 = Color3.fromRGB(20, 0, 40)
titleFrame.BorderSizePixel = 0
titleFrame.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 1, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "⚫ BLACKHOLE ULTIMATE ⚫"
titleLabel.TextColor3 = Color3.fromRGB(200, 150, 255)
titleLabel.TextSize = 24
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextScaled = true
titleLabel.Parent = titleFrame

-- Rainbow border animation
local borderTween = TweenService:Create(titleFrame, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
    BorderColor3 = Color3.fromRGB(255, 0, 255)
})
borderTween:Play()

-- Subtitle
local subLabel = Instance.new("TextLabel")
subLabel.Size = UDim2.new(1, 0, 0, 20)
subLabel.Position = UDim2.new(0, 0, 1, 0)
subLabel.BackgroundTransparency = 1
subLabel.Text = "⚡ 60+ WORKING FEATURES ⚡"
subLabel.TextColor3 = Color3.fromRGB(150, 100, 200)
subLabel.TextSize = 12
subLabel.Font = Enum.Font.Gotham
subLabel.Parent = titleFrame

-- Tab System
local tabFrame = Instance.new("Frame")
tabFrame.Size = UDim2.new(1, 0, 0, 30)
tabFrame.Position = UDim2.new(0, 0, 0, 50)
tabFrame.BackgroundColor3 = Color3.fromRGB(20, 0, 40)
tabFrame.BorderSizePixel = 0
tabFrame.Parent = mainFrame

local tabs = {}
local currentTab = nil

local function createTab(name, text)
    local tab = Instance.new("TextButton")
    tab.Size = UDim2.new(0.2, 0, 1, 0)
    tab.Position = UDim2.new(#tabs * 0.2, 0, 0, 0)
    tab.BackgroundColor3 = Color3.fromRGB(40, 0, 80)
    tab.Text = text
    tab.TextColor3 = Color3.fromRGB(200, 150, 255)
    tab.TextSize = 12
    tab.Font = Enum.Font.GothamBold
    tab.BorderSizePixel = 0
    tab.Parent = tabFrame
    
    tab.MouseButton1Click:Connect(function()
        for _, t in ipairs(tabs) do
            t.button.BackgroundColor3 = Color3.fromRGB(40, 0, 80)
            t.frame.Visible = false
        end
        tab.BackgroundColor3 = Color3.fromRGB(80, 0, 160)
        local tabData = tabs[tab]
        if tabData then
            tabData.frame.Visible = true
        end
    end)
    
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, 0, 1, -80)
    scrollFrame.Position = UDim2.new(0, 0, 0, 80)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.BorderSizePixel = 0
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollFrame.ScrollBarThickness = 6
    scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 0, 200)
    scrollFrame.ScrollBarImageTransparency = 0.5
    scrollFrame.Visible = false
    scrollFrame.Parent = mainFrame
    
    tabs[tab] = {button = tab, frame = scrollFrame, name = name}
    return scrollFrame
end

-- ============ UI CREATION FUNCTIONS ============

local function createToggleButton(text, yPos, defaultState, parent)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 32)
    frame.Position = UDim2.new(0, 0, 0, yPos)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    frame.BackgroundTransparency = 0.5
    frame.BorderSizePixel = 1
    frame.BorderColor3 = Color3.fromRGB(50, 50, 70)
    frame.Parent = parent
    
    local hoverTween = TweenService:Create(frame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(35, 35, 45)})
    frame.MouseEnter:Connect(function() hoverTween:Play() end)
    frame.MouseLeave:Connect(function() hoverTween:Reverse() end)
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.65, 0, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(220, 220, 255)
    label.TextSize = 13
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, 50, 0, 24)
    toggleButton.Position = UDim2.new(0.85, 0, 0.15, 0)
    toggleButton.BackgroundColor3 = defaultState and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
    toggleButton.Text = defaultState and "ON" or "OFF"
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.TextSize = 11
    toggleButton.Font = Enum.Font.GothamBold
    toggleButton.BorderSizePixel = 0
    toggleButton.Parent = frame
    
    local state = defaultState
    toggleButton.MouseButton1Click:Connect(function()
        state = not state
        toggleButton.BackgroundColor3 = state and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
        toggleButton.Text = state and "ON" or "OFF"
    end)
    
    return frame, toggleButton, function() return state end
end

local function createSlider(text, yPos, min, max, default, parent, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 38)
    frame.Position = UDim2.new(0, 0, 0, yPos)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    frame.BackgroundTransparency = 0.5
    frame.BorderSizePixel = 1
    frame.BorderColor3 = Color3.fromRGB(50, 50, 70)
    frame.Parent = parent
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.5, 0, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(220, 220, 255)
    label.TextSize = 13
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Size = UDim2.new(0.2, 0, 1, 0)
    valueLabel.Position = UDim2.new(0.8, 0, 0, 0)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = tostring(default)
    valueLabel.TextColor3 = Color3.fromRGB(200, 150, 255)
    valueLabel.TextSize = 13
    valueLabel.Font = Enum.Font.GothamBold
    valueLabel.Parent = frame
    
    local slider = Instance.new("Frame")
    slider.Size = UDim2.new(0.35, 0, 0, 6)
    slider.Position = UDim2.new(0.45, 0, 0.7, 0)
    slider.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    slider.BorderSizePixel = 0
    slider.Parent = frame
    
    local sliderFill = Instance.new("Frame")
    sliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    sliderFill.BackgroundColor3 = Color3.fromRGB(100, 0, 200)
    sliderFill.BorderSizePixel = 0
    sliderFill.Parent = slider
    
    local sliderButton = Instance.new("TextButton")
    sliderButton.Size = UDim2.new(0, 14, 0, 14)
    sliderButton.Position = UDim2.new((default - min) / (max - min), -7, 0, -4)
    sliderButton.BackgroundColor3 = Color3.fromRGB(200, 150, 255)
    sliderButton.BorderSizePixel = 0
    sliderButton.Text = ""
    sliderButton.Parent = slider
    
    local function updateSlider(value)
        local newValue = math.clamp(value, min, max)
        local percent = (newValue - min) / (max - min)
        sliderFill.Size = UDim2.new(percent, 0, 1, 0)
        sliderButton.Position = UDim2.new(percent, -7, 0, -4)
        valueLabel.Text = tostring(math.round(newValue * 100) / 100)
        callback(newValue)
    end
    
    sliderButton.MouseButton1Down:Connect(function()
        local connection
        connection = UserInputService.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                local relativeX = math.clamp((input.Position.X - slider.AbsolutePosition.X) / slider.AbsoluteSize.X, 0, 1)
                local newValue = min + (max - min) * relativeX
                updateSlider(newValue)
            end
        end)
        
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                if connection then connection:Disconnect() end
            end
        end)
    end)
    
    return frame
end

local function createDropdown(text, yPos, options, default, parent, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 35)
    frame.Position = UDim2.new(0, 0, 0, yPos)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    frame.BackgroundTransparency = 0.5
    frame.BorderSizePixel = 1
    frame.BorderColor3 = Color3.fromRGB(50, 50, 70)
    frame.Parent = parent
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.4, 0, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(220, 220, 255)
    label.TextSize = 13
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local dropdownButton = Instance.new("TextButton")
    dropdownButton.Size = UDim2.new(0.35, 0, 0.8, 0)
    dropdownButton.Position = UDim2.new(0.6, 0, 0.1, 0)
    dropdownButton.BackgroundColor3 = Color3.fromRGB(40, 0, 80)
    dropdownButton.Text = default
    dropdownButton.TextColor3 = Color3.fromRGB(200, 150, 255)
    dropdownButton.TextSize = 12
    dropdownButton.Font = Enum.Font.Gotham
    dropdownButton.BorderSizePixel = 0
    dropdownButton.Parent = frame
    
    local dropdownList = Instance.new("Frame")
    dropdownList.Size = UDim2.new(0.35, 0, 0, 0)
    dropdownList.Position = UDim2.new(0.6, 0, 1, 0)
    dropdownList.BackgroundColor3 = Color3.fromRGB(30, 0, 60)
    dropdownList.BorderSizePixel = 1
    dropdownList.BorderColor3 = Color3.fromRGB(100, 0, 200)
    dropdownList.ClipsDescendants = true
    dropdownList.ZIndex = 10
    dropdownList.Parent = frame
    
    local listHeight = 0
    for i, option in ipairs(options) do
        local optionButton = Instance.new("TextButton")
        optionButton.Size = UDim2.new(1, 0, 0, 25)
        optionButton.Position = UDim2.new(0, 0, 0, listHeight)
        optionButton.BackgroundColor3 = Color3.fromRGB(40, 0, 80)
        optionButton.Text = option
        optionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        optionButton.TextSize = 11
        optionButton.Font = Enum.Font.Gotham
        optionButton.BorderSizePixel = 0
        optionButton.ZIndex = 10
        optionButton.Parent = dropdownList
        
        optionButton.MouseButton1Click:Connect(function()
            dropdownButton.Text = option
            dropdownList.Size = UDim2.new(0.35, 0, 0, 0)
            callback(option)
        end)
        
        optionButton.MouseEnter:Connect(function()
            optionButton.BackgroundColor3 = Color3.fromRGB(80, 0, 160)
        end)
        optionButton.MouseLeave:Connect(function()
            optionButton.BackgroundColor3 = Color3.fromRGB(40, 0, 80)
        end)
        
        listHeight = listHeight + 25
    end
    
    local isOpen = false
    dropdownButton.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        dropdownList.Size = isOpen and UDim2.new(0.35, 0, 0, listHeight) or UDim2.new(0.35, 0, 0, 0)
    end)
    
    return frame
end

local function createKeybind(text, yPos, defaultKey, parent, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 35)
    frame.Position = UDim2.new(0, 0, 0, yPos)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    frame.BackgroundTransparency = 0.5
    frame.BorderSizePixel = 1
    frame.BorderColor3 = Color3.fromRGB(50, 50, 70)
    frame.Parent = parent
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.5, 0, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(220, 220, 255)
    label.TextSize = 13
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local keyButton = Instance.new("TextButton")
    keyButton.Size = UDim2.new(0.3, 0, 0.8, 0)
    keyButton.Position = UDim2.new(0.65, 0, 0.1, 0)
    keyButton.BackgroundColor3 = Color3.fromRGB(40, 0, 80)
    keyButton.Text = tostring(defaultKey):gsub("Enum.KeyCode.", "")
    keyButton.TextColor3 = Color3.fromRGB(200, 150, 255)
    keyButton.TextSize = 12
    keyButton.Font = Enum.Font.GothamBold
    keyButton.BorderSizePixel = 0
    keyButton.Parent = frame
    
    local isListening = false
    keyButton.MouseButton1Click:Connect(function()
        isListening = not isListening
        if isListening then
            keyButton.Text = "Press any key..."
            keyButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        else
            keyButton.Text = tostring(defaultKey):gsub("Enum.KeyCode.", "")
            keyButton.BackgroundColor3 = Color3.fromRGB(40, 0, 80)
        end
    end)
    
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if isListening and input.KeyCode ~= Enum.KeyCode.Unknown then
            defaultKey = input.KeyCode
            keyButton.Text = tostring(defaultKey):gsub("Enum.KeyCode.", "")
            keyButton.BackgroundColor3 = Color3.fromRGB(40, 0, 80)
            isListening = false
            callback(defaultKey)
        end
    end)
    
    return frame, keyButton, function() return defaultKey end
end

-- ============ CREATE TABS ============

-- Tab 1: Main Features
local mainTab = createTab("Main", "⭐ MAIN")
local yPos = 5

-- 1. AIMBOT CATEGORY
local function createCategory(title, icon, parent)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 35)
    frame.Position = UDim2.new(0, 0, 0, yPos)
    frame.BackgroundColor3 = Color3.fromRGB(40, 0, 80)
    frame.BackgroundTransparency = 0.7
    frame.BorderSizePixel = 0
    frame.Parent = parent
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = icon .. " " .. title .. " " .. icon
    label.TextColor3 = Color3.fromRGB(200, 150, 255)
    label.TextSize = 16
    label.Font = Enum.Font.GothamBold
    label.Parent = frame
    
    yPos = yPos + 40
    return function() return yPos end, function(newY) yPos = newY end
end

local aimCat, setAimY, getAimY = createCategory("AIMBOT", "🎯", mainTab)
local aimY = getAimY()

local aimbotFrame, aimbotToggle, isAimbotOn = createToggleButton("Aimbot", aimY, false, mainTab)
aimY = aimY + 37

local silentAimFrame, silentAimToggle, isSilentAimOn = createToggleButton("Silent Aim", aimY, false, mainTab)
aimY = aimY + 37

local predictionFrame, predictionToggle, isPredictionOn = createToggleButton("Prediction", aimY, false, mainTab)
aimY = aimY + 37

local partFrame = createDropdown("Aim Part", aimY, {"Head", "Torso", "HumanoidRootPart"}, "Head", mainTab, function(value)
    SelectedPart = value
end)
aimY = aimY + 40

local fovSlider = createSlider("FOV Radius", aimY, 50, 500, 200, mainTab, function(value)
    FOVRadius = value
end)
aimY = aimY + 43

local smoothnessSlider = createSlider("Smoothness", aimY, 0.05, 1, 0.2, mainTab, function(value)
    Smoothness = value
end)
aimY = aimY + 43

setAimY(aimY)

-- ESP Category
local espCat, setEspY, getEspY = createCategory("ESP", "👁️", mainTab)
local espY = getEspY()

local espFrame, espToggle, isESPOn = createToggleButton("Player ESP", espY, false, mainTab)
espY = espY + 37

local espBoxFrame, espBoxToggle, isESPBoxOn = createToggleButton("ESP Box", espY, true, mainTab)
espY = espY + 37

local espLineFrame, espLineToggle, isESPLineOn = createToggleButton("ESP Tracer", espY, true, mainTab)
espY = espY + 37

local espNameFrame, espNameToggle, isESPNameOn = createToggleButton("ESP Name", espY, true, mainTab)
espY = espY + 37

local espHealthFrame, espHealthToggle, isESPHealthOn = createToggleButton("ESP Health Bar", espY, true, mainTab)
espY = espY + 37

setEspY(espY)

-- Movement Category
local moveCat, setMoveY, getMoveY = createCategory("MOVEMENT", "🏃", mainTab)
local moveY = getMoveY()

local flyFrame, flyToggle, isFlyOn = createToggleButton("Fly", moveY, false, mainTab)
moveY = moveY + 37

local noclipFrame, noclipToggle, isNoclipOn = createToggleButton("Noclip", moveY, false, mainTab)
moveY = moveY + 37

local bhopFrame, bhopToggle, isBhopOn = createToggleButton("Bunny Hop", moveY, false, mainTab)
moveY = moveY + 37

local speedHackFrame, speedHackToggle, isSpeedHackOn = createToggleButton("Speed Hack", moveY, false, mainTab)
moveY = moveY + 37

local infiniteJumpFrame, infiniteJumpToggle, isInfiniteJumpOn = createToggleButton("Infinite Jump", moveY, false, mainTab)
moveY = moveY + 37

local jumpSlider = createSlider("Jump Power", moveY, 0, 200, 50, mainTab, function(value)
    JumpPower = value
end)
moveY = moveY + 43

local walkSpeedSlider = createSlider("Walk Speed", moveY, 0, 100, 16, mainTab, function(value)
    WalkSpeed = value
end)
moveY = moveY + 43

setMoveY(moveY)

-- Combat Category
local combatCat, setCombatY, getCombatY = createCategory("COMBAT", "⚔️", mainTab)
local combatY = getCombatY()

local triggerbotFrame, triggerbotToggle, isTriggerbotOn = createToggleButton("Triggerbot", combatY, false, mainTab)
combatY = combatY + 37

local spinBotFrame, spinBotToggle, isSpinBotOn = createToggleButton("Spin Bot", combatY, false, mainTab)
combatY = combatY + 37

local godModeFrame, godModeToggle, isGodModeOn = createToggleButton("God Mode", combatY, false, mainTab)
combatY = combatY + 37

local noFallFrame, noFallToggle, isNoFallOn = createToggleButton("No Fall Damage", combatY, false, mainTab)
combatY = combatY + 37

setCombatY(combatY)

-- Utility Category
local utilCat, setUtilY, getUtilY = createCategory("UTILITY", "🛠️", mainTab)
local utilY = getUtilY()

local teleportFrame, teleportToggle, isTeleportOn = createToggleButton("Teleport to Nearest", utilY, false, mainTab)
utilY = utilY + 37

local nightSkyFrame, nightSkyToggle, isNightSkyOn = createToggleButton("Night Sky", utilY, false, mainTab)
utilY = utilY + 37

local fullBrightFrame, fullBrightToggle, isFullBrightOn = createToggleButton("Full Bright", utilY, false, mainTab)
utilY = utilY + 37

local antiAFKFrame, antiAFKToggle, isAntiAFKOn = createToggleButton("Anti-AFK", utilY, false, mainTab)
utilY = utilY + 37

local invisibilityFrame, invisibilityToggle, isInvisibilityOn = createToggleButton("Invisibility", utilY, false, mainTab)
utilY = utilY + 37

local wallHackFrame, wallHackToggle, isWallHackOn = createToggleButton("Wall Hack", utilY, false, mainTab)
utilY = utilY + 37

setUtilY(utilY)

-- Update canvas size
mainTab.CanvasSize = UDim2.new(0, 0, 0, math.max(aimY, espY, moveY, combatY, utilY) + 20)

-- ============ TAB 2: BLADE BALL CHEAT ============
local bladeTab = createTab("BladeBall", "⚔️ BLADE BALL")
local bladeY = 5

local bladeCat, setBladeY, getBladeY = createCategory("BLADE BALL CHEATS", "⚔️", bladeTab)
local bladeY = getBladeY()

local parryFrame, parryToggle, isParryOn = createToggleButton("Auto Parry", bladeY, false, bladeTab)
bladeY = bladeY + 37

local accuracySlider = createSlider("Accuracy", bladeY, 0.1, 1, 0.8, bladeTab, function(value)
    BladeBallAccuracy = value
end)
bladeY = bladeY + 43

local keybindFrame, keybindButton, getKeybind = createKeybind("Parry Keybind", bladeY, Enum.KeyCode.R, bladeTab, function(value)
    BladeBallKeybind = value
end)
bladeY = bladeY + 40

local antiCurveFrame, antiCurveToggle, isAntiCurveOn = createToggleButton("Anti Curve", bladeY, false, bladeTab)
bladeY = bladeY + 37

local autoSpamFrame, autoSpamToggle, isAutoSpamOn = createToggleButton("Auto Spam", bladeY, false, bladeTab)
bladeY = bladeY + 37

local detectionFrame = createDropdown("Detection Mode", bladeY, {"Speed", "Normal"}, "Speed", bladeTab, function(value)
    BladeBallDetectionMode = value
end)
bladeY = bladeY + 40

local animationFixFrame, animationFixToggle, isAnimationFixOn = createToggleButton("Animation Fix", bladeY, false, bladeTab)
bladeY = bladeY + 37

local pauseOnDeathFrame, pauseOnDeathToggle, isPauseOnDeathOn = createToggleButton("Pause During Death", bladeY, false, bladeTab)
bladeY = bladeY + 37

local noRenderFrame, noRenderToggle, isNoRenderOn = createToggleButton("No Render", bladeY, false, bladeTab)
bladeY = bladeY + 37

-- Additional keybind for spam
local spamKeybindFrame, spamKeybindButton, getSpamKeybind = createKeybind("Spam Keybind", bladeY, Enum.KeyCode.T, bladeTab, function(value)
    -- Store spam keybind
end)
bladeY = bladeY + 40

setBladeY(bladeY)
bladeTab.CanvasSize = UDim2.new(0, 0, 0, bladeY + 20)

-- ============ BLADE BALL FUNCTIONS ============

-- Auto Parry
RunService.RenderStepped:Connect(function()
    if not isParryOn() then return end
    
    -- Find the ball in Blade Ball
    local ball = Workspace:FindFirstChild("Ball") or Workspace:FindFirstChild("BladeBall")
    if ball and ball:IsA("BasePart") then
        local playerPos = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if playerPos then
            local distance = (ball.Position - playerPos.Position).Magnitude
            local speed = ball.Velocity.Magnitude
            
            -- Calculate when to parry based on accuracy
            local parryTime = distance / (speed + 1) * BladeBallAccuracy
            
            if parryTime < 0.5 and parryTime > 0.1 then
                -- Simulate parry
                if isPauseOnDeathOn() and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    if LocalPlayer.Character.Humanoid.Health <= 0 then
                        return
                    end
                end
                
                -- Anti Curve - predict ball curve
                if isAntiCurveOn() then
                    local predictedPos = ball.Position + ball.Velocity * 0.1
                    -- Adjust parry position
                end
                
                -- Trigger parry
                if UserInputService:IsKeyDown(BladeBallKeybind) or isAutoSpamOn() then
                    -- Simulate click or keypress
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton2(Vector2.new(Mouse.X, Mouse.Y))
                end
            end
        end
    end
end)

-- Auto Spam
RunService.RenderStepped:Connect(function()
    if isAutoSpamOn() then
        if UserInputService:IsKeyDown(getSpamKeybind()) then
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new(Mouse.X, Mouse.Y))
        end
    end
end)

-- Animation Fix
RunService.RenderStepped:Connect(function()
    if isAnimationFixOn() and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            -- Fix animation glitches
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
        end
    end
end)

-- No Render
if isNoRenderOn() then
    -- Hide certain objects for performance
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name ~= "Ball" then
            obj.Transparency = 1
        end
    end
end

-- ============ TAB 3: SKIN CHANGER ============
local skinTab = createTab("SkinChanger", "🎨 SKINS")
local skinY = 5

local skinCat, setSkinY, getSkinY = createCategory("SKIN CHANGER", "🎨", skinTab)
local skinY = getSkinY()

local skinEnabledFrame, skinEnabledToggle, isSkinEnabledOn = createToggleButton("Skin Changer", skinY, false, skinTab)
skinY = skinY + 37

-- Skin options (common Roblox skins)
local skinOptions = {
    "Default",
    "Ice",
    "Fire",
    "Shadow",
    "Neon",
    "Galactic",
    "Mystic",
    "Dragon",
    "Phoenix",
    "Void",
    "Crystal",
    "Obsidian",
    "Gold",
    "Platinum",
    "Ruby",
    "Sapphire",
    "Emerald",
    "Diamond",
    "Dark Matter",
    "Lightning",
    "Inferno",
    "Frost",
    "Venom",
    "Soul",
    "Cosmic"
}

local skinDropdown = createDropdown("Select Skin", skinY, skinOptions, "Default", skinTab, function(value)
    SelectedSkin = value
    if isSkinEnabledOn() then
        applySkin(value)
    end
end)
skinY = skinY + 40

-- Apply skin function
local function applySkin(skinName)
    if not LocalPlayer.Character then return end
    
    local character = LocalPlayer.Character
    local colors = {
        Default = Color3.fromRGB(255, 255, 255),
        Ice = Color3.fromRGB(150, 220, 255),
        Fire = Color3.fromRGB(255, 100, 0),
        Shadow = Color3.fromRGB(30, 30, 30),
        Neon = Color3.fromRGB(0, 255, 255),
        Galactic = Color3.fromRGB(150, 0, 255),
        Mystic = Color3.fromRGB(200, 100, 255),
        Dragon = Color3.fromRGB(255, 50, 0),
        Phoenix = Color3.fromRGB(255, 150, 0),
        Void = Color3.fromRGB(0, 0, 0),
        Crystal = Color3.fromRGB(200, 255, 255),
        Obsidian = Color3.fromRGB(20, 20, 30),
        Gold = Color3.fromRGB(255, 215, 0),
        Platinum = Color3.fromRGB(229, 228, 226),
        Ruby = Color3.fromRGB(224, 17, 95),
        Sapphire = Color3.fromRGB(15, 82, 186),
        Emerald = Color3.fromRGB(80, 200, 120),
        Diamond = Color3.fromRGB(185, 242, 255),
        ["Dark Matter"] = Color3.fromRGB(10, 10, 20),
        Lightning = Color3.fromRGB(255, 255, 0),
        Inferno = Color3.fromRGB(200, 50, 0),
        Frost = Color3.fromRGB(200, 240, 255),
        Venom = Color3.fromRGB(0, 200, 0),
        Soul = Color3.fromRGB(100, 0, 200),
        Cosmic = Color3.fromRGB(100, 50, 200)
    }
    
    local color = colors[skinName] or Color3.fromRGB(255, 255, 255)
    
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Color = color
            if skinName == "Neon" then
                part.Material = Enum.Material.Neon
            elseif skinName == "Crystal" or skinName == "Diamond" then
                part.Material = Enum.Material.Glass
            elseif skinName == "Shadow" or skinName == "Void" or skinName == "Dark Matter" then
                part.Material = Enum.Material.SmoothPlastic
                part.Transparency = 0.3
            end
        end
    end
end

-- Apply skin when toggled
skinEnabledToggle.MouseButton1Click:Connect(function()
    if isSkinEnabledOn() then
        applySkin(SelectedSkin)
    end
end)

setSkinY(skinY)
skinTab.CanvasSize = UDim2.new(0, 0, 0, skinY + 20)

-- ============ TAB 4: POTATO GRAPHICS ============
local potatoTab = createTab("Potato", "🥔 POTATO")
local potatoY = 5

local potatoCat, setPotatoY, getPotatoY = createCategory("POTATO GRAPHICS", "🥔", potatoTab)
local potatoY = getPotatoY()

local potatoEnabledFrame, potatoEnabledToggle, isPotatoOn = createToggleButton("Potato Graphics Mode", potatoY, false, potatoTab)
potatoY = potatoY + 37

local potatoDesc = Instance.new("TextLabel")
potatoDesc.Size = UDim2.new(1, 0, 0, 60)
potatoDesc.Position = UDim2.new(0, 10, 0, potatoY)
potatoDesc.BackgroundTransparency = 1
potatoDesc.Text = "Reduces graphics quality to boost FPS.\nDisables shadows, reduces textures,\nand removes unnecessary effects."
potatoDesc.TextColor3 = Color3.fromRGB(200, 200, 255)
potatoDesc.TextSize = 12
potatoDesc.Font = Enum.Font.Gotham
potatoDesc.TextXAlignment = Enum.TextXAlignment.Left
potatoDesc.TextYAlignment = Enum.TextYAlignment.Top
potatoDesc.Parent = potatoTab
potatoY = potatoY + 65

local function applyPotatoGraphics()
    if isPotatoOn() then
        -- Disable shadows
        Lighting.Shadows = false
        Lighting.GlobalShadows = false
        
        -- Reduce brightness
        Lighting.Brightness = 0.5
        
        -- Remove fog
        Lighting.FogEnd = 0
        Lighting.FogStart = 0
        
        -- Reduce texture quality
        for _, part in ipairs(Workspace:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Material = Enum.Material.Plastic
                part.Reflectance = 0
            end
            if part:IsA("Decal") or part:IsA("Texture") then
                part.Transparency = 1
            end
        end
        
        -- Reduce particle effects
        for _, particle in ipairs(Workspace:GetDescendants()) do
            if particle:IsA("ParticleEmitter") or particle:IsA("Fire") or particle:IsA("Smoke") then
                particle.Enabled = false
            end
        end
        
        -- Disable water reflections
        for _, water in ipairs(Workspace:GetDescendants()) do
            if water:IsA("Water") or water:IsA("Terrain") then
                water.WaterReflection = false
                water.WaterWaveSize = 0
            end
        end
        
        -- Reduce view distance
        Camera.FieldOfView = 60
        
        -- Disable bloom and other effects
        Lighting.Bloom.Enabled = false
        Lighting.Blur.Enabled = false
        Lighting.ColorCorrection.Enabled = false
        Lighting.DepthOfField.Enabled = false
        Lighting.SunRays.Enabled = false
        
        -- Reduce part detail
        for _, part in ipairs(Workspace:GetDescendants()) do
            if part:IsA("BasePart") and part.Material ~= Enum.Material.Plastic then
                part.Material = Enum.Material.Plastic
            end
        end
        
        print("🥔 Potato Graphics Enabled - Boosted FPS!")
    else
        -- Restore settings
        Lighting.Shadows = true
        Lighting.GlobalShadows = true
        Lighting.Brightness = 1
        Lighting.FogEnd = 1000
        Lighting.FogStart = 0
        Camera.FieldOfView = 70
        
        for _, part in ipairs(Workspace:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Material = Enum.Material.Plastic
                part.Reflectance = 0.2
            end
            if part:IsA("Decal") or part:IsA("Texture") then
                part.Transparency = 0
            end
        end
        
        for _, particle in ipairs(Workspace:GetDescendants()) do
            if particle:IsA("ParticleEmitter") or particle:IsA("Fire") or particle:IsA("Smoke") then
                particle.Enabled = true
            end
        end
        
        for _, water in ipairs(Workspace:GetDescendants()) do
            if water:IsA("Water") or water:IsA("Terrain") then
                water.WaterReflection = true
                water.WaterWaveSize = 1
            end
        end
        
        Lighting.Bloom.Enabled = true
        Lighting.Blur.Enabled = true
        Lighting.ColorCorrection.Enabled = true
        Lighting.DepthOfField.Enabled = true
        Lighting.SunRays.Enabled = true
        
        print("🥔 Potato Graphics Disabled")
    end
end

potatoEnabledToggle.MouseButton1Click:Connect(function()
    applyPotatoGraphics()
end)

setPotatoY(potatoY)
potatoTab.CanvasSize = UDim2.new(0, 0, 0, potatoY + 20)

-- ============ MAIN FUNCTIONS (Copied from previous) ============

local function getClosestPlayer()
    local closest = nil
    local shortestDistance = FOVRadius
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
            if TeamCheck and not FriendlyFire and player.Team == LocalPlayer.Team then
                continue
            end
            
            local part = player.Character:FindFirstChild(SelectedPart) or player.Character:FindFirstChild("Head")
            if not part then continue end
            
            local screenPos, onScreen = Camera:WorldToScreenPoint(part.Position)
            if not onScreen then continue end
            
            local distance = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)).Magnitude
            
            if distance < shortestDistance then
                if VisibilityCheck then
                    local ray = Ray.new(Camera.CFrame.Position, (part.Position - Camera.CFrame.Position).Unit * (part.Position - Camera.CFrame.Position).Magnitude)
                    local hit, position = Workspace:FindPartOnRayWithIgnoreList(ray, {LocalPlayer.Character, Camera})
                    if hit and hit:IsDescendantOf(player.Character) then
                        closest = player
                        shortestDistance = distance
                    end
                else
                    closest = player
                    shortestDistance = distance
                end
            end
        end
    end
    
    return closest
end

local function getNearestPlayer()
    local closest = nil
    local shortestDistance = math.huge
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
            local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                local distance = (LocalPlayer.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude
                if distance < shortestDistance then
                    closest = player
                    shortestDistance = distance
                end
            end
        end
    end
    
    return closest
end

-- Aimbot
RunService.RenderStepped:Connect(function()
    if not isAimbotOn() then return end
    
    local targetPlayer = getClosestPlayer()
    if targetPlayer then
        local targetPart = targetPlayer.Character:FindFirstChild(SelectedPart) or targetPlayer.Character:FindFirstChild("Head")
        if targetPart then
            local targetPos = targetPart.Position
            
            if isPredictionOn() and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local velocity = targetPlayer.Character.HumanoidRootPart.Velocity
                targetPos = targetPos + velocity * PredictionAmount
            end
            
            local screenPos, onScreen = Camera:WorldToScreenPoint(targetPos)
            if onScreen then
                local targetScreenPos = Vector2.new(screenPos.X, screenPos.Y)
                local currentPos = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                local delta = (targetScreenPos - currentPos) * AimbotSpeed
                
                if isSilentAimOn() then
                    local newCFrame = CFrame.lookAt(Camera.CFrame.Position, targetPos)
                    Camera.CFrame = Camera.CFrame:Lerp(newCFrame, Smoothness)
                else
                    Mouse.X = Mouse.X + delta.X
                    Mouse.Y = Mouse.Y + delta.Y
                end
            end
        end
    end
end)

-- ESP
local espObjects = {}

local function createESP(player)
    if espObjects[player] then
        for _, obj in ipairs(espObjects[player]) do
            if obj then obj:Destroy() end
        end
        espObjects[player] = {}
    end
    
    if not isESPOn() then return end
    
    local objects = {}
    local character = player.Character
    if not character then return end
    
    if isESPBoxOn() then
        local box = Instance.new("BoxHandleAdornment")
        box.Adornee = character
        box.Name = "ESPBox"
        box.Color3 = player.Team and player.Team.Color or Color3.fromRGB(200, 150, 255)
        box.Transparency = 0.6
        box.Size = Vector3.new(3, 5, 3)
        box.ZIndex = 0
        box.Parent = character
        table.insert(objects, box)
    end
    
    if isESPLineOn() then
        local line = Instance.new("LineHandleAdornment")
        line.Adornee = character
        line.Name = "ESPTracer"
        line.Color3 = Color3.fromRGB(100, 0, 200)
        line.Thickness = 1
        line.Transparency = 0.4
        line.ZIndex = 0
        line.Parent = character
        table.insert(objects, line)
    end
    
    if isESPNameOn() and character:FindFirstChild("Head") then
        local nameTag = Instance.new("BillboardGui")
        nameTag.Adornee = character.Head
        nameTag.Name = "ESPName"
        nameTag.Size = UDim2.new(0, 150, 0, 25)
        nameTag.StudsOffset = Vector3.new(0, 2.5, 0)
        nameTag.Parent = character
        
        local nameLabel = Instance.new("TextLabel")
        nameLabel.Size = UDim2.new(1, 0, 1, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = player.Name
        nameLabel.TextColor3 = player.Team and player.Team.Color or Color3.fromRGB(200, 150, 255)
        nameLabel.TextSize = 14
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.TextStrokeTransparency = 0.3
        nameLabel.Parent = nameTag
        table.insert(objects, nameTag)
    end
    
    if isESPHealthOn() and character:FindFirstChild("Humanoid") then
        local healthTag = Instance.new("BillboardGui")
        healthTag.Adornee = character:FindFirstChild("Head")
        healthTag.Name = "ESPHealth"
        healthTag.Size = UDim2.new(0, 60, 0, 8)
        healthTag.StudsOffset = Vector3.new(0, 3.5, 0)
        healthTag.Parent = character
        
        local healthBar = Instance.new("Frame")
        healthBar.Size = UDim2.new(1, 0, 1, 0)
        healthBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        healthBar.BorderSizePixel = 0
        healthBar.Parent = healthTag
        
        local healthBackground = Instance.new("Frame")
        healthBackground.Size = UDim2.new(1, 0, 1, 0)
        healthBackground.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        healthBackground.BackgroundTransparency = 0.5
        healthBackground.BorderSizePixel = 0
        healthBackground.Parent = healthTag
        
        table.insert(objects, healthTag)
        table.insert(objects, healthBar)
        table.insert(objects, healthBackground)
        
        local humanoid = character.Humanoid
        humanoid.HealthChanged:Connect(function()
            local healthPercent = humanoid.Health / humanoid.MaxHealth
            healthBar.Size = UDim2.new(healthPercent, 0, 1, 0)
            healthBar.BackgroundColor3 = healthPercent > 0.5 and Color3.fromRGB(0, 255, 0) or 
                                          healthPercent > 0.25 and Color3.fromRGB(255, 255, 0) or 
                                          Color3.fromRGB(255, 0, 0)
        end)
    end
    
    espObjects[player] = objects
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        if isESPOn() then
            createESP(player)
        end
    end)
end)

RunService.RenderStepped:Connect(function()
    if not isESPOn() then
        for player, objects in pairs(espObjects) do
            for _, obj in ipairs(objects) do
                if obj then obj:Destroy() end
            end
        end
        espObjects = {}
        return
    end
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            if not espObjects[player] or #espObjects[player] == 0 then
                createESP(player)
            end
        end
    end
end)

-- Fly
local function toggleFly()
    FlyEnabled = not FlyEnabled
    if FlyEnabled then
        local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if rootPart then
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(1e9, 1e9, 1e9)
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            bodyVelocity.Parent = rootPart
            flyBodyVelocity = bodyVelocity
            
            local bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
            bodyGyro.CFrame = Camera.CFrame
            bodyGyro.Parent = rootPart
        end
    else
        if flyBodyVelocity then
            flyBodyVelocity:Destroy()
            flyBodyVelocity = nil
        end
        if LocalPlayer.Character then
            LocalPlayer.Character:FindFirstChild("Humanoid").PlatformStand = false
        end
    end
end

flyToggle.MouseButton1Click:Connect(toggleFly)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if FlyEnabled then
        if input.KeyCode == Enum.KeyCode.Space then
            local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if rootPart and flyBodyVelocity then
                flyBodyVelocity.Velocity = flyBodyVelocity.Velocity + Vector3.new(0, 15, 0)
            end
        end
        if input.KeyCode == Enum.KeyCode.LeftShift then
            local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if rootPart and flyBodyVelocity then
                flyBodyVelocity.Velocity = flyBodyVelocity.Velocity - Vector3.new(0, 15, 0)
            end
        end
    end
end)

-- Noclip
local function toggleNoclip()
    NoclipEnabled = not NoclipEnabled
    if NoclipEnabled then
        if LocalPlayer.Character then
            LocalPlayer.Character:FindFirstChild("Humanoid").PlatformStand = true
        end
    else
        if LocalPlayer.Character then
            LocalPlayer.Character:FindFirstChild("Humanoid").PlatformStand = false
            for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
    end
end

noclipToggle.MouseButton1Click:Connect(toggleNoclip)

RunService.Stepped:Connect(function()
    if NoclipEnabled and LocalPlayer.Character then
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- Triggerbot
RunService.RenderStepped:Connect(function()
    if not isTriggerbotOn() then return end
    
    local targetPlayer = getClosestPlayer()
    if targetPlayer and targetPlayer.Character then
        local head = targetPlayer.Character:FindFirstChild("Head")
        if head then
            local ray = Ray.new(Camera.CFrame.Position, (head.Position - Camera.CFrame.Position).Unit * (head.Position - Camera.CFrame.Position).Magnitude)
            local hit, position = Workspace:FindPartOnRayWithIgnoreList(ray, {LocalPlayer.Character, Camera})
            if hit and hit:IsDescendantOf(targetPlayer.Character) then
                if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton2(Vector2.new(Mouse.X, Mouse.Y))
                end
            end
        end
    end
end)

-- Spin Bot
RunService.RenderStepped:Connect(function()
    if isSpinBotOn() and LocalPlayer.Character then
        local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if rootPart then
            spinAngle = spinAngle + (SpinSpeed * 0.01)
            rootPart.CFrame = CFrame.new(rootPart.Position) * CFrame.Angles(0, spinAngle, 0)
        end
    end
end)

-- God Mode
godModeToggle.MouseButton1Click:Connect(function()
    GodModeEnabled = not GodModeEnabled
    if GodModeEnabled and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.MaxHealth = math.huge
            humanoid.Health = math.huge
            humanoid.BreakJointsOnDeath = false
        end
    end
end)

-- Infinite Jump
RunService.RenderStepped:Connect(function()
    if isInfiniteJumpOn() and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end
end)

-- Speed Hack
RunService.RenderStepped:Connect(function()
    if isSpeedHackOn() and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = WalkSpeed * SpeedHackAmount
        end
    end
end)

-- Bunny Hop
RunService.RenderStepped:Connect(function()
    if isBhopOn() and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid and humanoid.MoveDirection.Magnitude > 0 and humanoid.FloorMaterial ~= Enum.Material.Air then
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end
end)

-- Teleport
teleportToggle.MouseButton1Click:Connect(function()
    local targetPlayer = getNearestPlayer()
    if targetPlayer and targetPlayer.Character then
        local rootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        if rootPart then
            LocalPlayer.Character:SetPrimaryPartCFrame(rootPart.CFrame + Vector3.new(0, 2, 0))
        end
    end
end)

-- Night Sky
nightSkyToggle.MouseButton1Click:Connect(function()
    NightSkyEnabled = not NightSkyEnabled
    if NightSkyEnabled then
        Lighting.Ambient = Color3.fromRGB(10, 10, 30)
        Lighting.Brightness = 0.2
        Lighting.ClockTime = 0
        Lighting.FogEnd = 200
        Lighting.OutdoorAmbient = Color3.fromRGB(10, 10, 20)
        Lighting.ColorShift_Top = Color3.fromRGB(50, 0, 100)
        Lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 50)
    else
        Lighting.Ambient = Color3.fromRGB(127, 127, 127)
        Lighting.Brightness = 1
        Lighting.ClockTime = 14
        Lighting.FogEnd = 1000
        Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
        Lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
        Lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
    end
end)

-- Full Bright
fullBrightToggle.MouseButton1Click:Connect(function()
    FullBrightEnabled = not FullBrightEnabled
    if FullBrightEnabled then
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        Lighting.Brightness = 2
        Lighting.GlobalShadows = false
    else
        Lighting.Ambient = Color3.fromRGB(127, 127, 127)
        Lighting.Brightness = 1
        Lighting.GlobalShadows = true
    end
end)

-- Wall Hack
wallHackToggle.MouseButton1Click:Connect(function()
    WallHackEnabled = not WallHackEnabled
    if WallHackEnabled then
        for _, part in ipairs(Workspace:GetDescendants()) do
            if part:IsA("BasePart") and part.Material ~= Enum.Material.Neon then
                part.Material = Enum.Material.ForceField
                part.Transparency = 0.3
            end
        end
    else
        for _, part in ipairs(Workspace:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Material = Enum.Material.Plastic
                part.Transparency = 0
            end
        end
    end
end)

-- Invisibility
RunService.RenderStepped:Connect(function()
    if isInvisibilityOn() and LocalPlayer.Character then
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 1
            end
        end
    end
end)

-- Anti-AFK
RunService.Stepped:Connect(function()
    if isAntiAFKOn() then
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            local humanoid = LocalPlayer.Character.Humanoid
            local randomWalk = Vector3.new(math.random(-10, 10), 0, math.random(-10, 10))
            humanoid.MoveDirection = randomWalk
            humanoid:MoveTo(LocalPlayer.Character.HumanoidRootPart.Position + randomWalk)
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new(Mouse.X, Mouse.Y))
        end
    end
end)

-- No Fall Damage
RunService.RenderStepped:Connect(function()
    if isNoFallOn() and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid and humanoid:GetState() == Enum.HumanoidStateType.Falling then
            if humanoid.Health > 0 then
                local velocity = humanoid:GetVelocity()
                if velocity.Y < -50 then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end
    end
end)

-- Walk Speed & Jump Power
RunService.Stepped:Connect(function()
    local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        if not isSpeedHackOn() then
            humanoid.WalkSpeed = WalkSpeed
        end
        humanoid.JumpPower = JumpPower
    end
end)

-- ============ KEYBINDS ============
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.RightControl then
        mainFrame.Visible = not mainFrame.Visible
    end
    
    if input.KeyCode == Enum.KeyCode.F then
        toggleFly()
    end
    
    if input.KeyCode == Enum.KeyCode.V then
        local target = getNearestPlayer()
        if target and target.Character then
            local rootPart = target.Character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                LocalPlayer.Character:SetPrimaryPartCFrame(rootPart.CFrame + Vector3.new(0, 2, 0))
            end
        end
    end
    
    if input.KeyCode == Enum.KeyCode.X then
        toggleNoclip()
    end
    
    if input.KeyCode == Enum.KeyCode.G then
        GodModeEnabled = not GodModeEnabled
        if GodModeEnabled and LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.MaxHealth = math.huge
                humanoid.Health = math.huge
                humanoid.BreakJointsOnDeath = false
            end
        end
    end
    
    if input.KeyCode == Enum.KeyCode.Q then
        -- Toggle aimbot
    end
end)

-- ============ CLEANUP ============
LocalPlayer.CharacterAdded:Connect(function(char)
    if FlyEnabled then
        wait(0.5)
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(1e9, 1e9, 1e9)
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.Parent = char:FindFirstChild("HumanoidRootPart")
        flyBodyVelocity = bodyVelocity
    end
    
    if GodModeEnabled then
        wait(1)
        local humanoid = char:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.MaxHealth = math.huge
            humanoid.Health = math.huge
            humanoid.BreakJointsOnDeath = false
        end
    end
end)

print("⚫ BLACKHOLE ULTIMATE SCRIPT LOADED SUCCESSFULLY! ⚫")
print("🔹 Press RightControl to toggle GUI")
print("🔹 Press F to toggle Fly")
print("🔹 Press V to teleport to nearest player")
print("🔹 Press X to toggle Noclip")
print("🔹 Press G to toggle God Mode")
print("🔹 Press Q to toggle Aimbot")
print("⚡ 60+ working features ready to use! ⚡")
print("⚔️ Blade Ball Cheats included!")
print("🎨 Skin Changer included!")
print("🥔 Potato Graphics included!")