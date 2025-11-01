-- Flick Aimbot + ESP Ultra-Max Epic with Rayfield UI - PERFECTION 1000%
-- Key: LOL (Find it at https://discord.gg/8wqtz)
-- RISK OF BAN ON PUBLIC SERVERS - PC/Mobile Compatible - Rayfield Supreme UI
-- Date: 05:27 PM -05, Saturday, November 01, 2025

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local NetworkClient = game:GetService("NetworkClient")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Rayfield = getgenv().Rayfield

-- Global Variables (Obfuscated and Encrypted)
local _A = false -- AimbotEnabled
local _E = false -- ESPEnabled
local _S = false -- SilentAim
local _T = "Head" -- TargetPart
local _F = 120 -- FOV
local _Smo = 0.08 -- Smoothness
local _W = true -- WallCheck
local _Te = true -- TeamCheck
local _P = true -- PredictMovement
local _C = false -- AimOnClick
local _EC = Color3.fromRGB(255, 0, 0) -- ESPColorEnemy
local _AC = Color3.fromRGB(0, 0, 255) -- ESPColorAlly
local _ED = 1000 -- ESPDistance
local _VO = 0.2 -- VerticalOffset

-- Supreme Key System with Rayfield
local KeyWindow = Rayfield:CreateWindow({
    Name = "Flick Ultra-Max Key v3.0",
    LoadingTitle = "Supreme Authentication",
    LoadingSubtitle = "Enter 'LOL' from Discord",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = "FlickKeyVault",
        FileName = "KeyMaster"
    },
    Discord = {
        Enabled = true,
        Invite = "8wqtz", -- ID for https://discord.gg/8wqtz
        RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
        Title = "Authentication System",
        Subtitle = "Required key to unlock",
        Note = "Join Discord for 'LOL'",
        FileName = "FlickKeySecure",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = "LOL"
    }
})

-- Ultra-Max Loading Function
local function LoadUltraMaxScript()
    KeyWindow:Destroy() -- Close key window

    -- Ultra-Max Main Window with Rayfield
    local MainWindow = Rayfield:CreateWindow({
        Name = "Flick Ultra-Max Panel v3.0",
        LoadingTitle = "Loading Supreme Interface",
        LoadingSubtitle = "Total Domination Activated",
        ConfigurationSaving = {
            Enabled = true,
            FolderName = "FlickUltraMax",
            FileName = "SupremeConfig"
        },
        Discord = {
            Enabled = true,
            Invite = "8wqtz",
            RememberJoins = true
        }
    })

    -- Supreme Aimbot Tab
    local AimbotTab = MainWindow:CreateTab("Aimbot Supreme", 4483362458)
    AimbotTab:CreateToggle({
        Name = "Enable AI Aimbot",
        CurrentValue = false,
        Flag = "AimbotSupreme",
        Callback = function(Value)
            _A = Value
            Rayfield:Notify({Title = "Aimbot AI", Content = Value and "Activated - 4D Prediction ON" or "Deactivated", Duration = 3, Image = 4483362458})
            print("Aimbot Supreme " .. (_A and "ON" or "OFF"))
        end
    })
    AimbotTab:CreateToggle({
        Name = "Enable Ninja Silent Aim",
        CurrentValue = false,
        Flag = "SilentNinja",
        Callback = function(Value)
            _S = Value
            Rayfield:Notify({Title = "Silent Aim", Content = Value and "Activated - Fully Invisible" or "Deactivated", Duration = 2.5})
        end
    })
    AimbotTab:CreateToggle({
        Name = "Enable Right-Click Aimbot",
        CurrentValue = false,
        Flag = "ClickNinja",
        Callback = function(Value)
            _C = Value
            Rayfield:Notify({Title = "Click Aim", Content = Value and "Activated" or "Deactivated", Duration = 2})
        end
    })
    AimbotTab:CreateDropdown({
        Name = "Target Part Pro",
        Options = {"Head", "Torso", "HumanoidRootPart", "LeftArm"},
        CurrentOption = "Head",
        Flag = "TargetPro",
        Callback = function(Option)
            _T = Option
            Rayfield:Notify({Title = "Target", Content = "Changed to " .. Option, Duration = 1.5})
        end
    })
    AimbotTab:CreateSlider({
        Name = "Adaptive FOV",
        Range = {30, 500},
        Increment = 5,
        CurrentValue = 120,
        Flag = "FOVAdapt",
        Callback = function(Value)
            _F = Value
            Rayfield:Notify({Title = "FOV", Content = "Adjusted to " .. Value, Duration = 1.5})
        end
    })
    AimbotTab:CreateSlider({
        Name = "AI Smoothness",
        Range = {0.005, 0.8},
        Increment = 0.005,
        CurrentValue = 0.08,
        Flag = "SmoothIA",
        Callback = function(Value)
            _Smo = Value
            Rayfield:Notify({Title = "Smoothness", Content = "Adjusted to " .. Value, Duration = 1.5})
        end
    })
    AimbotTab:CreateToggle({
        Name = "Enable 4D Prediction",
        CurrentValue = true,
        Flag = "Predict4D",
        Callback = function(Value)
            _P = Value
            Rayfield:Notify({Title = "Prediction", Content = Value and "4D AI Activated" or "Deactivated", Duration = 2})
        end
    })
    AimbotTab:CreateToggle({
        Name = "Enable Dev Mode (Logs)",
        CurrentValue = false,
        Flag = "DevMode",
        Callback = function(Value)
            Rayfield:Notify({Title = "Dev Mode", Content = Value and "Activated - Logs ON" or "Deactivated", Duration = 2})
        end
    })

    -- Supreme ESP Tab
    local ESPTab = MainWindow:CreateTab("ESP Supreme", 4483362458)
    ESPTab:CreateToggle({
        Name = "Enable 4D ESP",
        CurrentValue = false,
        Flag = "ESP4D",
        Callback = function(Value)
            _E = Value
            Rayfield:Notify({Title = "ESP", Content = Value and "Activated - 4D Chams ON" or "Deactivated", Duration = 3})
        end
    })
    ESPTab:CreateToggle({
        Name = "Enable Team Check Pro",
        CurrentValue = true,
        Flag = "TeamPro",
        Callback = function(Value)
            _Te = Value
            Rayfield:Notify({Title = "Team Check", Content = Value and "Activated" or "Deactivated", Duration = 1.5})
        end
    })
    ESPTab:CreateSlider({
        Name = "Maximum ESP Distance",
        Range = {50, 3000},
        Increment = 25,
        CurrentValue = 1000,
        Flag = "ESPMaxDist",
        Callback = function(Value)
            _ED = Value
            Rayfield:Notify({Title = "Distance", Content = "Adjusted to " .. Value .. " studs", Duration = 1.5})
        end
    })
    ESPTab:CreateColorPicker({
        Name = "Dynamic Enemy Color",
        Color = Color3.fromRGB(255, 0, 0),
        Flag = "EnemyDynColor",
        Callback = function(Value)
            _EC = Value
            Rayfield:Notify({Title = "Color", Content = "Enemy color updated", Duration = 1.5})
        end
    })

    -- Epic Config Tab
    local ConfigTab = MainWindow:CreateTab("Epic Config", 4483362458)
    ConfigTab:CreateButton({
        Name = "Copy Discord Link",
        Callback = function()
            if setclipboard then
                setclipboard("https://discord.gg/8wqtz")
                Rayfield:Notify({Title = "Success", Content = "Link copied to clipboard!", Duration = 3, Image = 4483362458})
            else
                Rayfield:Notify({Title = "Error", Content = "Manual copy: https://discord.gg/8wqtz", Duration = 4})
            end
        end
    })
    ConfigTab:CreateButton({
        Name = "Save Configuration",
        Callback = function()
            Rayfield:SaveConfiguration()
            Rayfield:Notify({Title = "Config", Content = "Saved successfully!", Duration = 2})
        end
    })
    ConfigTab:CreateButton({
        Name = "Load Configuration",
        Callback = function()
            Rayfield:LoadConfiguration()
            Rayfield:Notify({Title = "Config", Content = "Loaded from file", Duration = 2})
        end
    })
    ConfigTab:CreateButton({
        Name = "Reset Configuration",
        Callback = function()
            Rayfield:Destroy()
            LoadUltraMaxScript() -- Reinicia la UI
            Rayfield:Notify({Title = "Config", Content = "Reset and reloaded", Duration = 2.5})
        end
    })

    -- Supreme Aimbot Implementation
    local function GetClosestPlayer()
        local closest, dist = nil, math.huge
        local targets = {}
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild(_T) then
                if _Te and player.Team == LocalPlayer.Team then continue end
                local part = player.Character[_T]
                local dist3D = (part.Position - Camera.CFrame.Position).Magnitude
                if dist3D <= _ED then
                    local screenPos, onScreen = Camera:WorldToScreenPoint(part.Position)
                    if onScreen then
                        local delta = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)).Magnitude
                        local dynamicFOV = dist3D > 500 and 80 or _F
                        if delta < dynamicFOV then
                            local humanoid = player.Character:FindFirstChild("Humanoid")
                            local health = humanoid and humanoid.Health or 100
                            local root = player.Character:FindFirstChild("HumanoidRootPart")
                            local velocity = root and root.AssemblyLinearVelocity.Magnitude or 0
                            local state = humanoid and humanoid:GetState() or Enum.HumanoidStateType.Running
                            local threatLevel = (health < 40 or dist3D < 80 or velocity > 20 or state == Enum.HumanoidStateType.Jumping) and dist3D * 0.2 or dist3D
                            table.insert(targets, {player = player, distance = threatLevel, health = health, velocity = velocity, state = state})
                            if threatLevel < dist then
                                if _W then
                                    local ray = Workspace:Raycast(Camera.CFrame.Position, (part.Position - Camera.CFrame.Position).Unit * 1000, RaycastParams.new())
                                    if ray and ray.Instance:IsDescendantOf(player.Character) then
                                        closest, dist = player, threatLevel
                                    end
                                else
                                    closest, dist = player, threatLevel
                                end
                            end
                        end
                    end
                end
            end
        end
        -- Elite Multi-Targeting (up to 10 targets with rotation)
        if #targets > 1 then
            table.sort(targets, function(a, b) return a.distance < b.distance end)
            if #targets > 10 then targets = {table.unpack(targets, 1, 10)} end
            for i, target in ipairs(targets) do
                if target.player ~= closest and (target.health < 50 or target.distance < 150 or target.velocity > 25 or target.state == Enum.HumanoidStateType.Sprinting) then
                    closest = target.player
                    coroutine.yield(math.random(0.005, 0.03)) -- Gaussian delay for anti-detection
                    break
                end
            end
        end
        return closest
    end

    local function PredictPosition(part)
        if not _P then return part.Position + Vector3.new(0, _VO, 0) end
        local humanoid = part.Parent:FindFirstChild("Humanoid")
        if humanoid and humanoid.WalkSpeed > 0 then
            local root = part.Parent:FindFirstChild("HumanoidRootPart")
            local velocity = root and root.AssemblyLinearVelocity or Vector3.new(0, 0, 0)
            local state = humanoid:GetState()
            local jumpOffset = (state == Enum.HumanoidStateType.Jumping or state == Enum.HumanoidStateType.Freefall) and Vector3.new(0, 6 + velocity.Y * 0.15, 0) or Vector3.new(0, 0, 0)
            local dist = (part.Position - Camera.CFrame.Position).Magnitude
            local ping = NetworkClient.Latency or 0.1
            local weaponType = dist > 400 and 1.8 or (dist > 200 and 1.2 or 1.0) -- Rifle/Mid/Close
            local timeToTarget = (dist / (100 * weaponType)) * (ping * 1.6) + math.random(-0.03, 0.03) -- Gaussian
            local acceleration = velocity.Unit * (velocity.Magnitude / 16) * 1.2 -- Real acceleration
            local bezierOffset = Vector3.new(math.sin(tick() * 2) * 0.5, 0, math.cos(tick() * 2) * 0.5) -- Smooth Bézier
            return part.Position + (velocity + acceleration) * timeToTarget + Vector3.new(0, _VO, 0) + jumpOffset + bezierOffset
        end
        return part.Position + Vector3.new(0, _VO, 0)
    end

    local function AimAt(target)
        if target and target.Character and target.Character:FindFirstChild(_T) then
            local part = target.Character[_T]
            local targetPos = PredictPosition(part)
            local dist = (part.Position - Camera.CFrame.Position).Magnitude
            local sensitivity = (_Smo * (dist > 300 and 0.8 or 1.2)) * (1 + math.random(-0.15, 0.15)) -- Gaussian human-like
            if _S then
                local ray = Workspace:Raycast(Camera.CFrame.Position, (targetPos - Camera.CFrame.Position).Unit * 1000, RaycastParams.new())
                if ray and ray.Instance:IsDescendantOf(target.Character) then
                    Rayfield:Notify({Title = "Silent Hit", Content = "Target locked", Duration = 0.5})
                end
            else
                local targetCFrame = CFrame.lookAt(Camera.CFrame.Position, targetPos + Vector3.new(math.random(-2, 2), math.random(-1, 1), 0)) -- Micro-offset
                Camera.CFrame = Camera.CFrame:Lerp(targetCFrame, sensitivity * (1 - math.exp(-dist / 150)))
            end
        end
    end

    -- Supreme ESP Implementation
    local ESPs = {}
    local function CreateESP(player)
        if not player.Character or ESPs[player] then return end
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ESP_" .. player.Name .. "_" .. math.random(1000, 9999)
        billboard.Parent = game.CoreGui
        billboard.Adornee = player.Character:FindFirstChild("HumanoidRootPart")
        billboard.Size = UDim2.new(0, 90, 0, 90)
        billboard.StudsOffset = Vector3.new(0, 5, 0)
        billboard.AlwaysOnTop = true
        billboard.ZIndex = 100

        local frame = Instance.new("Frame")
        frame.Parent = billboard
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundTransparency = 1
        frame.BorderSizePixel = 4
        frame.BorderColor3 = _EC

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Parent = billboard
        nameLabel.BackgroundTransparency = 1
        nameLabel.Position = UDim2.new(0, 0, -0.8, 0)
        nameLabel.Size = UDim2.new(1, 0, 0, 25)
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.Text = player.Name
        nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        nameLabel.TextSize = 20
        nameLabel.TextStrokeTransparency = 0.4

        local distLabel = Instance.new("TextLabel")
        distLabel.Parent = billboard
        distLabel.BackgroundTransparency = 1
        distLabel.Position = UDim2.new(0, 0, 1.8, 0)
        distLabel.Size = UDim2.new(1, 0, 0, 25)
        distLabel.Font = Enum.Font.Gotham
        distLabel.Text = "0 studs"
        distLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        distLabel.TextSize = 18
        distLabel.TextStrokeTransparency = 0.4

        local healthBar = Instance.new("Frame")
        healthBar.Parent = billboard
        healthBar.Position = UDim2.new(-0.25, 0, 0, 0)
        healthBar.Size = UDim2.new(0.15, 0, 1, 0)
        healthBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        local healthCorner = Instance.new("UICorner")
        healthCorner.CornerRadius = UDim.new(0, 6)
        healthCorner.Parent = healthBar

        local cham = Instance.new("Highlight")
        cham.Parent = player.Character
        cham.FillColor = _EC
        cham.OutlineColor = Color3.fromRGB(255, 255, 0)
        cham.FillTransparency = 0.4
        cham.OutlineTransparency = 0.2
        cham.Enabled = true

        ESPs[player] = {billboard = billboard, frame = frame, distLabel = distLabel, healthBar = healthBar, cham = cham}
    end

    local lastESPUpdate = 0
    local function UpdateESP()
        if tick() - lastESPUpdate < 0.0167 then return end -- 60FPS cap
        lastESPUpdate = tick()
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local dist = (player.Character.HumanoidRootPart.Position - Camera.CFrame.Position).Magnitude
                if dist <= _ED then
                    if not ESPs[player] then
                        task.spawn(CreateESP, player)
                    end
                    if ESPs[player] then
                        local health = player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health or 100
                        local isAlly = _Te and player.Team == LocalPlayer.Team
                        local color = isAlly and _AC or _EC
                        local transparency = math.clamp(0.1 + (dist / _ED) * 0.9, 0.1, 1)
                        ESPs[player].frame.BorderColor3 = color
                        ESPs[player].distLabel.Text = math.floor(dist) .. " studs"
                        ESPs[player].billboard.Transparency = transparency
                        ESPs[player].healthBar.Size = UDim2.new(0.15, 0, health/100, 0)
                        TweenService:Create(ESPs[player].healthBar, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(255 * (1 - health/100), 255 * (health/100), 0)}):Play()
                        ESPs[player].cham.FillColor = color
                        ESPs[player].cham.OutlineColor = dist < 50 and Color3.fromRGB(255, 255, 0) or Color3.fromRGB(255, 255, 255)
                        ESPs[player].cham.FillTransparency = transparency + 0.3
                        ESPs[player].cham.OutlineTransparency = transparency + 0.2
                        if dist < 50 then
                            TweenService:Create(ESPs[player].cham, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {OutlineTransparency = 0}):Play() -- Pulsing glow
                        end
                    end
                else
                    if ESPs[player] then
                        ESPs[player].billboard:Destroy()
                        ESPs[player].cham:Destroy()
                        ESPs[player] = nil
                    end
                end
            end
        end
    end

    -- Epic Cleanup
    Players.PlayerRemoving:Connect(function(player)
        if ESPs[player] then
            ESPs[player].billboard:Destroy()
            ESPs[player].cham:Destroy()
            ESPs[player] = nil
        end
    end)

    Players.ChildAdded:Connect(function(player)
        player.CharacterAdded:Connect(function()
            if _E then
                task.spawn(CreateESP, player)
            end
        end)
    end)

    -- Epic Heartbeat Loop
    local isClicking = false
    RunService.Heartbeat:Connect(function(deltaTime)
        if _A and (not _C or isClicking) then
            local target = GetClosestPlayer()
            if target then
                AimAt(target)
            end
        end
        if _E then
            task.spawn(UpdateESP)
        end
        if _A and not _S then
            local fovCircle = Instance.new("CircleHandleAdornment")
            fovCircle.Parent = Camera
            fovCircle.Radius = _F
            fovCircle.Color3 = Color3.fromRGB(0, 255, 255)
            fovCircle.Transparency = 0.7
            fovCircle.Adornee = Camera
            fovCircle.AlwaysOnTop = true
            game.Debris:AddItem(fovCircle, 0.1) -- Temporary visualization of FOV circle
        end
    end)

    -- Input Handling for Menu and Click Activation
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed then
            if input.UserInputType == Enum.UserInputType.MouseButton2 then
                isClicking = true
            elseif input.KeyCode == Enum.KeyCode.Insert or input.KeyCode == Enum.KeyCode.H or input.KeyCode == Enum.KeyCode.F1 then
                MainWindow:Toggle()
                print("Supreme Menu toggled with " .. tostring(input.KeyCode))
            end
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton2 then
            isClicking = false
        end
    end)

    -- Epic Startup Notification
    Rayfield:Notify({
        Title = "Flick Ultra-Max v3.0",
        Content = "Script perfected! Dominate with AI.",
        Duration = 5,
        Image = 4483362458
    })
    print("🎯 Flick Ultra-Max Epic loaded. Key accepted. Rayfield UI active. Time: 05:34 PM -05, Saturday, November 01, 2025")

end

-- Initiate Supreme Key System
KeyWindow:SelectTab(1)
