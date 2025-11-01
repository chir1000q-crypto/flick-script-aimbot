-- Flick Aimbot + ESP Ultra con Sistema de Key - SOLO PARA DESARROLLO PRIVADO
-- Key: LOL (Encuéntrala en https://discord.gg/8wqtz)
-- RIESGO DE BAN EN SERVIDORES PÚBLICOS - Compatible PC/Móvil - Panel FIJO

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local NetworkClient = game:GetService("NetworkClient")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- Sistema de Key
local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "FlickKeySystem_" .. math.random(1000, 9999)
KeyGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
KeyGui.ResetOnSpawn = false
KeyGui.IgnoreGuiInset = true
KeyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
KeyGui.Enabled = true

local KeyFrame = Instance.new("Frame")
KeyFrame.Parent = KeyGui
KeyFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
KeyFrame.BackgroundTransparency = 0.2
KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
KeyFrame.Size = UDim2.new(0, 300, 0, 200)
KeyFrame.ZIndex = 1000

local KeyGradient = Instance.new("UIGradient")
KeyGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 50, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
}
KeyGradient.Rotation = 45
KeyGradient.Parent = KeyFrame

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 12)
KeyCorner.Parent = KeyFrame

local KeyStroke = Instance.new("UIStroke")
KeyStroke.Color = Color3.fromRGB(0, 255, 255)
KeyStroke.Thickness = 3
KeyStroke.Transparency = 0.3
KeyStroke.Parent = KeyFrame

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Parent = KeyFrame
KeyTitle.BackgroundTransparency = 1
KeyTitle.Position = UDim2.new(0, 0, 0, 10)
KeyTitle.Size = UDim2.new(1, 0, 0, 40)
KeyTitle.Font = Enum.Font.GothamBlack
KeyTitle.Text = "Ingresa la Key (https://discord.gg/8wqtz)"
KeyTitle.TextColor3 = Color3.fromRGB(0, 255, 255)
KeyTitle.TextSize = 18
KeyTitle.TextStrokeTransparency = 0.6
KeyTitle.ZIndex = 1001

local KeyBox = Instance.new("TextBox")
KeyBox.Parent = KeyFrame
KeyBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeyBox.Position = UDim2.new(0, 20, 0, 60)
KeyBox.Size = UDim2.new(0, 260, 0, 50)
KeyBox.PlaceholderText = "Key (ej: LOL)"
KeyBox.Text = ""
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.TextSize = 20
KeyBox.ZIndex = 1001
local KeyBoxCorner = Instance.new("UICorner")
KeyBoxCorner.CornerRadius = UDim.new(0, 8)
KeyBoxCorner.Parent = KeyBox

local VerifyButton = Instance.new("TextButton")
VerifyButton.Parent = KeyFrame
VerifyButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
VerifyButton.Position = UDim2.new(0, 20, 0, 120)
VerifyButton.Size = UDim2.new(0, 260, 0, 50)
VerifyButton.Font = Enum.Font.GothamBold
VerifyButton.Text = "Verificar Key"
VerifyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyButton.TextSize = 20
VerifyButton.ZIndex = 1001
local VerifyCorner = Instance.new("UICorner")
VerifyCorner.CornerRadius = UDim.new(0, 8)
VerifyCorner.Parent = VerifyButton

-- Partículas para Key GUI
local ParticleEmitter = Instance.new("ParticleEmitter")
ParticleEmitter.Parent = KeyFrame
ParticleEmitter.Texture = "rbxassetid://243098098"
ParticleEmitter.Size = NumberSequence.new(0.5)
ParticleEmitter.Transparency = NumberSequence.new(0.5)
ParticleEmitter.Lifetime = NumberRange.new(1, 2)
ParticleEmitter.Rate = 10
ParticleEmitter.Speed = NumberRange.new(2)
ParticleEmitter.Color = ColorSequence.new(Color3.fromRGB(0, 255, 255))
ParticleEmitter.Enabled = true

-- Verificación de Key
local function LoadMainScript()
    KeyGui:Destroy()
    -- Script Principal
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "FlickHackGUI_" .. math.random(1000, 9999)
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Enabled = true

    -- Mensaje de carga
    local LoadMessage = Instance.new("TextLabel")
    LoadMessage.Parent = ScreenGui
    LoadMessage.BackgroundTransparency = 1
    LoadMessage.Position = UDim2.new(0.5, 0, 0.05, 0)
    LoadMessage.Size = UDim2.new(0, 200, 0, 30)
    LoadMessage.Font = Enum.Font.GothamBlack
    LoadMessage.Text = "Flick Hack Loaded! Press H/Insert"
    LoadMessage.TextColor3 = Color3.fromRGB(0, 255, 255)
    LoadMessage.TextSize = 20
    LoadMessage.TextStrokeTransparency = 0.6
    LoadMessage.ZIndex = 1100
    game:GetService("Debris"):AddItem(LoadMessage, 5)

    -- Variables del Aimbot y ESP
    local AimbotEnabled = false
    local ESPEnabled = false
    local SilentAim = false
    local TargetPart = "Head"
    local FOV = 120
    local Smoothness = 0.08
    local WallCheck = true
    local TeamCheck = true
    local PredictMovement = true
    local AimOnClick = false
    local ESPColorEnemy = Color3.fromRGB(255, 0, 0)
    local ESPColorAlly = Color3.fromRGB(0, 0, 255)
    local ESPDistance = 1000
    local VerticalOffset = 0.2

    -- FOV Circle
    local FOVCircle = Instance.new("Frame")
    FOVCircle.Parent = ScreenGui
    FOVCircle.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    FOVCircle.BackgroundTransparency = 0.7
    FOVCircle.Position = UDim2.new(0.5, -FOV, 0.5, -FOV)
    FOVCircle.Size = UDim2.new(0, FOV * 2, 0, FOV * 2)
    FOVCircle.Visible = false
    FOVCircle.ZIndex = 900
    local FOVCorner = Instance.new("UICorner")
    FOVCorner.CornerRadius = UDim.new(1, 0)
    FOVCorner.Parent = FOVCircle

    -- Main Frame (Arrastrable)
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    MainFrame.BackgroundTransparency = 0.3
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -175)
    MainFrame.Size = UDim2.new(0, 400, 0, 400)
    MainFrame.Visible = false
    MainFrame.ZIndex = 1000
    MainFrame.ClipsDescendants = false

    local Gradient = Instance.new("UIGradient")
    Gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 60, 60)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20))
    }
    Gradient.Rotation = 45
    Gradient.Parent = MainFrame

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = MainFrame

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(0, 255, 255)
    Stroke.Thickness = 3
    Stroke.Transparency = 0.3
    Stroke.Parent = MainFrame

    -- Escala para dispositivos
    local UIScale = Instance.new("UIScale")
    UIScale.Scale = UserInputService.TouchEnabled and 0.5 or 1
    UIScale.Parent = MainFrame

    -- Botón flotante para móviles
    local MobileToggleButton = Instance.new("TextButton")
    MobileToggleButton.Parent = ScreenGui
    MobileToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    MobileToggleButton.Position = UDim2.new(0.02, 0, 0.02, 0)
    MobileToggleButton.Size = UDim2.new(0, 120, 0, 120)
    MobileToggleButton.Font = Enum.Font.GothamBlack
    MobileToggleButton.Text = "MENU"
    MobileToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MobileToggleButton.TextSize = 24
    MobileToggleButton.Visible = UserInputService.TouchEnabled
    MobileToggleButton.ZIndex = 1100
    local MobileCorner = Instance.new("UICorner")
    MobileCorner.CornerRadius = UDim.new(0, 60)
    MobileCorner.Parent = MobileToggleButton
    local MobileStroke = Instance.new("UIStroke")
    MobileStroke.Color = Color3.fromRGB(255, 255, 255)
    MobileStroke.Thickness = 2
    MobileStroke.Parent = MobileToggleButton

    -- Animación de pulso para botón móvil
    local function pulseButton()
        while MobileToggleButton.Visible do
            TweenService:Create(MobileToggleButton, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 130, 0, 130)}):Play()
            wait(1)
            TweenService:Create(MobileToggleButton, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 120, 0, 120)}):Play()
            wait(1)
        end
    end
    spawn(pulseButton)

    -- Título
    local Title = Instance.new("TextLabel")
    Title.Parent = MainFrame
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 0, 0, 10)
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.Font = Enum.Font.GothamBlack
    Title.Text = "Flick Ultra Panel"
    Title.TextColor3 = Color3.fromRGB(0, 255, 255)
    Title.TextSize = 30
    Title.TextStrokeTransparency = 0.5
    Title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    Title.ZIndex = 1001

    -- Drag-and-Drop
    local dragging, dragStart, startPos
    MainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    -- Animación de entrada
    local function animateFrame(visible)
        local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut)
        local goal = visible and {Position = UDim2.new(0.5, -200, 0.5, -175)} or {Position = UDim2.new(0.5, -200, 0.5, -600)}
        TweenService:Create(MainFrame, tweenInfo, goal):Play()
    end

    -- Toggle Aimbot
    local AimbotToggle = Instance.new("TextButton")
    AimbotToggle.Parent = MainFrame
    AimbotToggle.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    AimbotToggle.Position = UDim2.new(0, 20, 0, 60)
    AimbotToggle.Size = UDim2.new(0, 180, 0, 80)
    AimbotToggle.Font = Enum.Font.GothamBold
    AimbotToggle.Text = "Aimbot: OFF"
    AimbotToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    AimbotToggle.TextSize = 22
    AimbotToggle.ZIndex = 1001
    local AimbotCorner = Instance.new("UICorner")
    AimbotCorner.CornerRadius = UDim.new(0, 12)
    AimbotCorner.Parent = AimbotToggle

    -- Toggle ESP
    local ESPToggle = Instance.new("TextButton")
    ESPToggle.Parent = MainFrame
    ESPToggle.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    ESPToggle.Position = UDim2.new(0, 200, 0, 60)
    ESPToggle.Size = UDim2.new(0, 180, 0, 80)
    ESPToggle.Font = Enum.Font.GothamBold
    ESPToggle.Text = "ESP: OFF"
    ESPToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    ESPToggle.TextSize = 22
    ESPToggle.ZIndex = 1001
    local ESPCorner = Instance.new("UICorner")
    ESPCorner.CornerRadius = UDim.new(0, 12)
    ESPCorner.Parent = ESPToggle

    -- Toggle Silent Aim
    local SilentToggle = Instance.new("TextButton")
    SilentToggle.Parent = MainFrame
    SilentToggle.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    SilentToggle.Position = UDim2.new(0, 20, 0, 150)
    SilentToggle.Size = UDim2.new(0, 180, 0, 80)
    SilentToggle.Font = Enum.Font.GothamBold
    SilentToggle.Text = "Silent Aim: OFF"
    SilentToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    SilentToggle.TextSize = 22
    SilentToggle.ZIndex = 1001
    local SilentCorner = Instance.new("UICorner")
    SilentCorner.CornerRadius = UDim.new(0, 12)
    SilentCorner.Parent = SilentToggle

    -- Toggle Target Part
    local PartToggle = Instance.new("TextButton")
    PartToggle.Parent = MainFrame
    PartToggle.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    PartToggle.Position = UDim2.new(0, 200, 0, 150)
    PartToggle.Size = UDim2.new(0, 180, 0, 80)
    PartToggle.Font = Enum.Font.GothamBold
    PartToggle.Text = "Target: Head"
    PartToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    PartToggle.TextSize = 22
    PartToggle.ZIndex = 1001
    local PartCorner = Instance.new("UICorner")
    PartCorner.CornerRadius = UDim.new(0, 12)
    PartCorner.Parent = PartToggle

    -- Slider FOV
    local FOVLabel = Instance.new("TextLabel")
    FOVLabel.Parent = MainFrame
    FOVLabel.BackgroundTransparency = 1
    FOVLabel.Position = UDim2.new(0, 20, 0, 240)
    FOVLabel.Size = UDim2.new(0, 100, 0, 30)
    FOVLabel.Font = Enum.Font.Gotham
    FOVLabel.Text = "FOV: 120"
    FOVLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    FOVLabel.TextSize = 20
    FOVLabel.ZIndex = 1001

    local FOVSliderFrame = Instance.new("Frame")
    FOVSliderFrame.Parent = MainFrame
    FOVSliderFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    FOVSliderFrame.Position = UDim2.new(0, 20, 0, 270)
    FOVSliderFrame.Size = UDim2.new(0, 360, 0, 25)
    FOVSliderFrame.ZIndex = 1001
    local FOVSliderCorner = Instance.new("UICorner")
    FOVSliderCorner.CornerRadius = UDim.new(0, 10)
    FOVSliderCorner.Parent = FOVSliderFrame

    local FOVSlider = Instance.new("Frame")
    FOVSlider.Parent = FOVSliderFrame
    FOVSlider.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    FOVSlider.Size = UDim2.new(0.4, 0, 1, 0)
    FOVSlider.ZIndex = 1002
    local FOVSliderCorner = Instance.new("UICorner")
    FOVSliderCorner.CornerRadius = UDim.new(0, 10)
    FOVSliderCorner.Parent = FOVSlider

    local draggingFOV = false
    FOVSliderFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingFOV = true
            TweenService:Create(FOVSliderFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(100, 100, 100)}):Play()
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if draggingFOV and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local pos = input.Position.X
            local relative = math.clamp((pos - FOVSliderFrame.AbsolutePosition.X) / FOVSliderFrame.AbsoluteSize.X, 0, 1)
            FOV = math.floor(relative * 300)
            FOVLabel.Text = "FOV: " .. FOV
            FOVSlider.Position = UDim2.new(relative, 0, 0, 0)
            FOVCircle.Size = UDim2.new(0, FOV * 2, 0, FOV * 2)
            FOVCircle.Position = UDim2.new(0.5, -FOV, 0.5, -FOV)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingFOV = false
            TweenService:Create(FOVSliderFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 80, 80)}):Play()
        end
    end)

    -- Slider Smoothness
    local SmoothLabel = Instance.new("TextLabel")
    SmoothLabel.Parent = MainFrame
    SmoothLabel.BackgroundTransparency = 1
    SmoothLabel.Position = UDim2.new(0, 20, 0, 300)
    SmoothLabel.Size = UDim2.new(0, 100, 0, 30)
    SmoothLabel.Font = Enum.Font.Gotham
    SmoothLabel.Text = "Smooth: 0.08"
    SmoothLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    SmoothLabel.TextSize = 20
    SmoothLabel.ZIndex = 1001

    local SmoothSliderFrame = Instance.new("Frame")
    SmoothSliderFrame.Parent = MainFrame
    SmoothSliderFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    SmoothSliderFrame.Position = UDim2.new(0, 20, 0, 330)
    SmoothSliderFrame.Size = UDim2.new(0, 360, 0, 25)
    SmoothSliderFrame.ZIndex = 1001
    local SmoothSliderCorner = Instance.new("UICorner")
    SmoothSliderCorner.CornerRadius = UDim.new(0, 10)
    SmoothSliderCorner.Parent = SmoothSliderFrame

    local SmoothSlider = Instance.new("Frame")
    SmoothSlider.Parent = SmoothSliderFrame
    SmoothSlider.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    SmoothSlider.Size = UDim2.new(0.16, 0, 1, 0)
    SmoothSlider.ZIndex = 1002
    local SmoothSliderCorner = Instance.new("UICorner")
    SmoothSliderCorner.CornerRadius = UDim.new(0, 10)
    SmoothSliderCorner.Parent = SmoothSlider

    local draggingSmooth = false
    SmoothSliderFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingSmooth = true
            TweenService:Create(SmoothSliderFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(100, 100, 100)}):Play()
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if draggingSmooth and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local pos = input.Position.X
            local relative = math.clamp((pos - SmoothSliderFrame.AbsolutePosition.X) / SmoothSliderFrame.AbsoluteSize.X, 0, 1)
            Smoothness = math.clamp(relative * 0.5, 0.02, 0.5)
            SmoothLabel.Text = "Smooth: " .. string.format("%.2f", Smoothness)
            SmoothSlider.Position = UDim2.new(relative, 0, 0, 0)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingSmooth = false
            TweenService:Create(SmoothSliderFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 80, 80)}):Play()
        end
    end)

    -- Botón Cerrar
    local CloseButton = Instance.new("TextButton")
    CloseButton.Parent = MainFrame
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    CloseButton.Position = UDim2.new(1, -40, 0, 10)
    CloseButton.Size = UDim2.new(0, 40, 0, 40)
    CloseButton.Font = Enum.Font.GothamBlack
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 24
    CloseButton.ZIndex = 1001
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 12)
    CloseCorner.Parent = CloseButton

    -- Aimbot Mejorado
    local function GetClosestPlayer()
        local closest, dist = nil, math.huge
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild(TargetPart) then
                if TeamCheck and player.Team == LocalPlayer.Team then continue end
                local part = player.Character[TargetPart]
                local dist3D = (part.Position - Camera.CFrame.Position).Magnitude
                if dist3D <= ESPDistance then
                    local screenPos, onScreen = Camera:WorldToScreenPoint(part.Position)
                    if onScreen then
                        local delta = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)).Magnitude
                        local dynamicFOV = dist3D > 500 and 80 or FOV
                        if delta < dynamicFOV then
                            local humanoid = player.Character:FindFirstChild("Humanoid")
                            local health = humanoid and humanoid.Health or 100
                            local priority = (health < 30 or dist3D < 100) and dist3D * 0.5 or dist3D
                            if priority < dist then
                                if WallCheck then
                                    local ray = Workspace:Raycast(Camera.CFrame.Position, (part.Position - Camera.CFrame.Position).Unit * 1000)
                                    if ray and ray.Instance:IsDescendantOf(player.Character) then
                                        closest, dist = player, priority
                                    end
                                else
                                    closest, dist = player, priority
                                end
                            end
                        end
                    end
                end
            end
        end
        return closest
    end

    local function PredictPosition(part)
        if not PredictMovement then return part.Position + Vector3.new(0, VerticalOffset, 0) end
        local humanoid = part.Parent:FindFirstChild("Humanoid")
        if humanoid and humanoid.WalkSpeed > 0 then
            local velocity = humanoid.MoveDirection * humanoid.WalkSpeed
            local bodyVelocity = part.Parent:FindFirstChildOfClass("BodyVelocity") and part.Parent.BodyVelocity.Velocity or Vector3.new(0, 0, 0)
            local dist = (part.Position - Camera.CFrame.Position).Magnitude
            local ping = NetworkClient.Latency or 0.1
            local timeToTarget = dist / 100 * (ping * 1.5)
            local jumpOffset = humanoid.Jump and Vector3.new(0, 5, 0) or Vector3.new(0, 0, 0)
            return part.Position + (velocity + bodyVelocity) * timeToTarget + Vector3.new(0, VerticalOffset, 0) + jumpOffset
        end
        return part.Position + Vector3.new(0, VerticalOffset, 0)
    end

    local function AimAt(target)
        if target and target.Character and target.Character:FindFirstChild(TargetPart) then
            local part = target.Character[TargetPart]
            local targetPos = PredictPosition(part)
            if SilentAim then
                -- Simular disparo sin mover cámara (mock)
                local ray = Workspace:Raycast(Camera.CFrame.Position, (targetPos - Camera.CFrame.Position).Unit * 1000)
                if ray and ray.Instance:IsDescendantOf(target.Character) then
                    -- Aquí iría la lógica de disparo si el juego lo permite
                end
            else
                local targetCFrame = CFrame.lookAt(Camera.CFrame.Position, targetPos)
                local smooth = Smoothness * (1 - math.exp(-dist / 100)) -- No lineal
                Camera.CFrame = Camera.CFrame:Lerp(targetCFrame, smooth)
            end
        end
    end

    -- ESP Mejorado con Tracers
    local ESPs = {}
    local function CreateESP(player)
        if not player.Character or ESPs[player] then return end
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ESP_" .. player.Name .. "_" .. math.random(1000, 9999)
        billboard.Parent = ScreenGui
        billboard.Adornee = player.Character:FindFirstChild("HumanoidRootPart")
        billboard.Size = UDim2.new(0, 80, 0, 80)
        billboard.StudsOffset = Vector3.new(0, 4, 0)
        billboard.AlwaysOnTop = true
        billboard.ZIndex = 800

        local frame = Instance.new("Frame")
        frame.Parent = billboard
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundTransparency = 1
        frame.BorderSizePixel = 3
        frame.BorderColor3 = ESPColorEnemy

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Parent = billboard
        nameLabel.BackgroundTransparency = 1
        nameLabel.Position = UDim2.new(0, 0, -0.7, 0)
        nameLabel.Size = UDim2.new(1, 0, 0, 20)
        nameLabel.Font = Enum.Font.Gotham
        nameLabel.Text = player.Name
        nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        nameLabel.TextSize = 18
        nameLabel.TextStrokeTransparency = 0.5

        local distLabel = Instance.new("TextLabel")
        distLabel.Parent = billboard
        distLabel.BackgroundTransparency = 1
        distLabel.Position = UDim2.new(0, 0, 1.7, 0)
        distLabel.Size = UDim2.new(1, 0, 0, 20)
        distLabel.Font = Enum.Font.Gotham
        distLabel.Text = "0 studs"
        distLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        distLabel.TextSize = 18
        distLabel.TextStrokeTransparency = 0.5

        local healthBar = Instance.new("Frame")
        healthBar.Parent = billboard
        healthBar.Position = UDim2.new(-0.2, 0, 0, 0)
        healthBar.Size = UDim2.new(0.1, 0, 1, 0)
        healthBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        local healthCorner = Instance.new("UICorner")
        healthCorner.CornerRadius = UDim.new(0, 5)
        healthCorner.Parent = healthBar

        local tracer = Instance.new("LineHandleAdornment")
        tracer.Name = "Tracer_" .. player.Name
        tracer.Adornee = player.Character:FindFirstChild("HumanoidRootPart")
        tracer.Color3 = ESPColorEnemy
        tracer.Thickness = 2
        tracer.Transparency = 0.5
        tracer.Length = 1000
        tracer.Parent = ScreenGui
        tracer.ZIndex = 700

        ESPs[player] = {billboard = billboard, frame = frame, distLabel = distLabel, healthBar = healthBar, tracer = tracer}
    end

    local lastESPUpdate = 0
    local function UpdateESP()
        if tick() - lastESPUpdate < 0.15 then return end
        lastESPUpdate = tick()
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local dist = (player.Character.HumanoidRootPart.Position - Camera.CFrame.Position).Magnitude
                if dist <= ESPDistance then
                    if not ESPs[player] then
                        CreateESP(player)
                    end
                    if ESPs[player] then
                        local health = player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health or 100
                        local isAlly = TeamCheck and player.Team == LocalPlayer.Team
                        local color = isAlly and ESPColorAlly or ESPColorEnemy
                        local transparency = math.clamp(0.2 + (dist / ESPDistance) * 0.8, 0.2, 1)
                        ESPs[player].frame.BorderColor3 = color
                        ESPs[player].distLabel.Text = math.floor(dist) .. " studs"
                        ESPs[player].billboard.Transparency = transparency
                        ESPs[player].healthBar.Size = UDim2.new(0.1, 0, health/100, 0)
                        TweenService:Create(ESPs[player].healthBar, TweenInfo.new(0.5), {BackgroundColor3 = Color3.fromRGB(255 * (1 - health/100), 255 * (health/100), 0)}):Play()
                        ESPs[player].tracer.Color3 = color
                        ESPs[player].tracer.Transparency = transparency
                        local camPos = Camera.CFrame.Position
                        local rootPos = player.Character.HumanoidRootPart.Position
                        ESPs[player].tracer.CFrame = CFrame.new(rootPos, camPos) * CFrame.new(0, 0, -dist/2)
                        ESPs[player].tracer.Length = dist
                    end
                else
                    if ESPs[player] then
                        ESPs[player].billboard:Destroy()
                        ESPs[player].tracer:Destroy()
                        ESPs[player] = nil
                    end
                end
            end
        end
    end

    -- Limpieza de ESP
    Players.PlayerRemoving:Connect(function(player)
        if ESPs[player] then
            ESPs[player].billboard:Destroy()
            ESPs[player].tracer:Destroy()
            ESPs[player] = nil
        end
    end)

    Players.ChildAdded:Connect(function(player)
        player.CharacterAdded:Connect(function()
            if ESPEnabled then
                CreateESP(player)
            end
        end)
    end)

    -- Loop principal
    local isClicking = false
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if input.UserInputType == Enum.UserInputType.MouseButton2 then
            isClicking = true
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton2 then
            isClicking = false
        end
    end)

    RunService.Heartbeat:Connect(function()
        FOVCircle.Visible = AimbotEnabled and not SilentAim
        if AimbotEnabled and (not AimOnClick or isClicking) then
            local target = GetClosestPlayer()
            if target then
                AimAt(target)
            end
        end
        if ESPEnabled then
            UpdateESP()
        end
    end)

    -- Eventos de GUI
    AimbotToggle.MouseButton1Click:Connect(function()
        AimbotEnabled = not AimbotEnabled
        AimbotToggle.Text = AimbotEnabled and "Aimbot: ON" or "Aimbot: OFF"
        AimbotToggle.BackgroundColor3 = AimbotEnabled and Color3.fromRGB(0, 255, 50) or Color3.fromRGB(255, 50, 50)
        TweenService:Create(AimbotToggle, TweenInfo.new(0.2), {Size = AimbotEnabled and UDim2.new(0, 185, 0, 85) or UDim2.new(0, 180, 0, 80)}):Play()
    end)

    ESPToggle.MouseButton1Click:Connect(function()
        ESPEnabled = not ESPEnabled
        ESPToggle.Text = ESPEnabled and "ESP: ON" or "ESP: OFF"
        ESPToggle.BackgroundColor3 = ESPEnabled and Color3.fromRGB(0, 255, 50) or Color3.fromRGB(255, 50, 50)
        TweenService:Create(ESPToggle, TweenInfo.new(0.2), {Size = ESPEnabled and UDim2.new(0, 185, 0, 85) or UDim2.new(0, 180, 0, 80)}):Play()
        if not ESPEnabled then
            for _, esp in pairs(ESPs) do
                esp.billboard:Destroy()
                esp.tracer:Destroy()
            end
            ESPs = {}
        end
    end)

    SilentToggle.MouseButton1Click:Connect(function()
        SilentAim = not SilentAim
        SilentToggle.Text = SilentAim and "Silent Aim: ON" or "Silent Aim: OFF"
        SilentToggle.BackgroundColor3 = SilentAim and Color3.fromRGB(0, 255, 50) or Color3.fromRGB(255, 50, 50)
        TweenService:Create(SilentToggle, TweenInfo.new(0.2), {Size = SilentAim and UDim2.new(0, 185, 0, 85) or UDim2.new(0, 180, 0, 80)}):Play()
    end)

    PartToggle.MouseButton1Click:Connect(function()
        TargetPart = TargetPart == "Head" and "Torso" or "Head"
        PartToggle.Text = "Target: " .. TargetPart
        TweenService:Create(PartToggle, TweenInfo.new(0.2), {Size = UDim2.new(0, 180, 0, 80)}):Play()
    end)

    CloseButton.MouseButton1Click:Connect(function()
        animateFrame(false)
    end)

    MobileToggleButton.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            animateFrame(not MainFrame.Visible)
        end
    end)

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == Enum.KeyCode.Insert or input.KeyCode == Enum.KeyCode.H then
            animateFrame(not MainFrame.Visible)
        end
    end)

    print("🎯 Flick Ultra Panel cargado. Key aceptada. Botón MENU (móvil) o H/Insert (PC).")
end

VerifyButton.MouseButton1Click:Connect(function()
    local inputKey = KeyBox.Text:upper():gsub("%s+", "")
    if inputKey == "LOL" then
        LoadMainScript()
    else
        KeyTitle.Text = "Key inválida. Únete a https://discord.gg/8wqtz"
        KeyBox.Text = ""
        if UserInputService.TouchEnabled then
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Touch then
                    TweenService:Create(KeyFrame, TweenInfo.new(0.1), {Position = UDim2.new(0.5, -150, 0.5, -95)}):Play()
                    wait(0.1)
                    TweenService:Create(KeyFrame, TweenInfo.new(0.1), {Position = UDim2.new(0.5, -150, 0.5, -100)}):Play()
                end
            end)
        end
    end
end)

KeyBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        VerifyButton.MouseButton1Click:Fire()
    end
end)

-- Auto-focus en textbox
KeyBox:CaptureFocus()
print("Ty For Use This")
