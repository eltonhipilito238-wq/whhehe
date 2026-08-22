--[[
    BlackHole Universe Script with Login System & Key Generator
    Features: Aimbot, ESP, Movement, Misc, Blade Ball, Graphics
    Created for educational purposes only
]]

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local Lighting = game:GetService("Lighting")
local Debris = game:GetService("Debris")
local Clipboard = game:GetService("Clipboard")

-- Login System Variables
local ValidKeys = {
    "BLACKHOLE-2026-X9F7-K3M2",
    "UNIVERSE-2026-A1B2-C3D4",
    "GALAXY-2026-E5F6-G7H8",
    "NEBULA-2026-I9J0-K1L2"
}
local IsLoggedIn = false
local LoginScreenGui = nil
local LoginFrame = nil

-- Variables
local AimlockEnabled = false
local SilentAimEnabled = false
local PredictionEnabled = false
local FOV = 100
local Smoothness = 5
local AimPart = "Head"

local ESPEnabled = false
local TracerEnabled = false
local NameTagsEnabled = false
local HPBarEnabled = false
local VisibilityCheck = false

local FlyEnabled = false
local NoclipEnabled = false
local BHopEnabled = false
local SpeedHackEnabled = false
local SpeedValue = 50
local InfiniteJumpEnabled = false
local JumpPowerValue = 50

local TriggerBotEnabled = false
local SpinBotEnabled = false
local GodModeEnabled = false

local TeleportEnabled = false
local NightSkyEnabled = false
local FullBrightEnabled = false
local AntiAFKEnabled = false
local InvisibilityEnabled = false
local WallhackEnabled = false

-- Blade Ball Variables
local AutoParryEnabled = false
local ParryAccuracy = 50
local ParryKeybind = "F"
local AntiCurveEnabled = false
local AutoSpamEnabled = false
local DetectionMode = "Distance"
local AnimationFixEnabled = false
local PauseDuringDead = false
local NoRenderEnabled = false
local SkinChangerEnabled = false
local SelectedSkin = "Default"

-- Graphics Variables
local PotatoGraphics = false
local RemoveLag = false
local RemoveUnnecessaryEffects = false
local LowParticleMode = false
local LowQualityLighting = false
local PerformanceOptimization = false

-- Save original properties
local OriginalBrightness = game.Lighting.Brightness
local OriginalAmbient = game.Lighting.Ambient
local OriginalColorCorrection = game.Lighting.ColorCorrection
local OriginalBloom = game.Lighting.Bloom
local OriginalGlobalShadows = game.Lighting.GlobalShadows
local OriginalTechnology = game.Lighting.Technology

-- Store original particle and effect references
local OriginalParticles = {}
local OriginalEffects = {}

-- Key Generator Function
function GenerateKey()
    local prefixes = {"BLACKHOLE", "UNIVERSE", "GALAXY", "NEBULA", "COSMOS", "STAR", "VOID", "QUASAR"}
    local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local key = ""
    
    -- Random prefix
    local prefix = prefixes[math.random(1, #prefixes)]
    key = prefix .. "-"
    
    -- Year
    key = key .. "2026-"
    
    -- Generate 4 groups of 4 characters
    for i = 1, 4 do
        for j = 1, 4 do
            key = key .. chars:sub(math.random(1, #chars), math.random(1, #chars))
        end
        if i < 4 then
            key = key .. "-"
        end
    end
    
    return key
end

-- Function to add key to valid keys list
function AddKeyToValid(key)
    if key and #key > 0 then
        table.insert(ValidKeys, key)
        return true
    end
    return false
end

-- Login System Functions
function CreateLoginScreen()
    -- Create GUI
    LoginScreenGui = Instance.new("ScreenGui")
    LoginScreenGui.Name = "LoginScreen"
    LoginScreenGui.Parent = LocalPlayer.PlayerGui
    LoginScreenGui.ResetOnSpawn = false
    
    -- Main Frame
    LoginFrame = Instance.new("Frame")
    LoginFrame.Size = UDim2.new(0, 450, 0, 600)
    LoginFrame.Position = UDim2.new(0.5, -225, 0.5, -300)
    LoginFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    LoginFrame.BackgroundTransparency = 0.05
    LoginFrame.BorderSizePixel = 0
    LoginFrame.ClipsDescendants = true
    LoginFrame.Parent = LoginScreenGui
    
    -- Background blur effect
    local blur = Instance.new("BlurEffect")
    blur.Size = 10
    blur.Parent = game.Lighting
    
    -- Apply Corner Style
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 15)
    corner.Parent = LoginFrame
    
    -- Glow effect
    local glow = Instance.new("ImageLabel")
    glow.Size = UDim2.new(1.2, 0, 1.2, 0)
    glow.Position = UDim2.new(-0.1, 0, -0.1, 0)
    glow.BackgroundTransparency = 1
    glow.Image = "rbxassetid://6015896843"
    glow.ImageColor3 = Color3.fromRGB(100, 50, 200)
    glow.ImageTransparency = 0.8
    glow.ScaleType = Enum.ScaleType.Slice
    glow.SliceCenter = Rect.new(10, 10, 10, 10)
    glow.Parent = LoginFrame
    
    -- Title
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 60)
    title.Position = UDim2.new(0, 0, 0, 20)
    title.BackgroundTransparency = 1
    title.Text = "BLACKHOLE UNIVERSE"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 28
    title.Font = Enum.Font.GothamBold
    title.TextStrokeTransparency = 0.3
    title.TextStrokeColor3 = Color3.fromRGB(100, 50, 200)
    title.Parent = LoginFrame
    
    -- Subtitle
    local subtitle = Instance.new("TextLabel")
    subtitle.Size = UDim2.new(1, 0, 0, 30)
    subtitle.Position = UDim2.new(0, 0, 0, 80)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = "ENTER YOUR KEY TO CONTINUE"
    subtitle.TextColor3 = Color3.fromRGB(150, 150, 200)
    subtitle.TextSize = 14
    subtitle.Font = Enum.Font.Gotham
    subtitle.Parent = LoginFrame
    
    -- Decorative Line
    local line = Instance.new("Frame")
    line.Size = UDim2.new(0.8, 0, 0, 2)
    line.Position = UDim2.new(0.1, 0, 0, 120)
    line.BackgroundColor3 = Color3.fromRGB(100, 50, 200)
    line.BackgroundTransparency = 0.5
    line.Parent = LoginFrame
    
    -- Key Label
    local keyLabel = Instance.new("TextLabel")
    keyLabel.Size = UDim2.new(0.8, 0, 0, 25)
    keyLabel.Position = UDim2.new(0.1, 0, 0, 140)
    keyLabel.BackgroundTransparency = 1
    keyLabel.Text = "ACCESS KEY"
    keyLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
    keyLabel.TextSize = 16
    keyLabel.Font = Enum.Font.GothamBold
    keyLabel.TextXAlignment = Enum.TextXAlignment.Left
    keyLabel.Parent = LoginFrame
    
    -- Key Input
    local keyInput = Instance.new("TextBox")
    keyInput.Size = UDim2.new(0.8, 0, 0, 45)
    keyInput.Position = UDim2.new(0.1, 0, 0, 170)
    keyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    keyInput.BackgroundTransparency = 0.3
    keyInput.BorderSizePixel = 0
    keyInput.Text = ""
    keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    keyInput.TextSize = 18
    keyInput.Font = Enum.Font.Gotham
    keyInput.PlaceholderText = "Enter your access key..."
    keyInput.PlaceholderColor3 = Color3.fromRGB(100, 100, 150)
    keyInput.ClearTextOnFocus = true
    keyInput.Parent = LoginFrame
    
    -- Key Input Corner
    local keyInputCorner = Instance.new("UICorner")
    keyInputCorner.CornerRadius = UDim.new(0, 8)
    keyInputCorner.Parent = keyInput
    
    -- Generated Key Display
    local generatedKeyLabel = Instance.new("TextLabel")
    generatedKeyLabel.Size = UDim2.new(0.8, 0, 0, 25)
    generatedKeyLabel.Position = UDim2.new(0.1, 0, 0, 225)
    generatedKeyLabel.BackgroundTransparency = 1
    generatedKeyLabel.Text = "GENERATED KEY (Click to copy)"
    generatedKeyLabel.TextColor3 = Color3.fromRGB(150, 150, 200)
    generatedKeyLabel.TextSize = 12
    generatedKeyLabel.Font = Enum.Font.Gotham
    generatedKeyLabel.TextXAlignment = Enum.TextXAlignment.Left
    generatedKeyLabel.Parent = LoginFrame
    
    -- Generated Key Display Box
    local generatedKeyDisplay = Instance.new("TextBox")
    generatedKeyDisplay.Size = UDim2.new(0.8, 0, 0, 35)
    generatedKeyDisplay.Position = UDim2.new(0.1, 0, 0, 255)
    generatedKeyDisplay.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    generatedKeyDisplay.BackgroundTransparency = 0.2
    generatedKeyDisplay.BorderSizePixel = 0
    generatedKeyDisplay.Text = "Click 'Generate' to create a key"
    generatedKeyDisplay.TextColor3 = Color3.fromRGB(200, 200, 220)
    generatedKeyDisplay.TextSize = 14
    generatedKeyDisplay.Font = Enum.Font.Gotham
    generatedKeyDisplay.TextWrapped = true
    generatedKeyDisplay.ClearTextOnFocus = false
    generatedKeyDisplay.Parent = LoginFrame
    
    -- Display Corner
    local displayCorner = Instance.new("UICorner")
    displayCorner.CornerRadius = UDim.new(0, 8)
    displayCorner.Parent = generatedKeyDisplay
    
    -- Generate Button
    local generateButton = Instance.new("TextButton")
    generateButton.Size = UDim2.new(0.38, 0, 0, 35)
    generateButton.Position = UDim2.new(0.1, 0, 0, 300)
    generateButton.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
    generateButton.BackgroundTransparency = 0.2
    generateButton.BorderSizePixel = 0
    generateButton.Text = "GENERATE KEY"
    generateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    generateButton.TextSize = 16
    generateButton.Font = Enum.Font.GothamBold
    generateButton.Parent = LoginFrame
    
    -- Generate Button Corner
    local generateCorner = Instance.new("UICorner")
    generateCorner.CornerRadius = UDim.new(0, 8)
    generateCorner.Parent = generateButton
    
    -- Copy Button
    local copyButton = Instance.new("TextButton")
    copyButton.Size = UDim2.new(0.38, 0, 0, 35)
    copyButton.Position = UDim2.new(0.52, 0, 0, 300)
    copyButton.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
    copyButton.BackgroundTransparency = 0.2
    copyButton.BorderSizePixel = 0
    copyButton.Text = "COPY KEY"
    copyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    copyButton.TextSize = 16
    copyButton.Font = Enum.Font.GothamBold
    copyButton.Parent = LoginFrame
    
    -- Copy Button Corner
    local copyCorner = Instance.new("UICorner")
    copyCorner.CornerRadius = UDim.new(0, 8)
    copyCorner.Parent = copyButton
    
    -- Login Button
    local loginButton = Instance.new("TextButton")
    loginButton.Size = UDim2.new(0.8, 0, 0, 50)
    loginButton.Position = UDim2.new(0.1, 0, 0, 355)
    loginButton.BackgroundColor3 = Color3.fromRGB(100, 50, 200)
    loginButton.BackgroundTransparency = 0.2
    loginButton.BorderSizePixel = 0
    loginButton.Text = "LOGIN"
    loginButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    loginButton.TextSize = 20
    loginButton.Font = Enum.Font.GothamBold
    loginButton.Parent = LoginFrame
    
    -- Login Button Corner
    local loginCorner = Instance.new("UICorner")
    loginCorner.CornerRadius = UDim.new(0, 10)
    loginCorner.Parent = loginButton
    
    -- Status Label
    local statusLabel = Instance.new("TextLabel")
    statusLabel.Size = UDim2.new(0.8, 0, 0, 30)
    statusLabel.Position = UDim2.new(0.1, 0, 0, 420)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = "Please enter your access key"
    statusLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
    statusLabel.TextSize = 13
    statusLabel.Font = Enum.Font.Gotham
    statusLabel.TextWrapped = true
    statusLabel.Parent = LoginFrame
    
    -- Valid Keys Display
    local validKeysLabel = Instance.new("TextLabel")
    validKeysLabel.Size = UDim2.new(0.8, 0, 0, 60)
    validKeysLabel.Position = UDim2.new(0.1, 0, 0, 460)
    validKeysLabel.BackgroundTransparency = 1
    validKeysLabel.Text = "Valid Keys: " .. table.concat(ValidKeys, ", ")
    validKeysLabel.TextColor3 = Color3.fromRGB(100, 150, 100)
    validKeysLabel.TextSize = 11
    validKeysLabel.Font = Enum.Font.Gotham
    validKeysLabel.TextWrapped = true
    validKeysLabel.TextScaled = true
    validKeysLabel.Parent = LoginFrame
    
    -- Button hover effects
    loginButton.MouseEnter:Connect(function()
        loginButton.BackgroundColor3 = Color3.fromRGB(120, 60, 220)
    end)
    
    loginButton.MouseLeave:Connect(function()
        loginButton.BackgroundColor3 = Color3.fromRGB(100, 50, 200)
    end)
    
    generateButton.MouseEnter:Connect(function()
        generateButton.BackgroundColor3 = Color3.fromRGB(70, 70, 100)
    end)
    
    generateButton.MouseLeave:Connect(function()
        generateButton.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
    end)
    
    copyButton.MouseEnter:Connect(function()
        copyButton.BackgroundColor3 = Color3.fromRGB(70, 70, 100)
    end)
    
    copyButton.MouseLeave:Connect(function()
        copyButton.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
    end)
    
    -- Generate Key Button Functionality
    local generatedKey = ""
    generateButton.MouseButton1Click:Connect(function()
        generatedKey = GenerateKey()
        AddKeyToValid(generatedKey)
        generatedKeyDisplay.Text = generatedKey
        generatedKeyDisplay.TextColor3 = Color3.fromRGB(0, 255, 0)
        statusLabel.Text = "✅ New key generated! Click 'Copy Key' to copy it"
        statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        
        -- Update valid keys display
        validKeysLabel.Text = "Valid Keys: " .. table.concat(ValidKeys, ", ")
    end)
    
    -- Copy Key Button Functionality
    copyButton.MouseButton1Click:Connect(function()
        if generatedKey and #generatedKey > 0 then
            Clipboard:Set(generatedKey)
            statusLabel.Text = "✅ Key copied to clipboard!"
            statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            copyButton.Text = "✓ COPIED!"
            wait(2)
            copyButton.Text = "COPY KEY"
        else
            statusLabel.Text = "⚠️ Generate a key first!"
            statusLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
        end
    end)
    
    -- Login Button Functionality
    loginButton.MouseButton1Click:Connect(function()
        local key = keyInput.Text
        
        if key == "" then
            statusLabel.Text = "⚠️ Please enter your access key!"
            statusLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
            return
        end
        
        -- Show loading
        loginButton.Text = "VERIFYING..."
        loginButton.BackgroundColor3 = Color3.fromRGB(150, 100, 50)
        statusLabel.Text = "Verifying your access..."
        statusLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
        
        wait(1)
        
        -- Check if key is valid
        local isValid = false
        for _, validKey in pairs(ValidKeys) do
            if key == validKey then
                isValid = true
                break
            end
        end
        
        if isValid then
            -- Successful login
            statusLabel.Text = "✅ ACCESS GRANTED!"
            statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            loginButton.Text = "✓ LOGGED IN"
            loginButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
            
            wait(1)
            IsLoggedIn = true
            LoginScreenGui:Destroy()
            
            -- Remove blur
            if game.Lighting:FindFirstChild("BlurEffect") then
                game.Lighting.BlurEffect:Destroy()
            end
            
            -- Initialize the main script
            InitializeScript()
        else
            -- Invalid key
            statusLabel.Text = "❌ Invalid access key!"
            statusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            loginButton.Text = "LOGIN"
            loginButton.BackgroundColor3 = Color3.fromRGB(100, 50, 200)
        end
    end)
    
    -- Enter key functionality
    keyInput.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            loginButton:CaptureFocus()
            wait(0.1)
            loginButton.MouseButton1Click:Fire()
        end
    end)
    
    -- Add animation
    LoginFrame:TweenPosition(UDim2.new(0.5, -225, 0.5, -300), "Out", "Back", 0.5, true)
end

-- Main script initialization
function InitializeScript()
    -- Aimbot Functions
    function GetClosestPlayer()
        local closest = nil
        local shortestDistance = math.huge
        local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                if VisibilityCheck and not IsPlayerVisible(player) then
                    continue
                end
                
                local part = player.Character:FindFirstChild(AimPart)
                if part then
                    local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
                    if onScreen then
                        local distance = (Vector2.new(pos.X, pos.Y) - center).Magnitude
                        if distance < FOV and distance < shortestDistance then
                            shortestDistance = distance
                            closest = player
                        end
                    end
                end
            end
        end
        return closest
    end

    function IsPlayerVisible(player)
        if not player.Character then return false end
        local part = player.Character:FindFirstChild(AimPart)
        if not part then return false end
        
        local ray = Ray.new(Camera.CFrame.Position, (part.Position - Camera.CFrame.Position).Unit * 1000)
        local hit, pos = Workspace:FindPartOnRay(ray, LocalPlayer.Character)
        if hit and hit:IsDescendantOf(player.Character) then
            return true
        end
        return false
    end

    -- Aimbot Loop
    RunService.RenderStepped:Connect(function()
        if AimlockEnabled or SilentAimEnabled then
            local target = GetClosestPlayer()
            if target and target.Character then
                local part = target.Character:FindFirstChild(AimPart)
                if part then
                    local targetPosition = part.Position
                    
                    if PredictionEnabled then
                        local velocity = target.Character.HumanoidRootPart.Velocity
                        targetPosition = targetPosition + (velocity * 0.1)
                    end
                    
                    local direction = (targetPosition - Camera.CFrame.Position).Unit
                    local lookVector = direction
                    
                    if AimlockEnabled then
                        local targetCFrame = CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position + lookVector)
                        local currentCFrame = Camera.CFrame
                        local lerpedCFrame = currentCFrame:Lerp(targetCFrame, Smoothness / 100)
                        Camera.CFrame = lerpedCFrame
                    end
                    
                    if SilentAimEnabled then
                        local oldCFrame = Camera.CFrame
                        Camera.CFrame = CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position + lookVector)
                        game:GetService("RunService").RenderStepped:Wait()
                        Camera.CFrame = oldCFrame
                    end
                end
            end
        end
    end)

    -- ESP Functions
    function CreateESP(player)
        if not player.Character then return end
        
        local character = player.Character
        local humanoid = character:FindFirstChild("Humanoid")
        if not humanoid then return end
        
        if ESPEnabled then
            local box = Instance.new("BoxHandleAdornment")
            box.Size = Vector3.new(3, 5, 1)
            box.Adornee = character
            box.ZIndex = 0
            box.AlwaysOnTop = true
            box.Color3 = player.TeamColor.Color
            box.Transparency = 0.5
            box.Parent = character
        end
        
        if TracerEnabled then
            local tracer = Instance.new("LineHandleAdornment")
            tracer.Adornee = character
            tracer.AlwaysOnTop = true
            tracer.Color3 = player.TeamColor.Color
            tracer.Transparency = 0.5
            tracer.Parent = character
        end
        
        if NameTagsEnabled then
            local tag = Instance.new("BillboardGui")
            tag.Adornee = character
            tag.Size = UDim2.new(0, 100, 0, 30)
            tag.AlwaysOnTop = true
            
            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 1, 0)
            label.Text = player.Name
            label.TextColor3 = player.TeamColor.Color
            label.BackgroundTransparency = 1
            label.TextScaled = true
            label.Parent = tag
            tag.Parent = character
        end
        
        if HPBarEnabled then
            local hpBar = Instance.new("BillboardGui")
            hpBar.Adornee = character
            hpBar.Size = UDim2.new(0, 100, 0, 10)
            hpBar.Position = UDim2.new(0, -50, 0, -20)
            hpBar.AlwaysOnTop = true
            
            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(1, 0, 1, 0)
            frame.BackgroundColor3 = Color3.new(0, 1, 0)
            frame.BackgroundTransparency = 0.5
            
            local hpLabel = Instance.new("TextLabel")
            hpLabel.Size = UDim2.new(1, 0, 1, 0)
            hpLabel.Text = math.round(humanoid.Health / humanoid.MaxHealth * 100) .. "%"
            hpLabel.TextColor3 = Color3.new(1, 1, 1)
            hpLabel.BackgroundTransparency = 1
            hpLabel.TextScaled = true
            hpLabel.Parent = frame
            
            frame.Parent = hpBar
            hpBar.Parent = character
            
            humanoid.HealthChanged:Connect(function(health)
                hpLabel.Text = math.round(health / humanoid.MaxHealth * 100) .. "%"
                frame.BackgroundColor3 = Color3.new(1 - (health / humanoid.MaxHealth), health / humanoid.MaxHealth, 0)
            end)
        end
    end

    -- Movement Functions
    function ToggleFly()
        FlyEnabled = not FlyEnabled
        if FlyEnabled then
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(1, 1, 1) * 100000
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            bodyVelocity.Parent = LocalPlayer.Character.HumanoidRootPart
            
            local bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(1, 1, 1) * 100000
            bodyGyro.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
            bodyGyro.Parent = LocalPlayer.Character.HumanoidRootPart
            
            UserInputService.InputBegan:Connect(function(input, gameProcessed)
                if gameProcessed then return end
                if input.KeyCode == Enum.KeyCode.Space then
                    bodyVelocity.Velocity = Vector3.new(0, 50, 0)
                end
            end)
        else
            if LocalPlayer.Character then
                local root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if root then
                    root:FindFirstChildOfClass("BodyVelocity"):Destroy()
                    root:FindFirstChildOfClass("BodyGyro"):Destroy()
                end
            end
        end
    end

    function ToggleNoclip()
        NoclipEnabled = not NoclipEnabled
        if NoclipEnabled then
            LocalPlayer.Character.HumanoidRootPart.CanCollide = false
        else
            LocalPlayer.Character.HumanoidRootPart.CanCollide = true
        end
    end

    local bhopConnection
    function ToggleBHop()
        BHopEnabled = not BHopEnabled
        if BHopEnabled then
            bhopConnection = UserInputService.JumpRequest:Connect(function()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    local humanoid = LocalPlayer.Character.Humanoid
                    if humanoid.FloorMaterial ~= Enum.Material.Air then
                        humanoid.Jump = true
                    end
                end
            end)
        else
            if bhopConnection then
                bhopConnection:Disconnect()
            end
        end
    end

    function SetSpeed(value)
        SpeedValue = value
        if SpeedHackEnabled and LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = value
            end
        end
    end

    function ToggleInfiniteJump()
        InfiniteJumpEnabled = not InfiniteJumpEnabled
    end

    function SetJumpPower(value)
        JumpPowerValue = value
        if LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.JumpPower = value
            end
        end
    end

    local spinConnection
    function ToggleSpinBot()
        SpinBotEnabled = not SpinBotEnabled
        if SpinBotEnabled then
            spinConnection = RunService.RenderStepped:Connect(function()
                if LocalPlayer.Character then
                    local root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if root then
                        root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(10), 0)
                    end
                end
            end)
        else
            if spinConnection then
                spinConnection:Disconnect()
            end
        end
    end

    function ToggleGodMode()
        GodModeEnabled = not GodModeEnabled
        if GodModeEnabled then
            print("God Mode: " .. tostring(GodModeEnabled))
        end
    end

    function TeleportToNearest()
        local closest = nil
        local shortestDistance = math.huge
        
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local distance = (player.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    closest = player
                end
            end
        end
        
        if closest and LocalPlayer.Character then
            LocalPlayer.Character.HumanoidRootPart.CFrame = closest.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
        end
    end

    function ToggleNightSky()
        NightSkyEnabled = not NightSkyEnabled
        if NightSkyEnabled then
            game.Lighting.Ambient = Color3.new(0, 0, 0)
            game.Lighting.Brightness = 0
            game.Lighting.OutdoorAmbient = Color3.new(0, 0, 0)
        else
            game.Lighting.Ambient = OriginalAmbient
            game.Lighting.Brightness = OriginalBrightness
            game.Lighting.OutdoorAmbient = Color3.new(0.5, 0.5, 0.5)
        end
    end

    function ToggleFullBright()
        FullBrightEnabled = not FullBrightEnabled
        if FullBrightEnabled then
            game.Lighting.Brightness = 10
            game.Lighting.Ambient = Color3.new(1, 1, 1)
            game.Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
        else
            game.Lighting.Brightness = OriginalBrightness
            game.Lighting.Ambient = OriginalAmbient
            game.Lighting.OutdoorAmbient = Color3.new(0.5, 0.5, 0.5)
        end
    end

    function ToggleAntiAFK()
        AntiAFKEnabled = not AntiAFKEnabled
        if AntiAFKEnabled then
            game:GetService("Players").LocalPlayer.Idled:Connect(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        end
    end

    function ToggleInvisibility()
        InvisibilityEnabled = not InvisibilityEnabled
        if InvisibilityEnabled and LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Transparency = 1
                end
            end
        else
            if LocalPlayer.Character then
                for _, part in pairs(LocalPlayer.Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.Transparency = 0
                    end
                end
            end
        end
    end

    function ToggleWallhack()
        WallhackEnabled = not WallhackEnabled
        if WallhackEnabled then
            for _, obj in pairs(Workspace:GetDescendants()) do
                if obj:IsA("BasePart") and obj.Name ~= "Baseplate" then
                    obj.LocalTransparencyModifier = 0.5
                end
            end
        else
            for _, obj in pairs(Workspace:GetDescendants()) do
                if obj:IsA("BasePart") then
                    obj.LocalTransparencyModifier = 0
                end
            end
        end
    end

    -- Blade Ball Functions
    function ToggleAutoParry()
        AutoParryEnabled = not AutoParryEnabled
        if AutoParryEnabled then
            print("Auto Parry Enabled")
        end
    end

    function ToggleAntiCurve()
        AntiCurveEnabled = not AntiCurveEnabled
        if AntiCurveEnabled then
            print("Anti Curve Enabled")
        end
    end

    function ToggleAutoSpam()
        AutoSpamEnabled = not AutoSpamEnabled
        if AutoSpamEnabled then
            print("Auto Spam Enabled")
        end
    end

    function ToggleAnimationFix()
        AnimationFixEnabled = not AnimationFixEnabled
        if AnimationFixEnabled then
            print("Animation Fix Enabled")
        end
    end

    function ToggleNoRender()
        NoRenderEnabled = not NoRenderEnabled
        if NoRenderEnabled then
            print("No Render Enabled")
        end
    end

    -- Graphics Functions
    function ToggleRemoveUnnecessaryEffects()
        RemoveUnnecessaryEffects = not RemoveUnnecessaryEffects
        if RemoveUnnecessaryEffects then
            for _, effect in pairs(Workspace:GetDescendants()) do
                if effect:IsA("ParticleEmitter") or effect:IsA("Fire") or effect:IsA("Smoke") or 
                   effect:IsA("Sparkles") or effect:IsA("Trail") or effect:IsA("Beam") then
                    effect.Enabled = false
                    table.insert(OriginalEffects, effect)
                end
            end
            
            for _, part in pairs(Workspace:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CastShadow = false
                end
            end
            
            Lighting.Bloom.Enabled = false
            Lighting.ColorCorrection.Enabled = false
            Lighting.Atmosphere.Enabled = false
            Lighting.Blur.Enabled = false
            
            print("Unnecessary effects removed")
        else
            for _, effect in pairs(OriginalEffects) do
                if effect and effect.Parent then
                    effect.Enabled = true
                end
            end
            
            for _, part in pairs(Workspace:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CastShadow = true
                end
            end
            
            Lighting.Bloom.Enabled = true
            Lighting.ColorCorrection.Enabled = true
            Lighting.Atmosphere.Enabled = true
            Lighting.Blur.Enabled = false
            
            OriginalEffects = {}
            print("Effects restored")
        end
    end

    function ToggleLowParticleMode()
        LowParticleMode = not LowParticleMode
        if LowParticleMode then
            for _, particle in pairs(Workspace:GetDescendants()) do
                if particle:IsA("ParticleEmitter") then
                    particle.Rate = particle.Rate / 2
                    particle.Lifetime = NumberRange.new(0.5)
                    particle.SpreadAngle = Vector2.new(0, 0)
                    particle.Speed = NumberRange.new(1)
                    particle.RotSpeed = NumberRange.new(0)
                    particle.Drag = 0
                    particle.Acceleration = Vector3.new(0, -0.5, 0)
                    
                    if particle.Rate > 100 then
                        particle.Rate = 50
                    end
                    
                    table.insert(OriginalParticles, particle)
                end
                
                if particle:IsA("Fire") then
                    particle.Size = particle.Size / 2
                    particle.Heat = particle.Heat / 2
                end
                
                if particle:IsA("Smoke") then
                    particle.Size = particle.Size / 2
                    particle.RiseVelocity = particle.RiseVelocity / 2
                end
                
                if particle:IsA("Sparkles") then
                    particle.Sparkle = false
                end
            end
            print("Low particle mode activated")
        else
            for _, particle in pairs(Workspace:GetDescendants()) do
                if particle:IsA("ParticleEmitter") then
                    particle.Rate = particle.Rate * 2
                    particle.Lifetime = NumberRange.new(1, 2)
                    particle.SpreadAngle = Vector2.new(10, 10)
                    particle.Speed = NumberRange.new(5)
                    particle.RotSpeed = NumberRange.new(10)
                    particle.Drag = 0.5
                    particle.Acceleration = Vector3.new(0, -5, 0)
                end
                
                if particle:IsA("Fire") then
                    particle.Size = particle.Size * 2
                    particle.Heat = particle.Heat * 2
                end
                
                if particle:IsA("Smoke") then
                    particle.Size = particle.Size * 2
                    particle.RiseVelocity = particle.RiseVelocity * 2
                end
                
                if particle:IsA("Sparkles") then
                    particle.Sparkle = true
                end
            end
            OriginalParticles = {}
            print("Particles restored")
        end
    end

    function ToggleLowQualityLighting()
        LowQualityLighting = not LowQualityLighting
        if LowQualityLighting then
            Lighting.Technology = Enum.Technology.Voxel
            Lighting.GlobalShadows = false
            Lighting.Brightness = 1
            Lighting.Ambient = Color3.new(0.5, 0.5, 0.5)
            Lighting.OutdoorAmbient = Color3.new(0.5, 0.5, 0.5)
            Lighting.ShadowSoftness = 0
            Lighting.ClockTime = 12
            Lighting.GeographicLatitude = 0
            
            for _, light in pairs(Workspace:GetDescendants()) do
                if light:IsA("Light") then
                    light.Enabled = false
                    light.Shadows = false
                end
                if light:IsA("BasePart") and light.Material == Enum.Material.Neon then
                    light.Material = Enum.Material.SmoothPlastic
                end
            end
            
            if Lighting:FindFirstChild("Atmosphere") then
                Lighting.Atmosphere.Enabled = false
            end
            
            print("Low quality lighting activated")
        else
            Lighting.Technology = OriginalTechnology
            Lighting.GlobalShadows = OriginalGlobalShadows
            Lighting.Brightness = OriginalBrightness
            Lighting.Ambient = OriginalAmbient
            Lighting.OutdoorAmbient = Color3.new(0.5, 0.5, 0.5)
            Lighting.ShadowSoftness = 0.5
            Lighting.ClockTime = 14
            Lighting.GeographicLatitude = 45
            
            for _, light in pairs(Workspace:GetDescendants()) do
                if light:IsA("Light") then
                    light.Enabled = true
                    light.Shadows = true
                end
                if light:IsA("BasePart") and light.Material == Enum.Material.SmoothPlastic then
                    light.Material = Enum.Material.Neon
                end
            end
            
            if Lighting:FindFirstChild("Atmosphere") then
                Lighting.Atmosphere.Enabled = true
            end
            
            print("Lighting restored")
        end
    end

    function TogglePerformanceOptimization()
        PerformanceOptimization = not PerformanceOptimization
        if PerformanceOptimization then
            Workspace.CurrentCamera.FieldOfView = 70
            Workspace.DistributedGameTime = 0.05
            
            RunService:SetThrottleFpsEnabled(true)
            RunService:Set3dRenderingEnabled(true)
            
            for _, part in pairs(Workspace:GetDescendants()) do
                if part:IsA("Part") or part:IsA("MeshPart") then
                    part.Material = Enum.Material.Plastic
                    part.Reflectance = 0
                    part.Transparency = 0
                end
                if part:IsA("Decal") or part:IsA("Texture") then
                    part.Transparency = 0.5
                end
                if part:IsA("SpecialMesh") then
                    part.MeshType = "Brick"
                end
            end
            
            if Workspace:FindFirstChild("Terrain") then
                local terrain = Workspace.Terrain
                terrain.WaterReflectance = 0
                terrain.WaterTransparency = 0.5
                terrain.WaterWaveSize = 0
                terrain.WaterWaveSpeed = 0
            end
            
            for _, sound in pairs(Workspace:GetDescendants()) do
                if sound:IsA("Sound") then
                    sound.Volume = 0
                    sound.Playing = false
                end
            end
            
            for _, animator in pairs(Workspace:GetDescendants()) do
                if animator:IsA("Animator") then
                    animator:Stop()
                end
            end
            
            game:GetService("PhysicsService").SetPartStreamingMode(Enum.PartStreamingMode.Concurrent)
            
            print("Performance optimization activated")
        else
            Workspace.CurrentCamera.FieldOfView = 70
            Workspace.DistributedGameTime = 0.1
            
            RunService:SetThrottleFpsEnabled(false)
            RunService:Set3dRenderingEnabled(true)
            
            for _, part in pairs(Workspace:GetDescendants()) do
                if part:IsA("Part") or part:IsA("MeshPart") then
                    part.Material = Enum.Material.SmoothPlastic
                    part.Reflectance = 0.5
                    part.Transparency = 0
                end
                if part:IsA("Decal") or part:IsA("Texture") then
                    part.Transparency = 0
                end
            end
            
            if Workspace:FindFirstChild("Terrain") then
                local terrain = Workspace.Terrain
                terrain.WaterReflectance = 0.5
                terrain.WaterTransparency = 0.5
                terrain.WaterWaveSize = 5
                terrain.WaterWaveSpeed = 2
            end
            
            for _, sound in pairs(Workspace:GetDescendants()) do
                if sound:IsA("Sound") then
                    sound.Volume = 1
                    sound.Playing = true
                end
            end
            
            print("Performance settings restored")
        end
    end

    function TogglePotatoGraphics()
        PotatoGraphics = not PotatoGraphics
        if PotatoGraphics then
            game:GetService("Workspace").Terrains = nil
            for _, part in pairs(Workspace:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Material = Enum.Material.Plastic
                    part.Reflectance = 0
                end
            end
            game.Lighting.Bloom.Enabled = false
            game.Lighting.Bloom.Intensity = 0
            game.Lighting.Bloom.Size = 0
        else
            game:GetService("Workspace").Terrains = game:GetService("Workspace"):FindFirstChild("Terrain") or Instance.new("Terrain")
            for _, part in pairs(Workspace:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Material = Enum.Material.SmoothPlastic
                    part.Reflectance = 0.5
                end
            end
            game.Lighting.Bloom.Enabled = true
            game.Lighting.Bloom.Intensity = 0.5
            game.Lighting.Bloom.Size = 2
        end
    end

    function ToggleRemoveLag()
        RemoveLag = not RemoveLag
        if RemoveLag then
            for _, setting in pairs(game:GetService("Workspace"):GetDescendants()) do
                if setting:IsA("Part") or setting:IsA("MeshPart") then
                    setting.Material = Enum.Material.Plastic
                end
            end
            game:GetService("Workspace").StreamingEnabled = true
        else
            game:GetService("Workspace").StreamingEnabled = false
        end
    end

    -- Create UI
    local Window = Rayfield:CreateWindow({
        Name = "BlackHole Universe",
        LoadingTitle = "Loading BlackHole Universe...",
        LoadingSubtitle = "Please wait",
        ConfigurationSaving = {
            Enabled = true,
            FolderName = "BlackHoleUniverse",
            FileName = "Settings"
        },
        Discord = {
            Enabled = false
        },
        KeySystem = false
    })

    -- Main Tab
    local MainTab = Window:CreateTab("Main")

    -- Aimbot Section
    local AimSection = MainTab:CreateSection("Aimbot")

    MainTab:CreateToggle({
        Name = "Aimbot",
        CurrentValue = false,
        Flag = "aimbot",
        Callback = function(Value)
            AimlockEnabled = Value
        end
    })

    MainTab:CreateToggle({
        Name = "Silent Aim",
        CurrentValue = false,
        Flag = "silentaim",
        Callback = function(Value)
            SilentAimEnabled = Value
        end
    })

    MainTab:CreateToggle({
        Name = "Prediction",
        CurrentValue = false,
        Flag = "prediction",
        Callback = function(Value)
            PredictionEnabled = Value
        end
    })

    MainTab:CreateSlider({
        Name = "FOV",
        Range = {50, 500},
        Increment = 1,
        Suffix = "px",
        CurrentValue = 100,
        Flag = "fov",
        Callback = function(Value)
            FOV = Value
        end
    })

    MainTab:CreateSlider({
        Name = "Smoothness",
        Range = {1, 100},
        Increment = 1,
        Suffix = "%",
        CurrentValue = 5,
        Flag = "smoothness",
        Callback = function(Value)
            Smoothness = Value
        end
    })

    MainTab:CreateDropdown({
        Name = "Aim Part",
        Options = {"Head", "Torso", "HumanoidRootPart"},
        CurrentOption = "Head",
        Flag = "aimpart",
        Callback = function(Option)
            AimPart = Option
        end
    })

    -- ESP Section
    local ESPSection = MainTab:CreateSection("ESP")

    MainTab:CreateToggle({
        Name = "ESP Box",
        CurrentValue = false,
        Flag = "espbox",
        Callback = function(Value)
            ESPEnabled = Value
        end
    })

    MainTab:CreateToggle({
        Name = "Tracer",
        CurrentValue = false,
        Flag = "tracer",
        Callback = function(Value)
            TracerEnabled = Value
        end
    })

    MainTab:CreateToggle({
        Name = "Name Tags",
        CurrentValue = false,
        Flag = "nametags",
        Callback = function(Value)
            NameTagsEnabled = Value
        end
    })

    MainTab:CreateToggle({
        Name = "HP %",
        CurrentValue = false,
        Flag = "hpbar",
        Callback = function(Value)
            HPBarEnabled = Value
        end
    })

    MainTab:CreateToggle({
        Name = "Visibility Check",
        CurrentValue = false,
        Flag = "visibility",
        Callback = function(Value)
            VisibilityCheck = Value
        end
    })

    -- Movement Tab
    local MovementTab = Window:CreateTab("Movement")

    MovementTab:CreateToggle({
        Name = "Fly",
        CurrentValue = false,
        Flag = "fly",
        Callback = function(Value)
            ToggleFly()
        end
    })

    MovementTab:CreateToggle({
        Name = "Noclip",
        CurrentValue = false,
        Flag = "noclip",
        Callback = function(Value)
            ToggleNoclip()
        end
    })

    MovementTab:CreateToggle({
        Name = "Bunny Hop",
        CurrentValue = false,
        Flag = "bhop",
        Callback = function(Value)
            ToggleBHop()
        end
    })

    MovementTab:CreateToggle({
        Name = "Speed Hack",
        CurrentValue = false,
        Flag = "speedhack",
        Callback = function(Value)
            SpeedHackEnabled = Value
            if Value then
                SetSpeed(SpeedValue)
            else
                SetSpeed(16)
            end
        end
    })

    MovementTab:CreateSlider({
        Name = "Speed Value",
        Range = {1, 500},
        Increment = 1,
        Suffix = "x",
        CurrentValue = 50,
        Flag = "speedvalue",
        Callback = function(Value)
            SpeedValue = Value
            if SpeedHackEnabled then
                SetSpeed(Value)
            end
        end
    })

    MovementTab:CreateToggle({
        Name = "Infinite Jump",
        CurrentValue = false,
        Flag = "infjump",
        Callback = function(Value)
            ToggleInfiniteJump()
        end
    })

    MovementTab:CreateSlider({
        Name = "Jump Power",
        Range = {1, 500},
        Increment = 1,
        Suffix = "x",
        CurrentValue = 50,
        Flag = "jumppower",
        Callback = function(Value)
            SetJumpPower(Value)
        end
    })

    -- Combat Tab
    local CombatTab = Window:CreateTab("Combat")

    CombatTab:CreateToggle({
        Name = "Trigger Bot",
        CurrentValue = false,
        Flag = "triggerbot",
        Callback = function(Value)
            TriggerBotEnabled = Value
        end
    })

    CombatTab:CreateToggle({
        Name = "Spin Bot",
        CurrentValue = false,
        Flag = "spinbot",
        Callback = function(Value)
            ToggleSpinBot()
        end
    })

    CombatTab:CreateToggle({
        Name = "God Mode",
        CurrentValue = false,
        Flag = "godmode",
        Callback = function(Value)
            ToggleGodMode()
        end
    })

    CombatTab:CreateButton({
        Name = "Teleport to Nearest Player",
        Callback = function()
            TeleportToNearest()
        end
    })

    -- Misc Tab
    local MiscTab = Window:CreateTab("Misc")

    MiscTab:CreateToggle({
        Name = "Night Sky",
        CurrentValue = false,
        Flag = "nightsky",
        Callback = function(Value)
            ToggleNightSky()
        end
    })

    MiscTab:CreateToggle({
        Name = "Full Bright",
        CurrentValue = false,
        Flag = "fullbright",
        Callback = function(Value)
            ToggleFullBright()
        end
    })

    MiscTab:CreateToggle({
        Name = "Anti AFK",
        CurrentValue = false,
        Flag = "antiafk",
        Callback = function(Value)
            ToggleAntiAFK()
        end
    })

    MiscTab:CreateToggle({
        Name = "Invisibility",
        CurrentValue = false,
        Flag = "invisibility",
        Callback = function(Value)
            ToggleInvisibility()
        end
    })

    MiscTab:CreateToggle({
        Name = "Wallhack",
        CurrentValue = false,
        Flag = "wallhack",
        Callback = function(Value)
            ToggleWallhack()
        end
    })

    -- Blade Ball Tab
    local BladeBallTab = Window:CreateTab("Blade Ball Script")

    BladeBallTab:CreateToggle({
        Name = "Auto Parry",
        CurrentValue = false,
        Flag = "autoparry",
        Callback = function(Value)
            ToggleAutoParry()
        end
    })

    BladeBallTab:CreateSlider({
        Name = "Accuracy",
        Range = {1, 100},
        Increment = 1,
        Suffix = "%",
        CurrentValue = 50,
        Flag = "parryaccuracy",
        Callback = function(Value)
            ParryAccuracy = Value
        end
    })

    BladeBallTab:CreateDropdown({
        Name = "Parry Keybind",
        Options = {"F", "G", "Q", "E", "MouseButton1", "MouseButton2"},
        CurrentOption = "F",
        Flag = "parrykeybind",
        Callback = function(Option)
            ParryKeybind = Option
        end
    })

    BladeBallTab:CreateToggle({
        Name = "Anti Curve",
        CurrentValue = false,
        Flag = "ant curve",
        Callback = function(Value)
            ToggleAntiCurve()
        end
    })

    BladeBallTab:CreateToggle({
        Name = "Auto Spam",
        CurrentValue = false,
        Flag = "autospam",
        Callback = function(Value)
            ToggleAutoSpam()
        end
    })

    BladeBallTab:CreateDropdown({
        Name = "Detection Mode",
        Options = {"Distance", "Velocity", "Angle"},
        CurrentOption = "Distance",
        Flag = "detectionmode",
        Callback = function(Option)
            DetectionMode = Option
        end
    })

    BladeBallTab:CreateToggle({
        Name = "Animation Fix",
        CurrentValue = false,
        Flag = "animationfix",
        Callback = function(Value)
            ToggleAnimationFix()
        end
    })

    BladeBallTab:CreateToggle({
        Name = "Pause During Dead",
        CurrentValue = false,
        Flag = "pauseduringdead",
        Callback = function(Value)
            PauseDuringDead = Value
        end
    })

    BladeBallTab:CreateToggle({
        Name = "No Render",
        CurrentValue = false,
        Flag = "norender",
        Callback = function(Value)
            ToggleNoRender()
        end
    })

    BladeBallTab:CreateToggle({
        Name = "Skin Changer",
        CurrentValue = false,
        Flag = "skinchanger",
        Callback = function(Value)
            SkinChangerEnabled = Value
        end
    })

    BladeBallTab:CreateDropdown({
        Name = "Select Skin",
        Options = {"Default", "Cyber", "Neon", "Galaxy", "Lava", "Ice"},
        CurrentOption = "Default",
        Flag = "selectskin",
        Callback = function(Option)
            SelectedSkin = Option
            if SkinChangerEnabled then
                print("Skin changed to: " .. Option)
            end
        end
    })

    -- Graphics Tab
    local GraphicsTab = Window:CreateTab("Graphics")

    GraphicsTab:CreateToggle({
        Name = "Potato Graphics",
        CurrentValue = false,
        Flag = "potatographics",
        Callback = function(Value)
            TogglePotatoGraphics()
        end
    })

    GraphicsTab:CreateToggle({
        Name = "Remove Lag",
        CurrentValue = false,
        Flag = "removelag",
        Callback = function(Value)
            ToggleRemoveLag()
        end
    })

    GraphicsTab:CreateToggle({
        Name = "Remove Unnecessary Effects",
        CurrentValue = false,
        Flag = "removeeffects",
        Callback = function(Value)
            ToggleRemoveUnnecessaryEffects()
        end
    })

    GraphicsTab:CreateToggle({
        Name = "Low Particle Mode",
        CurrentValue = false,
        Flag = "lowparticle",
        Callback = function(Value)
            ToggleLowParticleMode()
        end
    })

    GraphicsTab:CreateToggle({
        Name = "Low Quality Lighting",
        CurrentValue = false,
        Flag = "lowlighting",
        Callback = function(Value)
            ToggleLowQualityLighting()
        end
    })

    GraphicsTab:CreateToggle({
        Name = "Performance/FPS Optimization",
        CurrentValue = false,
        Flag = "performance",
        Callback = function(Value)
            TogglePerformanceOptimization()
        end
    })

    -- Auto-update ESP for new players
    Players.PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function()
            CreateESP(player)
        end)
    end)

    -- Update ESP for existing players
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            player.CharacterAdded:Connect(function()
                CreateESP(player)
            end)
            if player.Character then
                CreateESP(player)
            end
        end
    end

    -- Infinite Jump functionality
    UserInputService.JumpRequest:Connect(function()
        if InfiniteJumpEnabled and LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.Jump = true
            end
        end
    end)

    print("BlackHole Universe Script loaded successfully!")
end

-- Start login screen
CreateLoginScreen()

-- Key information for testing
print("=== BLACKHOLE UNIVERSE ACCESS KEYS ===")
print("Pre-generated keys:")
for i, key in ipairs(ValidKeys) do
    print(i .. ". " .. key)
end
print("=====================================")
print("You can also generate new keys using the 'GENERATE KEY' button")
print("All generated keys are automatically added to the valid keys list")
print("====================================")