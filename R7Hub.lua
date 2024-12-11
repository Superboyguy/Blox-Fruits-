local r = Instance.new("ScreenGui")
r.Name = "R7Hub"
r.Parent = game:GetService("CoreGui")
r.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local f = Instance.new("Frame")
f.Parent = r
f.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
f.BackgroundTransparency = 0.3
f.BorderSizePixel = 0
f.Size = UDim2.new(0, 500, 0, 300)
f.Position = UDim2.new(0.5, -250, 0.5, -150)
f.AnchorPoint = Vector2.new(0.5, 0.5)
f.Visible = true

local minimize = Instance.new("TextButton")
minimize.Parent = f
minimize.Size = UDim2.new(0, 40, 0, 20)
minimize.Position = UDim2.new(1, -50, 0, 5)
minimize.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
minimize.Text = "-"
minimize.TextSize = 18
minimize.TextColor3 = Color3.fromRGB(255, 255, 255)

local tabs = Instance.new("Frame")
tabs.Parent = f
tabs.Size = UDim2.new(0, 150, 1, -30)
tabs.Position = UDim2.new(0, 0, 0, 30)
tabs.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
tabs.BackgroundTransparency = 0.3

local tabContainer = Instance.new("ScrollingFrame")
tabContainer.Parent = tabs
tabContainer.Size = UDim2.new(1, 0, 1, 0)
tabContainer.CanvasSize = UDim2.new(0, 0, 1, 0)
tabContainer.ScrollBarThickness = 0

local tabNames = {"Main Farm", "ESP", "Teleport", "Auto Buy", "Misc", "Settings"}
local tabButtons = {}
local content = Instance.new("Frame")
content.Parent = f
content.Size = UDim2.new(1, -150, 1, -30)
content.Position = UDim2.new(0, 150, 0, 30)
content.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
content.BackgroundTransparency = 0.3

local tabContentFrames = {}
local function createTabContent(name)
    local frame = Instance.new("Frame")
    frame.Parent = content
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.Visible = false
    frame.BackgroundTransparency = 1
    return frame
end

for _, tabName in ipairs(tabNames) do
    tabContentFrames[tabName] = createTabContent(tabName)
    local b = Instance.new("TextButton")
    b.Parent = tabContainer
    b.Size = UDim2.new(1, 0, 0, 30)
    b.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    b.BackgroundTransparency = 0.5
    b.Text = tabName
    b.TextSize = 16
    b.Font = Enum.Font.SourceSans
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    table.insert(tabButtons, b)
    b.MouseButton1Click:Connect(function()
        for _, frame in pairs(tabContentFrames) do
            frame.Visible = false
        end
        tabContentFrames[tabName].Visible = true
    end)
end

tabContentFrames["Main Farm"].Visible = true

local function addButton(parent, text, func)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Size = UDim2.new(0, 200, 0, 40)
    button.Position = UDim2.new(0, 20, 0, #parent:GetChildren() * 50)
    button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    button.Text = text
    button.TextSize = 14
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.MouseButton1Click:Connect(func)
end

addButton(tabContentFrames["Main Farm"], "Auto Farm Level", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/FARM_LEVEL_SCRIPT"))()
end)

addButton(tabContentFrames["Main Farm"], "Auto Farm Boss", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/FARM_BOSS_SCRIPT"))()
end)

addButton(tabContentFrames["ESP"], "Enable Player ESP", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/ESP_SCRIPT"))()
end)

addButton(tabContentFrames["Teleport"], "Teleport to Starter Island", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(100, 100, 100)
end)

addButton(tabContentFrames["Auto Buy"], "Auto Buy Boat", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/AUTO_BUY_BOAT"))()
end)

addButton(tabContentFrames["Auto Buy"], "Auto Unlock Items", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/UNLOCK_ITEMS"))()
end)

addButton(tabContentFrames["Misc"], "Enable Anti-AFK", function()
    local vu = game:service('VirtualUser')
    game:service('Players').LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
end)

minimize.MouseButton1Click:Connect(function()
    f.Visible = not f.Visible
end)
