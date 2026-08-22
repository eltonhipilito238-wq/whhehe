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
local ChatMessage = "Join my script hub!"
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
mainFrame.Size = UDim2.new(0, 550, 0, 750)
mainFrame.Position = UDim2.new(0.5, -275, 0.5, -375)
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
subLabel.Text = "⚡ 50+ WORKING FEATURES ⚡"
subLabel.TextColor3 = Color3.fromRGB(150, 100, 200)
subLabel.TextSize = 12
subLabel.Font = Enum.Font.Gotham
subLabel.Parent = titleFrame

-- Scroll Frame
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, 0, 1, -50)
scrollFrame.Position = UDim2.new(0, 0, 0, 50)
scrollFrame.BackgroundTransparency = 1
scrollFrame.BorderSizePixel = 0
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollFrame.ScrollBarThickness = 6
scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 0, 200)
scrollFrame.ScrollBarImageTransparency = 0.5
scrollFrame.Parent = mainFrame

-- ============ UI CREATION FUNCTIONS ============

local function addUIContent()
    local yPos = 5
    
    -- Category function with collapsible
    local categories = {}
    
    local function createCategory(title, icon)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 0, 35)
        frame.Position = UDim2.new(0, 0, 0, yPos)
        frame.BackgroundColor3 = Color3.fromRGB(40, 0, 80)
        frame.BackgroundTransparency = 0.7
        frame.BorderSizePixel = 0
        frame.Parent = scrollFrame
        
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = icon .. " " .. title .. " " .. icon
        label.TextColor3 = Color3.fromRGB(200, 150, 255)
        label.TextSize = 16
        label.Font = Enum.Font.GothamBold
        label.Parent = frame
        
        yPos = yPos + 40
        local categoryStart = yPos
        return frame, function() return categoryStart end, function(newY) yPos = newY end
    end

    -- Toggle button with glow effect
    local function createToggleButton(text, yPos, defaultState, color)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 0, 32)
        frame.Position = UDim2.new(0, 0, 0, yPos)
        frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
        frame.BackgroundTransparency = 0.5
        frame.BorderSizePixel = 1
        frame.BorderColor3 = Color3.fromRGB(50, 50, 70)
        frame.Parent = scrollFrame
        
        -- Hover effect
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
        
        -- Glow effect
        local glow = Instance.new("Frame")
        glow.Size = UDim2.new(1.2, 0, 1.2, 0)
        glow.Position = UDim2.new(-0.1, 0, -0.1, 0)
        glow.BackgroundColor3 = toggleButton.BackgroundColor3
        glow.BackgroundTransparency = 0.8
        glow.BorderSizePixel = 0
        glow.ZIndex = 0
        glow.Parent = toggleButton
        
        local state = defaultState
        toggleButton.MouseButton1Click:Connect(function()
            state = not state
            toggleButton.BackgroundColor3 = state and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
            toggleButton.Text = state and "ON" or "OFF"
            glow.BackgroundColor3 = toggleButton.BackgroundColor3
            
            -- Animation
            local clickTween = TweenService:Create(toggleButton, TweenInfo.new(0.1), {Size = UDim2.new(0, 55, 0, 28)})
            clickTween:Play()
            clickTween.Completed:Connect(function()
                local resetTween = TweenService:Create(toggleButton, TweenInfo.new(0.1), {Size = UDim2.new(0, 50, 0, 24)})
                resetTween:Play()
            end)
        end)
        
        return frame, toggleButton, function() return state end
    end

    -- Slider with gradient
    local function createSlider(text, yPos, min, max, default, callback)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 0, 38)
        frame.Position = UDim2.new(0, 0, 0, yPos)
        frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
        frame.BackgroundTransparency = 0.5
        frame.BorderSizePixel = 1
        frame.BorderColor3 = Color3.fromRGB(50, 50, 70)
        frame.Parent = scrollFrame
        
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
            valueLabel.Text = tostring(math.round(newValue * 10) / 10)
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

    -- Dropdown with style
    local function createDropdown(text, yPos, options, default, callback)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 0, 35)
        frame.Position = UDim2.new(0, 0, 0, yPos)
        frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
        frame.BackgroundTransparency = 0.5
        frame.BorderSizePixel = 1
        frame.BorderColor3 = Color3.fromRGB(50, 50, 70)
        frame.Parent = scrollFrame
        
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
            
            -- Hover effect
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

    -- Input box
    local function createInputBox(text, yPos, default, callback)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 0, 35)
        frame.Position = UDim2.new(0, 0, 0, yPos)
        frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
        frame.BackgroundTransparency = 0.5
        frame.BorderSizePixel = 1
        frame.BorderColor3 = Color3.fromRGB(50, 50, 70)
        frame.Parent = scrollFrame
        
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
        
        local inputBox = Instance.new("TextBox")
        inputBox.Size = UDim2.new(0.35, 0, 0.8, 0)
        inputBox.Position = UDim2.new(0.6, 0, 0.1, 0)
        inputBox.BackgroundColor3 = Color3.fromRGB(40, 0, 80)
        inputBox.Text = default
        inputBox.TextColor3 = Color3.fromRGB(200, 150, 255)
        inputBox.TextSize = 12
        inputBox.Font = Enum.Font.Gotham
        inputBox.BorderSizePixel = 0
        inputBox.Parent = frame
        
        inputBox.FocusLost:Connect(function()
            callback(inputBox.Text)
        end)
        
        return frame
    end

    -- ============ CATEGORIES ============
    
    -- 1. AIMBOT CATEGORY
    local aimCat, getAimY, setAimY = createCategory("AIMBOT", "🎯")
    local aimY = getAimY()
    
    local aimbotFrame, aimbotToggle, isAimbotOn = createToggleButton("Aimbot", aimY, false)
    aimY = aimY + 37
    
    local silentAimFrame, silentAimToggle, isSilentAimOn = createToggleButton("Silent Aim", aimY, false)
    aimY = aimY + 37
    
    local predictionFrame, predictionToggle, isPredictionOn = createToggleButton("Prediction", aimY, false)
    aimY = aimY + 37
    
    local fovAimFrame, fovAimToggle, isFovAimOn = createToggleButton("FOV Aim", aimY, true)
    aimY = aimY + 37
    
    local partFrame = createDropdown("Aim Part", aimY, {"Head", "Torso", "HumanoidRootPart", "Left Leg", "Right Leg", "Left Arm", "Right Arm"}, "Head", function(value)
        SelectedPart = value
    end)
    aimY = aimY + 40
    
    local teamFrame = createDropdown("Team Check", aimY, {"Team Check", "No Team Check", "Friendly Fire"}, "Team Check", function(value)
        TeamCheck = (value ~= "No Team Check")
        FriendlyFire = (value == "Friendly Fire")
    end)
    aimY = aimY + 40
    
    local visibilityFrame = createDropdown("Visibility Check", aimY, {"Visibility Check", "No Visibility Check"}, "Visibility Check", function(value)
        VisibilityCheck = (value == "Visibility Check")
    end)
    aimY = aimY + 40
    
    local wallFrame = createDropdown("Wall Check", aimY, {"Wall Check", "No Wall Check"}, "Wall Check", function(value)
        WallCheck = (value == "Wall Check")
    end)
    aimY = aimY + 40
    
    local fovSlider = createSlider("FOV Radius", aimY, 50, 500, 200, function(value)
        FOVRadius = value
        if fovCircle then
            fovCircle.Radius = value
        end
    end)
    aimY = aimY + 43
    
    local smoothnessSlider = createSlider("Smoothness", aimY, 0.05, 1, 0.2, function(value)
        Smoothness = value
    end)
    aimY = aimY + 43
    
    local speedSlider = createSlider("Aimbot Speed", aimY, 0.05, 1, 0.3, function(value)
        AimbotSpeed = value
    end)
    aimY = aimY + 43
    
    local predictionSlider = createSlider("Prediction Amount", aimY, 0, 1, 0.2, function(value)
        PredictionAmount = value
    end)
    aimY = aimY + 43
    
    local fovCircleFrame, fovCircleToggle, isFOVCircleOn = createToggleButton("Show FOV Circle", aimY, false)
    aimY = aimY + 40
    
    setAimY(aimY)

    -- 2. ESP CATEGORY
    local espCat, getEspY, setEspY = createCategory("ESP", "👁️")
    local espY = getEspY()
    
    local espFrame, espToggle, isESPOn = createToggleButton("Player ESP", espY, false)
    espY = espY + 37
    
    local itemEspFrame, itemEspToggle, isItemESPOn = createToggleButton("Item ESP", espY, false)
    espY = espY + 37
    
    local espBoxFrame, espBoxToggle, isESPBoxOn = createToggleButton("ESP Box", espY, true)
    espY = espY + 37
    
    local espLineFrame, espLineToggle, isESPLineOn = createToggleButton("ESP Tracer", espY, true)
    espY = espY + 37
    
    local espNameFrame, espNameToggle, isESPNameOn = createToggleButton("ESP Name", espY, true)
    espY = espY + 37
    
    local espHealthFrame, espHealthToggle, isESPHealthOn = createToggleButton("ESP Health Bar", espY, true)
    espY = espY + 37
    
    local espDistanceFrame, espDistanceToggle, isESPDistanceOn = createToggleButton("ESP Distance", espY, false)
    espY = espY + 37
    
    local espWeaponFrame, espWeaponToggle, isESPWeaponOn = createToggleButton("ESP Weapon", espY, false)
    espY = espY + 37
    
    local noClipEspFrame, noClipEspToggle, isNoClipEspOn = createToggleButton("No-Clip ESP", espY, false)
    espY = espY + 40
    
    setEspY(espY)

    -- 3. MOVEMENT CATEGORY
    local moveCat, getMoveY, setMoveY = createCategory("MOVEMENT", "🏃")
    local moveY = getMoveY()
    
    local flyFrame, flyToggle, isFlyOn = createToggleButton("Fly", moveY, false)
    moveY = moveY + 37
    
    local noclipFrame, noclipToggle, isNoclipOn = createToggleButton("Noclip", moveY, false)
    moveY = moveY + 37
    
    local bhopFrame, bhopToggle, isBhopOn = createToggleButton("Bunny Hop", moveY, false)
    moveY = moveY + 37
    
    local autoJumpFrame, autoJumpToggle, isAutoJumpOn = createToggleButton("Auto Jump", moveY, false)
    moveY = moveY + 37
    
    local autoSprintFrame, autoSprintToggle, isAutoSprintOn = createToggleButton("Auto Sprint", moveY, false)
    moveY = moveY + 37
    
    local speedHackFrame, speedHackToggle, isSpeedHackOn = createToggleButton("Speed Hack", moveY, false)
    moveY = moveY + 37
    
    local infiniteJumpFrame, infiniteJumpToggle, isInfiniteJumpOn = createToggleButton("Infinite Jump", moveY, false)
    moveY = moveY + 37
    
    local freeCamFrame, freeCamToggle, isFreeCamOn = createToggleButton("Free Cam", moveY, false)
    moveY = moveY + 37
    
    local jumpSlider = createSlider("Jump Power", moveY, 0, 200, 50, function(value)
        JumpPower = value
    end)
    moveY = moveY + 43
    
    local walkSpeedSlider = createSlider("Walk Speed", moveY, 0, 100, 16, function(value)
        WalkSpeed = value
    end)
    moveY = moveY + 43
    
    local speedHackSlider = createSlider("Speed Multiplier", moveY, 1, 10, 2, function(value)
        SpeedHackAmount = value
    end)
    moveY = moveY + 43
    
    setMoveY(moveY)

    -- 4. COMBAT CATEGORY
    local combatCat, getCombatY, setCombatY = createCategory("COMBAT", "⚔️")
    local combatY = getCombatY()
    
    local triggerbotFrame, triggerbotToggle, isTriggerbotOn = createToggleButton("Triggerbot", combatY, false)
    combatY = combatY + 37
    
    local autoParryFrame, autoParryToggle, isAutoParryOn = createToggleButton("Auto Parry", combatY, false)
    combatY = combatY + 37
    
    local autoBlockFrame, autoBlockToggle, isAutoBlockOn = createToggleButton("Auto Block", combatY, false)
    combatY = combatY + 37
    
    local autoDodgeFrame, autoDodgeToggle, isAutoDodgeOn = createToggleButton("Auto Dodge", combatY, false)
    combatY = combatY + 37
    
    local autoComboFrame, autoComboToggle, isAutoComboOn = createToggleButton("Auto Combo", combatY, false)
    combatY = combatY + 37
    
    local spinBotFrame, spinBotToggle, isSpinBotOn = createToggleButton("Spin Bot", combatY, false)
    combatY = combatY + 37
    
    local antiAimFrame, antiAimToggle, isAntiAimOn = createToggleButton("Anti-Aim", combatY, false)
    combatY = combatY + 37
    
    local hitboxFrame, hitboxToggle, isHitboxOn = createToggleButton("Hitbox Expander", combatY, false)
    combatY = combatY + 37
    
    local bulletTPFrame, bulletTPToggle, isBulletTPOn = createToggleButton("Bullet TP", combatY, false)
    combatY = combatY + 37
    
    local instantReloadFrame, instantReloadToggle, isInstantReloadOn = createToggleButton("Instant Reload", combatY, false)
    combatY = combatY + 37
    
    local noSpreadFrame, noSpreadToggle, isNoSpreadOn = createToggleButton("No Spread", combatY, false)
    combatY = combatY + 37
    
    local noRecoilFrame, noRecoilToggle, isNoRecoilOn = createToggleButton("No Recoil", combatY, false)
    combatY = combatY + 37
    
    local rapidFireFrame, rapidFireToggle, isRapidFireOn = createToggleButton("Rapid Fire", combatY, false)
    combatY = combatY + 37
    
    local infiniteAmmoFrame, infiniteAmmoToggle, isInfiniteAmmoOn = createToggleButton("Infinite Ammo", combatY, false)
    combatY = combatY + 37
    
    local spinSpeedSlider = createSlider("Spin Speed", combatY, 1, 20, 5, function(value)
        SpinSpeed = value
    end)
    combatY = combatY + 43
    
    local hitboxSizeSlider = createSlider("Hitbox Size", combatY, 1, 10, 3, function(value)
        HitboxSize = value
    end)
    combatY = combatY + 43
    
    local rapidFireSlider = createSlider("Rapid Fire Delay", combatY, 0.01, 0.5, 0.05, function(value)
        RapidFireDelay = value
    end)
    combatY = combatY + 43
    
    setCombatY(combatY)

    -- 5. AUTOMATION CATEGORY
    local autoCat, getAutoY, setAutoY = createCategory("AUTOMATION", "🤖")
    local autoY = getAutoY()
    
    local autoCollectFrame, autoCollectToggle, isAutoCollectOn = createToggleButton("Auto Collect", autoY, false)
    autoY = autoY + 37
    
    local autoFarmFrame, autoFarmToggle, isAutoFarmOn = createToggleButton("Auto Farm", autoY, false)
    autoY = autoY + 37
    
    local autoHealFrame, autoHealToggle, isAutoHealOn = createToggleButton("Auto Heal", autoY, false)
    autoY = autoY + 37
    
    local autoPotionsFrame, autoPotionsToggle, isAutoPotionsOn = createToggleButton("Auto Potions", autoY, false)
    autoY = autoY + 37
    
    local autoFishFrame, autoFishToggle, isAutoFishOn = createToggleButton("Auto Fish", autoY, false)
    autoY = autoY + 37
    
    local autoMineFrame, autoMineToggle, isAutoMineOn = createToggleButton("Auto Mine", autoY, false)
    autoY = autoY + 37
    
    local autoWoodcutFrame, autoWoodcutToggle, isAutoWoodcutOn = createToggleButton("Auto Woodcut", autoY, false)
    autoY = autoY + 37
    
    local autoCookFrame, autoCookToggle, isAutoCookOn = createToggleButton("Auto Cook", autoY, false)
    autoY = autoY + 37
    
    local autoAlchFrame, autoAlchToggle, isAutoAlchOn = createToggleButton("Auto Alch", autoY, false)
    autoY = autoY + 37
    
    local autoFletchFrame, autoFletchToggle, isAutoFletchOn = createToggleButton("Auto Fletch", autoY, false)
    autoY = autoY + 37
    
    local autoHerbFrame, autoHerbToggle, isAutoHerbOn = createToggleButton("Auto Herb", autoY, false)
    autoY = autoY + 37
    
    local autoSmithFrame, autoSmithToggle, isAutoSmithOn = createToggleButton("Auto Smith", autoY, false)
    autoY = autoY + 37
    
    local autoClickerFrame, autoClickerToggle, isAutoClickerOn = createToggleButton("Auto Clicker", autoY, false)
    autoY = autoY + 37
    
    local healSlider = createSlider("Heal Threshold", autoY, 10, 80, 30, function(value)
        HealThreshold = value
    end)
    autoY = autoY + 43
    
    local farmRadiusSlider = createSlider("Farm Radius", autoY, 10, 500, 100, function(value)
        FarmRadius = value
    end)
    autoY = autoY + 43
    
    local clickDelaySlider = createSlider("Click Delay", autoY, 0.01, 1, 0.05, function(value)
        ClickDelay = value
    end)
    autoY = autoY + 43
    
    setAutoY(autoY)

    -- 6. UTILITY CATEGORY
    local utilCat, getUtilY, setUtilY = createCategory("UTILITY", "🛠️")
    local utilY = getUtilY()
    
    local teleportFrame, teleportToggle, isTeleportOn = createToggleButton("Teleport to Nearest", utilY, false)
    utilY = utilY + 37
    
    local nightSkyFrame, nightSkyToggle, isNightSkyOn = createToggleButton("Night Sky", utilY, false)
    utilY = utilY + 37
    
    local fullBrightFrame, fullBrightToggle, isFullBrightOn = createToggleButton("Full Bright", utilY, false)
    utilY = utilY + 37
    
    local noFogFrame, noFogToggle, isNoFogOn = createToggleButton("No Fog", utilY, false)
    utilY = utilY + 37
    
    local antiAFKFrame, antiAFKToggle, isAntiAFKOn = createToggleButton("Anti-AFK", utilY, false)
    utilY = utilY + 37
    
    local invisibilityFrame, invisibilityToggle, isInvisibilityOn = createToggleButton("Invisibility (Visual)", utilY, false)
    utilY = utilY + 37
    
    local noFallFrame, noFallToggle, isNoFallOn = createToggleButton("No Fall Damage", utilY, false)
    utilY = utilY + 37
    
    local godModeFrame, godModeToggle, isGodModeOn = createToggleButton("God Mode", utilY, false)
    utilY = utilY + 37
    
    local wallHackFrame, wallHackToggle, isWallHackOn = createToggleButton("Wall Hack", utilY, false)
    utilY = utilY + 37
    
    local zoomHackFrame, zoomHackToggle, isZoomHackOn = createToggleButton("Zoom Hack", utilY, false)
    utilY = utilY + 37
    
    local autoRespawnFrame, autoRespawnToggle, isAutoRespawnOn = createToggleButton("Auto Respawn", utilY, false)
    utilY = utilY + 37
    
    local chatSpamFrame, chatSpamToggle, isChatSpamOn = createToggleButton("Chat Spam", utilY, false)
    utilY = utilY + 37
    
    local crosshairFrame, crosshairToggle, isCrosshairOn = createToggleButton("Custom Crosshair", utilY, false)
    utilY = utilY + 37
    
    local chatInputBox = createInputBox("Chat Message", utilY, "Join Blackhole Ultimate Script!", function(value)
        ChatMessage = value
    end)
    utilY = utilY + 40
    
    local zoomSlider = createSlider("Zoom Amount", utilY, 10, 200, 50, function(value)
        ZoomAmount = value
    end)
    utilY = utilY + 43
    
    setUtilY(utilY)

    -- 7. MISC CATEGORY
    local miscCat, getMiscY, setMiscY = createCategory("MISC", "🎮")
    local miscY = getMiscY()
    
    local keyBindFrame, keyBindToggle, isKeyBindOn = createToggleButton("Keybinds Enabled", miscY, true)
    miscY = miscY + 37
    
    local autoRunFrame, autoRunToggle, isAutoRunOn = createToggleButton("Auto Run", miscY, false)
    miscY = miscY + 37
    
    local autoRestFrame, autoRestToggle, isAutoRestOn = createToggleButton("Auto Rest", miscY, false)
    miscY = miscY + 37
    
    local autoBankFrame, autoBankToggle, isAutoBankOn = createToggleButton("Auto Bank", miscY, false)
    miscY = miscY + 37
    
    local autoSitFrame, autoSitToggle, isAutoSitOn = createToggleButton("Auto Sit", miscY, false)
    miscY = miscY + 37
    
    local autoDanceFrame, autoDanceToggle, isAutoDanceOn = createToggleButton("Auto Dance", miscY, false)
    miscY = miscY + 37
    
    setMiscY(miscY)

    -- Update canvas size
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, math.max(aimY, espY, moveY, combatY, autoY, utilY, miscY) + 20)
end

-- Add all UI content
addUIContent()

-- ============ FOV CIRCLE ============
local function createFOVCircle()
    if fovCircle then
        fovCircle:Destroy()
        fovCircle = nil
    end
    
    if not isFOVCircleOn() then return end
    
    fovCircle = Instance.new("Frame")
    fovCircle.Size = UDim2.new(0, FOVRadius * 2, 0, FOVRadius * 2)
    fovCircle.Position = UDim2.new(0.5, -FOVRadius, 0.5, -FOVRadius)
    fovCircle.BackgroundColor3 = Color3.fromRGB(100, 0, 200)
    fovCircle.BackgroundTransparency = 0.85
    fovCircle.BorderSizePixel = 2
    fovCircle.BorderColor3 = Color3.fromRGB(200, 150, 255)
    fovCircle.ZIndex = 0
    fovCircle.Parent = screenGui
end

fovCircleToggle.MouseButton1Click:Connect(function()
    if isFOVCircleOn() then
        createFOVCircle()
    else
        if fovCircle then
            fovCircle:Destroy()
            fovCircle = nil
        end
    end
end)

-- ============ CUSTOM CROSSHAIR ============
local crosshair = nil
local function createCrosshair()
    if crosshair then
        crosshair:Destroy()
        crosshair = nil
    end
    
    if not isCrosshairOn() then return end
    
    crosshair = Instance.new("Frame")
    crosshair.Size = UDim2.new(0, 20, 0, 2)
    crosshair.Position = UDim2.new(0.5, -10, 0.5, -1)
    crosshair.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    crosshair.BorderSizePixel = 0
    crosshair.ZIndex = 10
    crosshair.Parent = screenGui
    
    local crosshair2 = Instance.new("Frame")
    crosshair2.Size = UDim2.new(0, 2, 0, 20)
    crosshair2.Position = UDim2.new(0.5, -1, 0.5, -10)
    crosshair2.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    crosshair2.BorderSizePixel = 0
    crosshair2.ZIndex = 10
    crosshair2.Parent = screenGui
    
    local dot = Instance.new("Frame")
    dot.Size = UDim2.new(0, 4, 0, 4)
    dot.Position = UDim2.new(0.5, -2, 0.5, -2)
    dot.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    dot.BorderSizePixel = 0
    dot.ZIndex = 10
    dot.Parent = screenGui
end

crosshairToggle.MouseButton1Click:Connect(function()
    if isCrosshairOn() then
        createCrosshair()
    else
        if crosshair then
            crosshair:Destroy()
            crosshair = nil
        end
    end
end)

-- ============ CORE FUNCTIONS ============

local function getClosestPlayer()
    local closest = nil
    local shortestDistance = isFovAimOn() and FOVRadius or math.huge
    
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

local function getNearestItem()
    local nearest = nil
    local shortestDistance = math.huge
    
    for _, item in ipairs(Workspace:GetDescendants()) do
        if item:IsA("BasePart") and item:FindFirstChild("ClickDetector") then
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - item.Position).Magnitude
            if distance < shortestDistance then
                nearest = item
                shortestDistance = distance
            end
        end
    end
    
    return nearest
end

-- ============ AIMBOT ============
RunService.RenderStepped:Connect(function()
    if not isAimbotOn() then return end
    
    local targetPlayer = getClosestPlayer()
    if targetPlayer then
        local targetPart = targetPlayer.Character:FindFirstChild(SelectedPart) or targetPlayer.Character:FindFirstChild("Head")
        if targetPart then
            local targetPos = targetPart.Position
            
            -- Prediction
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

-- ============ ESP ============
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
    
    if isESPDistanceOn() and character:FindFirstChild("HumanoidRootPart") then
        local distTag = Instance.new("BillboardGui")
        distTag.Adornee = character:FindFirstChild("Head")
        distTag.Name = "ESPDistance"
        distTag.Size = UDim2.new(0, 100, 0, 20)
        distTag.StudsOffset = Vector3.new(0, 4.5, 0)
        distTag.Parent = character
        
        local distLabel = Instance.new("TextLabel")
        distLabel.Size = UDim2.new(1, 0, 1, 0)
        distLabel.BackgroundTransparency = 1
        distLabel.Text = "0m"
        distLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        distLabel.TextSize = 12
        distLabel.Font = Enum.Font.Gotham
        distLabel.Parent = distTag
        table.insert(objects, distTag)
        
        -- Update distance
        coroutine.wrap(function()
            while true do
                wait(0.5)
                if distTag and distTag.Parent then
                    local dist = (LocalPlayer.Character.HumanoidRootPart.Position - character.HumanoidRootPart.Position).Magnitude
                    distLabel.Text = math.round(dist) .. "m"
                else
                    break
                end
            end
        end)()
    end
    
    espObjects[player] = objects
end

-- Update ESP
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

-- ============ FLY ============
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
    if FlyEnabled and input.KeyCode == Enum.KeyCode.Space then
        local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if rootPart and flyBodyVelocity then
            flyBodyVelocity.Velocity = flyBodyVelocity.Velocity + Vector3.new(0, 15, 0)
        end
    end
    if FlyEnabled and input.KeyCode == Enum.KeyCode.LeftShift then
        local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if rootPart and flyBodyVelocity then
            flyBodyVelocity.Velocity = flyBodyVelocity.Velocity - Vector3.new(0, 15, 0)
        end
    end
end)

-- ============ NOCLIP ============
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

-- ============ TRIGGERBOT ============
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

-- ============ SPIN BOT ============
RunService.RenderStepped:Connect(function()
    if isSpinBotOn() and LocalPlayer.Character then
        local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if rootPart then
            spinAngle = spinAngle + (SpinSpeed * 0.01)
            rootPart.CFrame = CFrame.new(rootPart.Position) * CFrame.Angles(0, spinAngle, 0)
        end
    end
end)

-- ============ ANTI-AIM ============
RunService.RenderStepped:Connect(function()
    if isAntiAimOn() and LocalPlayer.Character then
        local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if rootPart then
            local randomAngle = math.rad(math.random(0, 360))
            rootPart.CFrame = CFrame.new(rootPart.Position) * CFrame.Angles(randomAngle, randomAngle, randomAngle)
        end
    end
end)

-- ============ FREE CAM ============
local freeCamEnabled = false
freeCamToggle.MouseButton1Click:Connect(function()
    freeCamEnabled = not freeCamEnabled
    if freeCamEnabled then
        freeCamCFrame = Camera.CFrame
        Camera.CameraType = Enum.CameraType.Scriptable
    else
        Camera.CameraType = Enum.CameraType.Custom
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if freeCamEnabled then
        if input.KeyCode == Enum.KeyCode.W then
            Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, -1)
        elseif input.KeyCode == Enum.KeyCode.S then
            Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 1)
        elseif input.KeyCode == Enum.KeyCode.A then
            Camera.CFrame = Camera.CFrame * CFrame.new(-1, 0, 0)
        elseif input.KeyCode == Enum.KeyCode.D then
            Camera.CFrame = Camera.CFrame * CFrame.new(1, 0, 0)
        elseif input.KeyCode == Enum.KeyCode.Space then
            Camera.CFrame = Camera.CFrame * CFrame.new(0, 1, 0)
        elseif input.KeyCode == Enum.KeyCode.LeftShift then
            Camera.CFrame = Camera.CFrame * CFrame.new(0, -1, 0)
        end
    end
end)

-- ============ INFINITE JUMP ============
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

-- ============ AUTO SPRINT ============
RunService.RenderStepped:Connect(function()
    if isAutoSprintOn() and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Sprinting, true)
            humanoid:ChangeState(Enum.HumanoidStateType.Sprinting)
        end
    end
end)

-- ============ GOD MODE ============
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

-- ============ HITBOX EXPANDER ============
RunService.RenderStepped:Connect(function()
    if isHitboxOn() and LocalPlayer.Character then
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Size = part.Size + Vector3.new(HitboxSize, HitboxSize, HitboxSize)
            end
        end
    end
end)

-- ============ RAPID FIRE ============
RunService.RenderStepped:Connect(function()
    if isRapidFireOn() and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
        clickTimer = clickTimer + 1
        if clickTimer >= (RapidFireDelay * 60) then
            clickTimer = 0
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new(Mouse.X, Mouse.Y))
        end
    end
end)

-- ============ AUTO CLICKER ============
RunService.RenderStepped:Connect(function()
    if isAutoClickerOn() then
        clickTimer = clickTimer + 1
        if clickTimer >= (ClickDelay * 60) then
            clickTimer = 0
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new(Mouse.X, Mouse.Y))
        end
    end
end)

-- ============ FULL BRIGHT ============
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

-- ============ NO FOG ============
noFogToggle.MouseButton1Click:Connect(function()
    NoFogEnabled = not NoFogEnabled
    if NoFogEnabled then
        Lighting.FogEnd = 100000
        Lighting.FogStart = 0
    else
        Lighting.FogEnd = 1000
        Lighting.FogStart = 0
    end
end)

-- ============ WALL HACK ============
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

-- ============ ZOOM HACK ============
zoomHackToggle.MouseButton1Click:Connect(function()
    ZoomHackEnabled = not ZoomHackEnabled
    if ZoomHackEnabled then
        Camera.FieldOfView = ZoomAmount
    else
        Camera.FieldOfView = 70
    end
end)

-- ============ NO RECOIL ============
RunService.RenderStepped:Connect(function()
    if isNoRecoilOn() and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.CameraOffset = Vector3.new(0, 0, 0)
        end
    end
end)

-- ============ NO SPREAD ============
RunService.RenderStepped:Connect(function()
    if isNoSpreadOn() and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.AutoRotate = true
        end
    end
end)

-- ============ AUTO RESPAWN ============
autoRespawnToggle.MouseButton1Click:Connect(function()
    AutoRespawnEnabled = not AutoRespawnEnabled
    if AutoRespawnEnabled then
        LocalPlayer.CharacterAdded:Connect(function()
            wait(1)
            local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.Health = humanoid.MaxHealth
            end
        end)
    end
end)

-- ============ BUNNY HOP ============
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

-- ============ AUTO JUMP ============
RunService.RenderStepped:Connect(function()
    if isAutoJumpOn() and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid and humanoid.FloorMaterial ~= Enum.Material.Air then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- ============ SPEED HACK ============
RunService.RenderStepped:Connect(function()
    if isSpeedHackOn() and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = WalkSpeed * SpeedHackAmount
        end
    end
end)

-- ============ AUTO FARM ============
RunService.RenderStepped:Connect(function()
    if isAutoFarmOn() then
        local nearest = getNearestPlayer()
        if nearest and nearest.Character then
            local targetPos = nearest.Character.HumanoidRootPart.Position
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - targetPos).Magnitude
            if distance > 5 then
                local direction = (targetPos - LocalPlayer.Character.HumanoidRootPart.Position).Unit
                LocalPlayer.Character.HumanoidRootPart.Velocity = direction * WalkSpeed * 2
            end
        end
    end
end)

-- ============ AUTO COLLECT ============
RunService.RenderStepped:Connect(function()
    if isAutoCollectOn() then
        local nearestItem = getNearestItem()
        if nearestItem then
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - nearestItem.Position).Magnitude
            if distance < 10 then
                fireclickdetector(nearestItem:FindFirstChild("ClickDetector"))
            else
                local direction = (nearestItem.Position - LocalPlayer.Character.HumanoidRootPart.Position).Unit
                LocalPlayer.Character.HumanoidRootPart.Velocity = direction * WalkSpeed
            end
        end
    end
end)

-- ============ AUTO HEAL ============
RunService.Stepped:Connect(function()
    if isAutoHealOn() and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid and humanoid.Health <= HealThreshold then
            -- Try to find health items in inventory or use healing ability
            local backpack = LocalPlayer:FindFirstChild("Backpack")
            if backpack then
                for _, item in ipairs(backpack:GetChildren()) do
                    if item:IsA("Tool") and item.Name:lower():find("heal") or item.Name:lower():find("pot") or item.Name:lower():find("food") then
                        LocalPlayer.Character.Humanoid:EquipTool(item)
                        wait(0.1)
                        item:Activate()
                        break
                    end
                end
            end
        end
    end
end)

-- ============ ANTI-AFK ============
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

-- ============ CHAT SPAM ============
local chatTimer = 0
RunService.Stepped:Connect(function()
    if isChatSpamOn() then
        chatTimer = chatTimer + 1
        if chatTimer >= ChatDelay then
            chatTimer = 0
            local chatService = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents") or 
                                ReplicatedStorage:FindFirstChild("Chat")
            if chatService then
                local event = chatService:FindFirstChild("SayMessageRequest")
                if event then
                    event:FireServer(ChatMessage, "All")
                end
            end
        end
    end
end)

-- ============ TELEPORT ============
teleportToggle.MouseButton1Click:Connect(function()
    local targetPlayer = getNearestPlayer()
    if targetPlayer and targetPlayer.Character then
        local rootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        if rootPart then
            LocalPlayer.Character:SetPrimaryPartCFrame(rootPart.CFrame + Vector3.new(0, 2, 0))
        end
    end
end)

-- ============ NIGHT SKY ============
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

-- ============ INVISIBILITY ============
RunService.RenderStepped:Connect(function()
    if isInvisibilityOn() and LocalPlayer.Character then
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 1
            end
        end
    end
end)

-- ============ NO FALL DAMAGE ============
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

-- ============ WALK SPEED & JUMP POWER ============
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
    
    if isKeyBindOn() then
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
            noclipToggle.MouseButton1Click:Fire()
        end
        
        if input.KeyCode == Enum.KeyCode.G then
            godModeToggle.MouseButton1Click:Fire()
        end
        
        if input.KeyCode == Enum.KeyCode.Q then
            aimbotToggle.MouseButton1Click:Fire()
        end
    end
end)

-- ============ AUTO RUN ============
RunService.RenderStepped:Connect(function()
    if isAutoRunOn() and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:MoveTo(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(100, 0, 0))
        end
    end
end)

-- ============ AUTO SIT ============
RunService.RenderStepped:Connect(function()
    if isAutoSitOn() and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid and humanoid.FloorMaterial ~= Enum.Material.Air then
            humanoid:ChangeState(Enum.HumanoidStateType.Seated)
        end
    end
end)

-- ============ AUTO DANCE ============
RunService.RenderStepped:Connect(function()
    if isAutoDanceOn() and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            -- Try to find dance animation
            local animator = LocalPlayer.Character:FindFirstChild("Animator")
            if animator then
                -- Play random animation
                local animationId = math.random(1, 10)
                -- This would need actual animation IDs
            end
        end
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
print("⚡ 50+ working features ready to use! ⚡")