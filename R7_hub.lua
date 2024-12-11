local lib = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local toggle = Instance.new("TextButton")
local minimize = Instance.new("TextButton")
local close = Instance.new("TextButton")
local title = Instance.new("TextLabel")
local farmingSection = Instance.new("Frame")
local autoFarmToggle = Instance.new("TextButton")
local questToggle = Instance.new("TextButton")
local hakiToggle = Instance.new("TextButton")
local seaProgress = Instance.new("TextButton")
local seaEventFarm = Instance.new("TextButton")

lib.Name = "R7Hub"
lib.Parent = game.CoreGui

frame.Name = "MainFrame"
frame.Parent = lib
frame.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
frame.BackgroundTransparency = 0.5
frame.Size = UDim2.new(0, 300, 0, 400)
frame.Position = UDim2.new(0.5, -150, 0.5, -200)
frame.Active = true
frame.Draggable = true

title.Name = "Title"
title.Parent = frame
title.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
title.Size = UDim2.new(1, 0, 0, 30)
title.Font = Enum.Font.SourceSans
title.Text = "R7 Hub - Blox Fruits"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 20

minimize.Name = "Minimize"
minimize.Parent = title
minimize.Text = "_"
minimize.Size = UDim2.new(0, 30, 1, 0)
minimize.Position = UDim2.new(1, -60, 0, 0)
minimize.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
minimize.TextColor3 = Color3.fromRGB(255, 255, 255)

close.Name = "Close"
close.Parent = title
close.Text = "X"
close.Size = UDim2.new(0, 30, 1, 0)
close.Position = UDim2.new(1, -30, 0, 0)
close.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
close.TextColor3 = Color3.fromRGB(255, 255, 255)

farmingSection.Name = "FarmingSection"
farmingSection.Parent = frame
farmingSection.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
farmingSection.Size = UDim2.new(1, 0, 1, -30)
farmingSection.Position = UDim2.new(0, 0, 0, 30)

autoFarmToggle.Name = "AutoFarmToggle"
autoFarmToggle.Parent = farmingSection
autoFarmToggle.Size = UDim2.new(0, 280, 0, 40)
autoFarmToggle.Position = UDim2.new(0.05, 0, 0.05, 0)
autoFarmToggle.Text = "Auto Farm: OFF"
autoFarmToggle.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
autoFarmToggle.TextColor3 = Color3.fromRGB(255, 255, 255)

questToggle.Name = "QuestToggle"
questToggle.Parent = farmingSection
questToggle.Size = UDim2.new(0, 280, 0, 40)
questToggle.Position = UDim2.new(0.05, 0, 0.20, 0)
questToggle.Text = "Auto Quest: OFF"
questToggle.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
questToggle.TextColor3 = Color3.fromRGB(255, 255, 255)

hakiToggle.Name = "HakiToggle"
hakiToggle.Parent = farmingSection
hakiToggle.Size = UDim2.new(0, 280, 0, 40)
hakiToggle.Position = UDim2.new(0.05, 0, 0.35, 0)
hakiToggle.Text = "Auto Haki: OFF"
hakiToggle.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
hakiToggle.TextColor3 = Color3.fromRGB(255, 255, 255)

seaProgress.Name = "SeaProgress"
seaProgress.Parent = farmingSection
seaProgress.Size = UDim2.new(0, 280, 0, 40)
seaProgress.Position = UDim2.new(0.05, 0, 0.50, 0)
seaProgress.Text = "Auto Sea Progression: OFF"
seaProgress.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
seaProgress.TextColor3 = Color3.fromRGB(255, 255, 255)

seaEventFarm.Name = "SeaEventFarm"
seaEventFarm.Parent = farmingSection
seaEventFarm.Size = UDim2.new(0, 280, 0, 40)
seaEventFarm.Position = UDim2.new(0.05, 0, 0.65, 0)
seaEventFarm.Text = "Auto Sea Events: OFF"
seaEventFarm.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
seaEventFarm.TextColor3 = Color3.fromRGB(255, 255, 255)

local function toggleButton(button)
    if button.Text:find("OFF") then
        button.Text = button.Text:gsub("OFF", "ON")
    else
        button.Text = button.Text:gsub("ON", "OFF")
    end
end

autoFarmToggle.MouseButton1Click:Connect(function() toggleButton(autoFarmToggle) end)
questToggle.MouseButton1Click:Connect(function() toggleButton(questToggle) end)
hakiToggle.MouseButton1Click:Connect(function() toggleButton(hakiToggle) end)
seaProgress.MouseButton1Click:Connect(function() toggleButton(seaProgress) end)
seaEventFarm.MouseButton1Click:Connect(function() toggleButton(seaEventFarm) end)

minimize.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
end)

close.MouseButton1Click:Connect(function()
    local confirm = Instance.new("TextButton")
    confirm.Text = "Are you sure you want to close?"
    confirm.Parent = game.CoreGui
    confirm.MouseButton1Click:Connect(function()
        if confirm.Text == "Yes" then
            lib:Destroy()
        else
            confirm:Destroy()
        end
    end)
end)
