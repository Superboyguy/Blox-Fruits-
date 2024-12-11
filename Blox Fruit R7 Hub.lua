local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")

local lib = Instance.new("ScreenGui")
lib.Name = "R7Hub"
lib.Parent = game.CoreGui
lib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local main = Instance.new("Frame")
main.Parent = lib
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.BackgroundTransparency = 0.4
main.Position = UDim2.new(0.35, 0, 0.2, 0)
main.Size = UDim2.new(0, 400, 0, 500)
main.Active = true
main.Draggable = true

local title = Instance.new("TextLabel")
title.Parent = main
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
title.BackgroundTransparency = 0.6
title.Text = "R7 Hub - Blox Fruits"
title.TextSize = 20
title.Font = Enum.Font.SourceSansBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)

local scroll = Instance.new("ScrollingFrame")
scroll.Parent = main
scroll.Position = UDim2.new(0, 0, 0, 40)
scroll.Size = UDim2.new(1, 0, 1, -40)
scroll.CanvasSize = UDim2.new(0, 0, 2, 0)
scroll.BackgroundTransparency = 1
scroll.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)

local function createButton(name, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = scroll
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.Position = UDim2.new(0.05, 0, 0, (#scroll:GetChildren() - 1) * 45)
    btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 18
    btn.Text = name
    btn.MouseButton1Click:Connect(callback)
end

-- Race V4 Automation
createButton("Auto Race V4 Unlock", function()
    spawn(function()
        while true do wait(1)
            local moon = game.Lighting.ClockTime
            if moon >= 19 and moon <= 20 then
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("MirageIsland")
                wait(3)
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CollectGear", "Blue Gear")
            end
        end
    end)
end)

-- Dough King Automation
createButton("Auto Summon and Kill Dough King", function()
    spawn(function()
        while true do wait()
            local chalice = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("GodsChalice")
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("SweetChalice")
            for _, boss in pairs(workspace.Enemies:GetChildren()) do
                if boss.Name == "Dough King" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Attack", boss)
                end
            end
        end
    end)
end)

-- Rip Indra Automation
createButton("Auto Summon and Kill Rip Indra", function()
    spawn(function()
        while true do wait()
            local chalice = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("GodsChalice")
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ActivateHaki")
            for _, boss in pairs(workspace.Enemies:GetChildren()) do
                if boss.Name == "Rip Indra" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Attack", boss)
                end
            end
        end
    end)
end)

-- Misc Features
createButton("Infinite Energy", function()
    game.Players.LocalPlayer.Character.Energy.Value = math.huge
end)

createButton("No Clip", function()
    spawn(function()
        while true do wait()
            for _, part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
end)

createButton("Increase WalkSpeed", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 300
end)

createButton("Increase JumpPower", function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 500
end)
