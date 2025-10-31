--// Simple Teleport UI Script

-- Destroy old GUI if exists
if game.CoreGui:FindFirstChild("TeleportUI") then
    game.CoreGui.TeleportUI:Destroy()
end

-- Create ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "TeleportUI"
gui.Parent = game.CoreGui

-- Create main frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 130)
frame.Position = UDim2.new(0.5, -125, 0.5, -65)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

-- Frame corner
local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 8)

-- Title
local title = Instance.new("TextLabel")
title.Text = "Stud Teleporter"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.Parent = frame

-- TextBox
local textbox = Instance.new("TextBox")
textbox.PlaceholderText = "Enter studs..."
textbox.Size = UDim2.new(1, -20, 0, 30)
textbox.Position = UDim2.new(0, 10, 0, 40)
textbox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
textbox.Font = Enum.Font.Gotham
textbox.TextSize = 14
textbox.ClearTextOnFocus = false
textbox.Parent = frame

local tbCorner = Instance.new("UICorner", textbox)
tbCorner.CornerRadius = UDim.new(0, 6)

-- Button
local button = Instance.new("TextButton")
button.Text = "Teleport"
button.Size = UDim2.new(1, -20, 0, 30)
button.Position = UDim2.new(0, 10, 0, 80)
button.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamBold
button.TextSize = 14
button.Parent = frame

local btnCorner = Instance.new("UICorner", button)
btnCorner.CornerRadius = UDim.new(0, 6)

-- Functionality
button.MouseButton1Click:Connect(function()
    local studs = tonumber(textbox.Text)
    if not studs then
        textbox.Text = "Invalid number!"
        return
    end

    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:FindFirstChild("HumanoidRootPart")

    if hrp then
        hrp.CFrame = hrp.CFrame + (hrp.CFrame.LookVector * studs)
    else
        textbox.Text = "No HRP found!"
    end
end)
