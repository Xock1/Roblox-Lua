--[[ Made by VantaXock if you will modify this Liblary credit me! ]]
local Library = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MinecraftUI" -- Minecraft Text lol
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

local keyVerified = false
local correctKey = "default123"

local NotificationContainer = Instance.new("Frame")
NotificationContainer.Name = "NotificationContainer"
NotificationContainer.Parent = ScreenGui
NotificationContainer.Position = UDim2.new(1, -320, 0, 20)
NotificationContainer.Size = UDim2.new(0, 300, 1, -40)
NotificationContainer.BackgroundTransparency = 1
NotificationContainer.ZIndex = 100

local NotificationLayout = Instance.new("UIListLayout")
NotificationLayout.Parent = NotificationContainer
NotificationLayout.Padding = UDim.new(0, 10)
NotificationLayout.VerticalAlignment = Enum.VerticalAlignment.Top

function Library:Notification(config)
    config = config or {}
    local title = config.Title or "Notification"
    local content = config.Content or "This is a notification"
    local duration = config.Duration or 3
    local color = config.Color or Color3.fromRGB(0, 162, 255)
    
    local NotificationFrame = Instance.new("Frame")
    NotificationFrame.Parent = NotificationContainer
    NotificationFrame.Size = UDim2.new(1, 0, 0, 80)
    NotificationFrame.Position = UDim2.new(1, 0, 0, 0)
    NotificationFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    NotificationFrame.BorderSizePixel = 0
    NotificationFrame.ZIndex = 101
    
    local NotificationCorner = Instance.new("UICorner")
    NotificationCorner.CornerRadius = UDim.new(0, 8)
    NotificationCorner.Parent = NotificationFrame
    
    local NotificationStroke = Instance.new("UIStroke")
    NotificationStroke.Color = color
    NotificationStroke.Thickness = 2
    NotificationStroke.Parent = NotificationFrame
    
    local AccentBar = Instance.new("Frame")
    AccentBar.Parent = NotificationFrame
    AccentBar.Size = UDim2.new(0, 4, 1, 0)
    AccentBar.BackgroundColor3 = color
    AccentBar.BorderSizePixel = 0
    AccentBar.ZIndex = 102
    
    local AccentCorner = Instance.new("UICorner")
    AccentCorner.CornerRadius = UDim.new(0, 8)
    AccentCorner.Parent = AccentBar
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Parent = NotificationFrame
    TitleLabel.Position = UDim2.new(0, 15, 0, 5)
    TitleLabel.Size = UDim2.new(1, -25, 0, 25)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 14
    TitleLabel.Font = Enum.Font.Code
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.ZIndex = 102
    
    local ContentLabel = Instance.new("TextLabel")
    ContentLabel.Parent = NotificationFrame
    ContentLabel.Position = UDim2.new(0, 15, 0, 30)
    ContentLabel.Size = UDim2.new(1, -25, 0, 45)
    ContentLabel.BackgroundTransparency = 1
    ContentLabel.Text = content
    ContentLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    ContentLabel.TextSize = 11
    ContentLabel.Font = Enum.Font.Code
    ContentLabel.TextXAlignment = Enum.TextXAlignment.Left
    ContentLabel.TextYAlignment = Enum.TextYAlignment.Top
    ContentLabel.TextWrapped = true
    ContentLabel.ZIndex = 102
    
    local slideInTween = TweenService:Create(NotificationFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
        Position = UDim2.new(0, 0, 0, 0)
    })
    slideInTween:Play()
    
    spawn(function()
        wait(duration)
        local slideOutTween = TweenService:Create(NotificationFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
            Position = UDim2.new(1, 0, 0, 0)
        })
        slideOutTween:Play()
        slideOutTween.Completed:Connect(function()
            NotificationFrame:Destroy()
        end)
    end)
end

function Library:KeySystem(config)
    config = config or {}
    local key = config.Key or "default123"
    local title = config.Title or "Key System"
    local subtitle = config.Subtitle or "Enter the correct key to continue"
    local savekey = config.SaveKey or false
    local callback = config.Callback or function() end
    
    correctKey = key
    
    if savekey then
        local savedKey = game.Players.LocalPlayer:FindFirstChild("SavedKey")
        if savedKey and savedKey.Value == key then
            keyVerified = true
            callback()
            return
        end
    end
    
    local KeyFrame = Instance.new("Frame")
    KeyFrame.Name = "KeySystem"
    KeyFrame.Parent = ScreenGui
    KeyFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    KeyFrame.Size = UDim2.new(0, 400, 0, 300)
    KeyFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    KeyFrame.BorderSizePixel = 0
    KeyFrame.ZIndex = 200
    
    local KeyCorner = Instance.new("UICorner")
    KeyCorner.CornerRadius = UDim.new(0, 12)
    KeyCorner.Parent = KeyFrame
    
    local KeyStroke = Instance.new("UIStroke")
    KeyStroke.Color = Color3.fromRGB(40, 40, 40)
    KeyStroke.Thickness = 2
    KeyStroke.Parent = KeyFrame
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Parent = KeyFrame
    TitleLabel.Position = UDim2.new(0, 0, 0, 20)
    TitleLabel.Size = UDim2.new(1, 0, 0, 40)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 20
    TitleLabel.Font = Enum.Font.Code
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
    TitleLabel.ZIndex = 201
    
    local SubtitleLabel = Instance.new("TextLabel")
    SubtitleLabel.Parent = KeyFrame
    SubtitleLabel.Position = UDim2.new(0, 0, 0, 70)
    SubtitleLabel.Size = UDim2.new(1, 0, 0, 30)
    SubtitleLabel.BackgroundTransparency = 1
    SubtitleLabel.Text = subtitle
    SubtitleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    SubtitleLabel.TextSize = 12
    SubtitleLabel.Font = Enum.Font.Code
    SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Center
    SubtitleLabel.ZIndex = 201
    
    local KeyInput = Instance.new("TextBox")
    KeyInput.Parent = KeyFrame
    KeyInput.Position = UDim2.new(0, 50, 0, 130)
    KeyInput.Size = UDim2.new(1, -100, 0, 40)
    KeyInput.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    KeyInput.BorderSizePixel = 0
    KeyInput.Text = ""
    KeyInput.PlaceholderText = "Enter key here..."
    KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyInput.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
    KeyInput.TextSize = 14
    KeyInput.Font = Enum.Font.Code
    KeyInput.TextXAlignment = Enum.TextXAlignment.Center
    KeyInput.ZIndex = 201
    
    local InputCorner = Instance.new("UICorner")
    InputCorner.CornerRadius = UDim.new(0, 6)
    InputCorner.Parent = KeyInput
    
    local SubmitBtn = Instance.new("TextButton")
    SubmitBtn.Parent = KeyFrame
    SubmitBtn.Position = UDim2.new(0, 50, 0, 190)
    SubmitBtn.Size = UDim2.new(1, -100, 0, 35)
    SubmitBtn.BackgroundColor3 = Color3.fromRGB(40, 167, 69)
    SubmitBtn.BorderSizePixel = 0
    SubmitBtn.Text = "Submit"
    SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    SubmitBtn.TextSize = 14
    SubmitBtn.Font = Enum.Font.Code
    SubmitBtn.ZIndex = 201
    
    local SubmitCorner = Instance.new("UICorner")
    SubmitCorner.CornerRadius = UDim.new(0, 6)
    SubmitCorner.Parent = SubmitBtn
    
    local function checkKey()
        if KeyInput.Text == correctKey then
            keyVerified = true
            
            if savekey then
                local savedKey = Instance.new("StringValue")
                savedKey.Name = "SavedKey"
                savedKey.Value = correctKey
                savedKey.Parent = game.Players.LocalPlayer
            end
            
            local closeTween = TweenService:Create(KeyFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
                Size = UDim2.new(0, 0, 0, 0)
            })
            closeTween:Play()
            closeTween.Completed:Connect(function()
                KeyFrame:Destroy()
            end)
            
            Library:Notification({
                Title = "Success!",
                Content = "Key verified successfully",
                Color = Color3.fromRGB(40, 167, 69)
            })
            
            callback()
        else
            Library:Notification({
                Title = "Error!",
                Content = "Invalid key entered",
                Color = Color3.fromRGB(220, 53, 69)
            })
            
            local originalPos = KeyFrame.Position
            local shakeTween1 = TweenService:Create(KeyFrame, TweenInfo.new(0.1), {Position = UDim2.new(0.5, -210, 0.5, -150)})
            shakeTween1:Play()
            shakeTween1.Completed:Connect(function()
                local shakeTween2 = TweenService:Create(KeyFrame, TweenInfo.new(0.1), {Position = UDim2.new(0.5, -190, 0.5, -150)})
                shakeTween2:Play()
                shakeTween2.Completed:Connect(function()
                    TweenService:Create(KeyFrame, TweenInfo.new(0.1), {Position = originalPos}):Play()
                end)
            end)
        end
    end
    
    SubmitBtn.MouseButton1Click:Connect(checkKey)
    KeyInput.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            checkKey()
        end
    end)
end

function Library:CreateWindow(title)
    if not keyVerified and correctKey ~= "default123" then
        return nil
    end
    
    title = title or "UI Library"
    
    local Phone = Instance.new("Frame")
    Phone.Name = "Phone"
    Phone.Parent = ScreenGui
    Phone.Position = UDim2.new(0, 50, 0, 50)
    Phone.Size = UDim2.new(0, 400, 0, 500)
    Phone.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Phone.BorderSizePixel = 0
    Phone.Active = true
    Phone.Draggable = false
    
    local PhoneCorner = Instance.new("UICorner")
    PhoneCorner.CornerRadius = UDim.new(0, 12)
    PhoneCorner.Parent = Phone
    
    local PhoneBorder = Instance.new("UIStroke")
    PhoneBorder.Color = Color3.fromRGB(40, 40, 40)
    PhoneBorder.Thickness = 2
    PhoneBorder.Parent = Phone
    
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Parent = Phone
    TitleBar.Size = UDim2.new(1, 0, 0, 35)
    TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TitleBar.BorderSizePixel = 0
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 12)
    TitleCorner.Parent = TitleBar
    
    local TitleFix = Instance.new("Frame")
    TitleFix.Parent = TitleBar
    TitleFix.Position = UDim2.new(0, 0, 0.7, 0)
    TitleFix.Size = UDim2.new(1, 0, 0.3, 0)
    TitleFix.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TitleFix.BorderSizePixel = 0
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Parent = TitleBar
    TitleLabel.Size = UDim2.new(1, -70, 1, 0)
    TitleLabel.Position = UDim2.new(0, 10, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 14
    TitleLabel.Font = Enum.Font.Code
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local MinimizeBtn = Instance.new("TextButton")
    MinimizeBtn.Parent = TitleBar
    MinimizeBtn.Position = UDim2.new(1, -60, 0, 5)
    MinimizeBtn.Size = UDim2.new(0, 25, 0, 25)
    MinimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 193, 7)
    MinimizeBtn.Text = "-"
    MinimizeBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
    MinimizeBtn.TextSize = 16
    MinimizeBtn.Font = Enum.Font.Code
    MinimizeBtn.BorderSizePixel = 0
    
    local MinCorner = Instance.new("UICorner")
    MinCorner.CornerRadius = UDim.new(0, 4)
    MinCorner.Parent = MinimizeBtn
    
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Parent = TitleBar
    CloseBtn.Position = UDim2.new(1, -30, 0, 5)
    CloseBtn.Size = UDim2.new(0, 25, 0, 25)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 53, 69)
    CloseBtn.Text = "×"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.TextSize = 14
    CloseBtn.Font = Enum.Font.Code
    CloseBtn.BorderSizePixel = 0
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 4)
    CloseCorner.Parent = CloseBtn
    
    local TabContainer = Instance.new("ScrollingFrame")
    TabContainer.Name = "TabContainer"
    TabContainer.Parent = Phone
    TabContainer.Position = UDim2.new(0, 0, 0, 35)
    TabContainer.Size = UDim2.new(1, 0, 0, 40)
    TabContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    TabContainer.ScrollBarThickness = 4
    TabContainer.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 60)
    TabContainer.BorderSizePixel = 0
    TabContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabContainer.ScrollingDirection = Enum.ScrollingDirection.X
    
    local TabLayout = Instance.new("UIListLayout")
    TabLayout.Parent = TabContainer
    TabLayout.FillDirection = Enum.FillDirection.Horizontal
    TabLayout.Padding = UDim.new(0, 5)
    TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    TabLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    
    local TabPadding = Instance.new("UIPadding")
    TabPadding.Parent = TabContainer
    TabPadding.PaddingLeft = UDim.new(0, 10)
    TabPadding.PaddingRight = UDim.new(0, 10)
    TabPadding.PaddingTop = UDim.new(0, 5)
    TabPadding.PaddingBottom = UDim.new(0, 5)
    
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Name = "ContentContainer"
    ContentContainer.Parent = Phone
    ContentContainer.Position = UDim2.new(0, 0, 0, 75)
    ContentContainer.Size = UDim2.new(1, 0, 1, -75)
    ContentContainer.BackgroundTransparency = 1
    ContentContainer.BorderSizePixel = 0
    
    TabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TabContainer.CanvasSize = UDim2.new(0, TabLayout.AbsoluteContentSize.X + 20, 0, 0)
    end)

    local dragging = false
    local dragInput, mousePos, framePos
    local dragSpeed = 0.25
    
    local function updateInput(input)
        if dragging then
            local delta = input.Position - mousePos
            local targetPos = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
            TweenService:Create(Phone, TweenInfo.new(dragSpeed, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Position = targetPos
            }):Play()
        end
    end
    
    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            mousePos = input.Position
            framePos = Phone.Position
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            if dragging then
                updateInput(input)
            end
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    local isMinimized = false
    MinimizeBtn.MouseButton1Click:Connect(function()
        if not isMinimized then
            TabContainer.Visible = false
            ContentContainer.Visible = false
            TweenService:Create(Phone, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
                Size = UDim2.new(0, 400, 0, 35)
            }):Play()
            MinimizeBtn.Text = "+"
            isMinimized = true
        else
            TabContainer.Visible = true
            ContentContainer.Visible = true
            TweenService:Create(Phone, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
                Size = UDim2.new(0, 400, 0, 500)
            }):Play()
            MinimizeBtn.Text = "-"
            isMinimized = false
        end
    end)
    
    CloseBtn.MouseButton1Click:Connect(function()
        TweenService:Create(Phone, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
            Size = UDim2.new(0, 0, 0, 0)
        }):Play()
        spawn(function()
            wait(0.3)
            ScreenGui:Destroy()
        end)
    end)
    
    local Window = {}
    local tabs = {}
    local currentTab = nil
    
    function Window:Tab(config)
        config = config or {}
        local text = config.Text or "Tab"
        
        local TabButton = Instance.new("TextButton")
        TabButton.Parent = TabContainer
        TabButton.Size = UDim2.new(0, 80, 1, -10)
        TabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        TabButton.BorderSizePixel = 0
        TabButton.Text = text
        TabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
        TabButton.TextSize = 11
        TabButton.Font = Enum.Font.Code
        
        local TabCorner = Instance.new("UICorner")
        TabCorner.CornerRadius = UDim.new(0, 6)
        TabCorner.Parent = TabButton
        
        local TabContent = Instance.new("ScrollingFrame")
        TabContent.Name = text .. "Content"
        TabContent.Parent = ContentContainer
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.BackgroundTransparency = 1
        TabContent.ScrollBarThickness = 4
        TabContent.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 60)
        TabContent.BorderSizePixel = 0
        TabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        TabContent.Visible = false
        
        local ContentLayout = Instance.new("UIListLayout")
        ContentLayout.Parent = TabContent
        ContentLayout.Padding = UDim.new(0, 8)
        ContentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        
        local ContentPadding = Instance.new("UIPadding")
        ContentPadding.Parent = TabContent
        ContentPadding.PaddingTop = UDim.new(0, 10)
        ContentPadding.PaddingBottom = UDim.new(0, 10)
        ContentPadding.PaddingLeft = UDim.new(0, 10)
        ContentPadding.PaddingRight = UDim.new(0, 10)
        
        ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabContent.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 20)
        end)
        
        TabButton.MouseButton1Click:Connect(function()
            for _, tab in pairs(tabs) do
                tab.content.Visible = false
                tab.button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                tab.button.TextColor3 = Color3.fromRGB(200, 200, 200)
            end
            
            TabContent.Visible = true
            TabButton.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
            TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            currentTab = TabContent
        end)
        
        local tab = {
            button = TabButton,
            content = TabContent,
            name = text
        }
        table.insert(tabs, tab)
        
        if #tabs == 1 then
            TabContent.Visible = true
            TabButton.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
            TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            currentTab = TabContent
        end
        
        local Tab = {}
        
        function Tab:TextLabel(config)
    config = config or {}
    local text = config.Text or "Text Label"
    local size = config.Size or 12
    local color = config.Color or Color3.fromRGB(255, 255, 255)
    local backgroundColor = config.BackgroundColor or Color3.fromRGB(35, 35, 35)
    local borderColor = config.BorderColor or Color3.fromRGB(60, 60, 60)
    
    local LabelFrame = Instance.new("Frame")
    LabelFrame.Parent = TabContent
    LabelFrame.Size = UDim2.new(1, -20, 0, 35)
    LabelFrame.BackgroundColor3 = backgroundColor
    LabelFrame.BorderSizePixel = 0
    
    local LabelCorner = Instance.new("UICorner")
    LabelCorner.CornerRadius = UDim.new(0, 6)
    LabelCorner.Parent = LabelFrame
    
    local LabelStroke = Instance.new("UIStroke")
    LabelStroke.Color = borderColor
    LabelStroke.Thickness = 1
    LabelStroke.Parent = LabelFrame
    
    local Label = Instance.new("TextLabel")
    Label.Parent = LabelFrame
    Label.Size = UDim2.new(1, -20, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = color
    Label.TextSize = size
    Label.Font = Enum.Font.Code
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextYAlignment = Enum.TextYAlignment.Center
    Label.TextWrapped = true
    
    return LabelFrame
end
        
        function Tab:ColorPicker(config)
            config = config or {}
            local text = config.Text or "Color Picker"
            local default = config.Default or Color3.fromRGB(255, 0, 0)
            local callback = config.Callback or function() end
            
            local ColorFrame = Instance.new("Frame")
            ColorFrame.Parent = TabContent
            ColorFrame.Size = UDim2.new(1, -20, 0, 30)
            ColorFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            ColorFrame.BorderSizePixel = 0
            
            local ColorCorner = Instance.new("UICorner")
            ColorCorner.CornerRadius = UDim.new(0, 6)
            ColorCorner.Parent = ColorFrame
            
            local ColorStroke = Instance.new("UIStroke")
            ColorStroke.Color = Color3.fromRGB(60, 60, 60)
            ColorStroke.Thickness = 1
            ColorStroke.Parent = ColorFrame
            
            local ColorLabel = Instance.new("TextLabel")
            ColorLabel.Parent = ColorFrame
            ColorLabel.Size = UDim2.new(0.7, -10, 1, 0)
            ColorLabel.Position = UDim2.new(0, 10, 0, 0)
            ColorLabel.BackgroundTransparency = 1
            ColorLabel.Text = text
            ColorLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            ColorLabel.TextSize = 12
            ColorLabel.Font = Enum.Font.Code
            ColorLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            local ColorDisplay = Instance.new("Frame")
            ColorDisplay.Parent = ColorFrame
            ColorDisplay.Position = UDim2.new(0.7, 0, 0, 5)
            ColorDisplay.Size = UDim2.new(0.3, -15, 0, 20)
            ColorDisplay.BackgroundColor3 = default
            ColorDisplay.BorderSizePixel = 0
            
            local DisplayCorner = Instance.new("UICorner")
            DisplayCorner.CornerRadius = UDim.new(0, 4)
            DisplayCorner.Parent = ColorDisplay
            
            local ColorButton = Instance.new("TextButton")
            ColorButton.Parent = ColorDisplay
            ColorButton.Size = UDim2.new(1, 0, 1, 0)
            ColorButton.BackgroundTransparency = 1
            ColorButton.Text = ""
            
            local currentColor = default
            
            ColorButton.MouseButton1Click:Connect(function()
                local colors = {
                    Color3.fromRGB(255, 0, 0),
                    Color3.fromRGB(255, 165, 0),
                    Color3.fromRGB(255, 255, 0),
                    Color3.fromRGB(0, 255, 0),
                    Color3.fromRGB(0, 255, 255),
                    Color3.fromRGB(0, 0, 255),
                    Color3.fromRGB(128, 0, 128),
                    Color3.fromRGB(255, 192, 203),
                    Color3.fromRGB(255, 255, 255),
                    Color3.fromRGB(128, 128, 128),
                    Color3.fromRGB(0, 0, 0)
                }
                
                local currentIndex = 1
                for i, color in ipairs(colors) do
                    if color == currentColor then
                        currentIndex = i
                        break
                    end
                end
currentIndex = currentIndex + 1
                if currentIndex > #colors then
                    currentIndex = 1
                end
                
                currentColor = colors[currentIndex]
                ColorDisplay.BackgroundColor3 = currentColor
                callback(currentColor)
            end)
            
            return ColorFrame
        end
        
        function Tab:Keybind(config)
            config = config or {}
            local text = config.Text or "Keybind"
            local default = config.Default or Enum.KeyCode.E
            local callback = config.Callback or function() end
            
            local KeybindFrame = Instance.new("Frame")
            KeybindFrame.Parent = TabContent
            KeybindFrame.Size = UDim2.new(1, -20, 0, 30)
            KeybindFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            KeybindFrame.BorderSizePixel = 0
            
            local KeybindCorner = Instance.new("UICorner")
            KeybindCorner.CornerRadius = UDim.new(0, 6)
            KeybindCorner.Parent = KeybindFrame
            
            local KeybindStroke = Instance.new("UIStroke")
            KeybindStroke.Color = Color3.fromRGB(60, 60, 60)
            KeybindStroke.Thickness = 1
            KeybindStroke.Parent = KeybindFrame
            
            local KeybindLabel = Instance.new("TextLabel")
            KeybindLabel.Parent = KeybindFrame
            KeybindLabel.Size = UDim2.new(0.6, -10, 1, 0)
            KeybindLabel.Position = UDim2.new(0, 10, 0, 0)
            KeybindLabel.BackgroundTransparency = 1
            KeybindLabel.Text = text
            KeybindLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            KeybindLabel.TextSize = 12
            KeybindLabel.Font = Enum.Font.Code
            KeybindLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            local KeybindButton = Instance.new("TextButton")
            KeybindButton.Parent = KeybindFrame
            KeybindButton.Position = UDim2.new(0.6, 0, 0, 3)
            KeybindButton.Size = UDim2.new(0.4, -13, 0, 24)
            KeybindButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            KeybindButton.BorderSizePixel = 0
            KeybindButton.Text = default.Name
            KeybindButton.TextColor3 = Color3.fromRGB(200, 200, 200)
            KeybindButton.TextSize = 11
            KeybindButton.Font = Enum.Font.Code
            
            local KeybindBtnCorner = Instance.new("UICorner")
            KeybindBtnCorner.CornerRadius = UDim.new(0, 4)
            KeybindBtnCorner.Parent = KeybindButton
            
            local currentKey = default
            local listening = false
            local connection
            
            KeybindButton.MouseButton1Click:Connect(function()
                if listening then return end
                
                listening = true
                KeybindButton.Text = "..."
                KeybindButton.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
                
                connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
                    if gameProcessed then return end
                    
                    if input.UserInputType == Enum.UserInputType.Keyboard then
                        currentKey = input.KeyCode
                        KeybindButton.Text = input.KeyCode.Name
                        KeybindButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                        listening = false
                        connection:Disconnect()
                    end
                end)
            end)
            
            UserInputService.InputBegan:Connect(function(input, gameProcessed)
                if gameProcessed or listening then return end
                
                if input.KeyCode == currentKey then
                    callback()
                end
            end)
            
            return KeybindFrame
        end
        
        function Tab:Button(config)
            config = config or {}
            local text = config.Text or "Button"
            local callback = config.Callback or function() end
            
            local Button = Instance.new("TextButton")
            Button.Parent = TabContent
            Button.Size = UDim2.new(1, -20, 0, 30)
            Button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            Button.BorderSizePixel = 0
            Button.Text = text
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 12
            Button.Font = Enum.Font.Code
            
            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 6)
            ButtonCorner.Parent = Button
            
            local ButtonStroke = Instance.new("UIStroke")
            ButtonStroke.Color = Color3.fromRGB(60, 60, 60)
            ButtonStroke.Thickness = 1
            ButtonStroke.Parent = Button
            
            Button.MouseEnter:Connect(function()
                TweenService:Create(Button, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                }):Play()
            end)
            
            Button.MouseLeave:Connect(function()
                TweenService:Create(Button, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                }):Play()
            end)
            
            Button.MouseButton1Click:Connect(function()
                TweenService:Create(Button, TweenInfo.new(0.1), {
                    Size = UDim2.new(1, -25, 0, 28)
                }):Play()
                spawn(function()
                    wait(0.1)
                    TweenService:Create(Button, TweenInfo.new(0.1), {
                        Size = UDim2.new(1, -20, 0, 30)
                    }):Play()
                end)
                callback()
            end)
            
            return Button
        end
        
        function Tab:Toggle(config)
            config = config or {}
            local text = config.Text or "Toggle"
            local default = config.Default or false
            local callback = config.Callback or function() end
            
            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Parent = TabContent
            ToggleFrame.Size = UDim2.new(1, -20, 0, 30)
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            ToggleFrame.BorderSizePixel = 0
            
            local ToggleCorner = Instance.new("UICorner")
            ToggleCorner.CornerRadius = UDim.new(0, 6)
            ToggleCorner.Parent = ToggleFrame
            
            local ToggleStroke = Instance.new("UIStroke")
            ToggleStroke.Color = Color3.fromRGB(60, 60, 60)
            ToggleStroke.Thickness = 1
            ToggleStroke.Parent = ToggleFrame
            
            local ToggleLabel = Instance.new("TextLabel")
            ToggleLabel.Parent = ToggleFrame
            ToggleLabel.Size = UDim2.new(1, -50, 1, 0)
            ToggleLabel.Position = UDim2.new(0, 10, 0, 0)
            ToggleLabel.BackgroundTransparency = 1
            ToggleLabel.Text = text
            ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleLabel.TextSize = 12
            ToggleLabel.Font = Enum.Font.Code
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            local ToggleButton = Instance.new("TextButton")
            ToggleButton.Parent = ToggleFrame
            ToggleButton.Position = UDim2.new(1, -35, 0, 5)
            ToggleButton.Size = UDim2.new(0, 30, 0, 20)
            ToggleButton.BackgroundColor3 = default and Color3.fromRGB(40, 167, 69) or Color3.fromRGB(108, 117, 125)
            ToggleButton.BorderSizePixel = 0
            ToggleButton.Text = ""
            
            local ToggleBtnCorner = Instance.new("UICorner")
            ToggleBtnCorner.CornerRadius = UDim.new(0, 10)
            ToggleBtnCorner.Parent = ToggleButton
            
            local ToggleCircle = Instance.new("Frame")
            ToggleCircle.Parent = ToggleButton
            ToggleCircle.Size = UDim2.new(0, 16, 0, 16)
            ToggleCircle.Position = default and UDim2.new(0, 12, 0, 2) or UDim2.new(0, 2, 0, 2)
            ToggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleCircle.BorderSizePixel = 0
            
            local CircleCorner = Instance.new("UICorner")
            CircleCorner.CornerRadius = UDim.new(1, 0)
            CircleCorner.Parent = ToggleCircle
            
            local toggleState = default
            
            ToggleButton.MouseButton1Click:Connect(function()
                toggleState = not toggleState
                
                local newColor = toggleState and Color3.fromRGB(40, 167, 69) or Color3.fromRGB(108, 117, 125)
                local newPos = toggleState and UDim2.new(0, 12, 0, 2) or UDim2.new(0, 2, 0, 2)
                
                TweenService:Create(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = newColor}):Play()
                TweenService:Create(ToggleCircle, TweenInfo.new(0.2), {Position = newPos}):Play()
                
                callback(toggleState)
            end)
            
            return ToggleFrame
        end
        
        function Tab:Slider(config)
            config = config or {}
            local text = config.Text or "Slider"
            local min = config.Min or 0
            local max = config.Max or 100
            local default = config.Default or min
            local precise = config.Precise or false
            local callback = config.Callback or function() end
            
            local SliderFrame = Instance.new("Frame")
            SliderFrame.Parent = TabContent
            SliderFrame.Size = UDim2.new(1, -20, 0, 40)
            SliderFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            SliderFrame.BorderSizePixel = 0
            
            local SliderCorner = Instance.new("UICorner")
            SliderCorner.CornerRadius = UDim.new(0, 6)
            SliderCorner.Parent = SliderFrame
            
            local SliderStroke = Instance.new("UIStroke")
            SliderStroke.Color = Color3.fromRGB(60, 60, 60)
            SliderStroke.Thickness = 1
            SliderStroke.Parent = SliderFrame
            
            local SliderTitle = Instance.new("TextLabel")
            SliderTitle.Parent = SliderFrame
            SliderTitle.Size = UDim2.new(1, -20, 0, 15)
            SliderTitle.Position = UDim2.new(0, 10, 0, 2)
            SliderTitle.BackgroundTransparency = 1
            SliderTitle.Text = text
            SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderTitle.TextSize = 12
            SliderTitle.Font = Enum.Font.Code
            SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
            
            local ValueText = Instance.new("TextLabel")
            ValueText.Parent = SliderFrame
            ValueText.Size = UDim2.new(1, -20, 0, 15)
            ValueText.Position = UDim2.new(0, 10, 0, 2)
            ValueText.BackgroundTransparency = 1
            ValueText.Text = default .. "/" .. max
            ValueText.TextColor3 = Color3.fromRGB(200, 200, 200)
            ValueText.TextSize = 11
            ValueText.Font = Enum.Font.Code
            ValueText.TextXAlignment = Enum.TextXAlignment.Right
            ValueText.TextTransparency = 0.5
            
            local SliderBg = Instance.new("TextButton")
            SliderBg.Parent = SliderFrame
            SliderBg.Position = UDim2.new(0, 10, 0, 25)
            SliderBg.Size = UDim2.new(1, -20, 0, 8)
            SliderBg.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            SliderBg.BorderSizePixel = 0
            SliderBg.Text = ""
            
            local SliderBgCorner = Instance.new("UICorner")
            SliderBgCorner.CornerRadius = UDim.new(0, 4)
            SliderBgCorner.Parent = SliderBg
            
            local SliderFill = Instance.new("Frame")
            SliderFill.Parent = SliderBg
            SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
            SliderFill.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
            SliderFill.BorderSizePixel = 0
            
            local SliderFillCorner = Instance.new("UICorner")
            SliderFillCorner.CornerRadius = UDim.new(0, 4)
            SliderFillCorner.Parent = SliderFill
            
            local currentValue = default
            local dragging = false
            local connection
            
            local function updateSlider(percentage)
                percentage = math.clamp(percentage, 0, 1)
                local value = min + (max - min) * percentage
                
                if precise then
                    currentValue = math.floor(value * 100) / 100
                else
                    currentValue = math.floor(value)
                end
                
                SliderFill.Size = UDim2.new(percentage, 0, 1, 0)
                ValueText.Text = currentValue .. "/" .. max
                
                callback(currentValue)
            end
            
            SliderBg.MouseButton1Down:Connect(function()
                dragging = true
                ValueText.TextTransparency = 0
                
                if connection then
                    connection:Disconnect()
                end
                
                connection = RunService.RenderStepped:Connect(function()
                    if not dragging then
                        if connection then
                            connection:Disconnect()
                            connection = nil
                        end
                        return
                    end
                    
                    local mouse = UserInputService:GetMouseLocation()
                    local percentage = math.clamp((mouse.X - SliderBg.AbsolutePosition.X) / SliderBg.AbsoluteSize.X, 0, 1)
                    updateSlider(percentage)
                end)
            end)
            
            local sliderInputConnection
            sliderInputConnection = UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    if dragging then
                        dragging = false
                        TweenService:Create(ValueText, TweenInfo.new(0.2), {TextTransparency = 0.5}):Play()
                        if connection then
                            connection:Disconnect()
                            connection = nil
                        end
                    end
                end
            end)
            
            return SliderFrame
        end
        
        function Tab:Textbox(config)
            config = config or {}
            local text = config.Text or "Textbox"
            local placeholder = config.Placeholder or "Enter text..."
            local callback = config.Callback or function() end
            
            local TextboxFrame = Instance.new("Frame")
            TextboxFrame.Parent = TabContent
            TextboxFrame.Size = UDim2.new(1, -20, 0, 50)
            TextboxFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            TextboxFrame.BorderSizePixel = 0
            
            local TextboxCorner = Instance.new("UICorner")
            TextboxCorner.CornerRadius = UDim.new(0, 6)
            TextboxCorner.Parent = TextboxFrame
            
            local TextboxStroke = Instance.new("UIStroke")
            TextboxStroke.Color = Color3.fromRGB(60, 60, 60)
            TextboxStroke.Thickness = 1
            TextboxStroke.Parent = TextboxFrame
            
            local TextboxTitle = Instance.new("TextLabel")
            TextboxTitle.Parent = TextboxFrame
            TextboxTitle.Size = UDim2.new(1, -20, 0, 15)
            TextboxTitle.Position = UDim2.new(0, 10, 0, 2)
            TextboxTitle.BackgroundTransparency = 1
            TextboxTitle.Text = text
            TextboxTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextboxTitle.TextSize = 12
            TextboxTitle.Font = Enum.Font.Code
            TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left
            
            local Textbox = Instance.new("TextBox")
            Textbox.Parent = TextboxFrame
            Textbox.Position = UDim2.new(0, 10, 0, 20)
            Textbox.Size = UDim2.new(1, -20, 0, 25)
            Textbox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            Textbox.BorderSizePixel = 0
            Textbox.Text = ""
            Textbox.PlaceholderText = placeholder
            Textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
            Textbox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
            Textbox.TextSize = 11
            Textbox.Font = Enum.Font.Code
            Textbox.TextXAlignment = Enum.TextXAlignment.Left
            
            local TextboxInputCorner = Instance.new("UICorner")
            TextboxInputCorner.CornerRadius = UDim.new(0, 4)
            TextboxInputCorner.Parent = Textbox
            
            local TextboxInputPadding = Instance.new("UIPadding")
            TextboxInputPadding.Parent = Textbox
            TextboxInputPadding.PaddingLeft = UDim.new(0, 8)
            TextboxInputPadding.PaddingRight = UDim.new(0, 8)
            
            Textbox.Focused:Connect(function()
                TweenService:Create(TextboxStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(0, 162, 255)}):Play()
            end)
            
            Textbox.FocusLost:Connect(function(enterPressed)
                TweenService:Create(TextboxStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(60, 60, 60)}):Play()
                if enterPressed then
                    callback(Textbox.Text)
                end
            end)
            
            return TextboxFrame
        end
        
        function Tab:Dropdown(config)
            config = config or {}
            local text = config.Text or "Dropdown"
            local options = config.Options or {"Option 1", "Option 2"}
            local default = config.Default or options[1]
            local callback = config.Callback or function() end
            
            local DropdownFrame = Instance.new("Frame")
            DropdownFrame.Parent = TabContent
            DropdownFrame.Size = UDim2.new(1, -20, 0, 30)
            DropdownFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            DropdownFrame.BorderSizePixel = 0
            DropdownFrame.ClipsDescendants = false
            
            local DropdownCorner = Instance.new("UICorner")
            DropdownCorner.CornerRadius = UDim.new(0, 6)
            DropdownCorner.Parent = DropdownFrame
            
            local DropdownStroke = Instance.new("UIStroke")
            DropdownStroke.Color = Color3.fromRGB(60, 60, 60)
            DropdownStroke.Thickness = 1
            DropdownStroke.Parent = DropdownFrame
            
            local DropdownLabel = Instance.new("TextLabel")
            DropdownLabel.Parent = DropdownFrame
            DropdownLabel.Size = UDim2.new(0.5, -10, 0, 30)
            DropdownLabel.Position = UDim2.new(0, 10, 0, 0)
            DropdownLabel.BackgroundTransparency = 1
            DropdownLabel.Text = text
            DropdownLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            DropdownLabel.TextSize = 12
            DropdownLabel.Font = Enum.Font.Code
            DropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            local DropdownButton = Instance.new("TextButton")
            DropdownButton.Parent = DropdownFrame
            DropdownButton.Position = UDim2.new(0.5, 0, 0, 3)
            DropdownButton.Size = UDim2.new(0.5, -13, 0, 24)
            DropdownButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            DropdownButton.BorderSizePixel = 0
            DropdownButton.Text = default .. " ▼"
            DropdownButton.TextColor3 = Color3.fromRGB(200, 200, 200)
            DropdownButton.TextSize = 11
            DropdownButton.Font = Enum.Font.Code
            DropdownButton.ZIndex = 2
            
            local DropdownBtnCorner = Instance.new("UICorner")
            DropdownBtnCorner.CornerRadius = UDim.new(0, 4)
            DropdownBtnCorner.Parent = DropdownButton
            
            local DropdownList = Instance.new("Frame")
            DropdownList.Parent = ScreenGui
            DropdownList.Position = UDim2.new(0, 0, 0, 0)
            DropdownList.Size = UDim2.new(0, 0, 0, 0)
            DropdownList.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            DropdownList.BorderSizePixel = 0
            DropdownList.Visible = false
            DropdownList.ZIndex = 10
            
            local DropdownListCorner = Instance.new("UICorner")
            DropdownListCorner.CornerRadius = UDim.new(0, 4)
            DropdownListCorner.Parent = DropdownList
            
            local DropdownListStroke = Instance.new("UIStroke")
            DropdownListStroke.Color = Color3.fromRGB(60, 60, 60)
            DropdownListStroke.Thickness = 1
            DropdownListStroke.Parent = DropdownList
            
            local DropdownListLayout = Instance.new("UIListLayout")
            DropdownListLayout.Parent = DropdownList
            DropdownListLayout.Padding = UDim.new(0, 2)
            
            local DropdownListPadding = Instance.new("UIPadding")
            DropdownListPadding.Parent = DropdownList
            DropdownListPadding.PaddingTop = UDim.new(0, 5)
            DropdownListPadding.PaddingBottom = UDim.new(0, 5)
            DropdownListPadding.PaddingLeft = UDim.new(0, 5)
            DropdownListPadding.PaddingRight = UDim.new(0, 5)
            
            local isOpen = false
            local selectedOption = default
            
            for _, option in pairs(options) do
                local OptionButton = Instance.new("TextButton")
                OptionButton.Parent = DropdownList
                OptionButton.Size = UDim2.new(1, -10, 0, 20)
                OptionButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                OptionButton.BorderSizePixel = 0
                OptionButton.Text = option
                OptionButton.TextColor3 = Color3.fromRGB(200, 200, 200)
                OptionButton.TextSize = 10
                OptionButton.Font = Enum.Font.Code
                OptionButton.ZIndex = 11
                
                local OptionCorner = Instance.new("UICorner")
                OptionCorner.CornerRadius = UDim.new(0, 3)
                OptionCorner.Parent = OptionButton
                
                OptionButton.MouseEnter:Connect(function()
                    TweenService:Create(OptionButton, TweenInfo.new(0.1), {
                        BackgroundColor3 = Color3.fromRGB(0, 162, 255)
                    }):Play()
                end)
                
                OptionButton.MouseLeave:Connect(function()
                    TweenService:Create(OptionButton, TweenInfo.new(0.1), {
                        BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                    }):Play()
                end)
                
                OptionButton.MouseButton1Click:Connect(function()
                    selectedOption = option
                    DropdownButton.Text = option .. " ▼"
                    
                    isOpen = false
                    DropdownList.Visible = false
                    
                    callback(option)
                end)
            end
            
            DropdownListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                DropdownList.Size = UDim2.new(0, DropdownButton.AbsoluteSize.X, 0, DropdownListLayout.AbsoluteContentSize.Y + 10)
            end)
            
            local function updateDropdownPosition()
                local buttonPos = DropdownButton.AbsolutePosition
                local buttonSize = DropdownButton.AbsoluteSize
                DropdownList.Position = UDim2.new(0, buttonPos.X, 0, buttonPos.Y + buttonSize.Y + 2)
                DropdownList.Size = UDim2.new(0, buttonSize.X, 0, DropdownListLayout.AbsoluteContentSize.Y + 10)
            end
            
            DropdownButton.MouseButton1Click:Connect(function()
                isOpen = not isOpen
                
                if isOpen then
                    DropdownButton.Text = selectedOption .. " ▲"
                    updateDropdownPosition()
                    DropdownList.Visible = true
                else
                    DropdownButton.Text = selectedOption .. " ▼"
                    DropdownList.Visible = false
                end
            end)
            
            local closeConnection
            closeConnection = UserInputService.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    local mousePos = UserInputService:GetMouseLocation()
                    
                    if isOpen and DropdownList.Visible then
                        local listPos = DropdownList.AbsolutePosition
                        local listSize = DropdownList.AbsoluteSize
                        local buttonPos = DropdownButton.AbsolutePosition
                        local buttonSize = DropdownButton.AbsoluteSize
                        
                        local outsideButton = mousePos.X < buttonPos.X or mousePos.X > buttonPos.X + buttonSize.X or 
                                            mousePos.Y < buttonPos.Y or mousePos.Y > buttonPos.Y + buttonSize.Y
                        local outsideList = mousePos.X < listPos.X or mousePos.X > listPos.X + listSize.X or 
                                          mousePos.Y < listPos.Y or mousePos.Y > listPos.Y + listSize.Y
                        
                        if outsideButton and outsideList then
                            isOpen = false
                            DropdownList.Visible = false
                            DropdownButton.Text = selectedOption .. " ▼"
                        end
                    end
                end
            end)
            
            return DropdownFrame
        end
        
        return Tab
    end
    
    return Window
end

return Library
