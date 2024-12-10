local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/UI-Library/main/Library.lua"))()
local w = lib:CreateWindow("R7 Hub - Blox Fruits")
local shop, chest, boss, combat, misc = w:CreateFolder("Shop"), w:CreateFolder("Chest Farm"), w:CreateFolder("Boss Farm"), w:CreateFolder("Combat"), w:CreateFolder("Miscellaneous")

-- Shop Features
shop:Button("Auto Buy Shark Anchor", function()
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", "SharkAnchor")
end)

shop:Button("Auto Buy Soul Guitar", function()
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", "SoulGuitar")
end)

shop:Button("Auto Buy All Weapons", function()
    local items = {"SharkAnchor", "SoulGuitar", "TrueTripleKatana", "BuddySword", "HallowScythe"}
    for _, item in pairs(items) do
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", item)
    end
end)

-- Auto Chest Farm
chest:Toggle("Auto Chest Farm (Tween)", function(v)
    _G.ChestFarm = v
    while _G.ChestFarm do wait()
        for _, chest in pairs(workspace:GetDescendants()) do
            if chest:IsA("Model") and chest:FindFirstChild("TouchInterest") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = chest.PrimaryPart.CFrame
                wait(0.5)
            end
        end
    end
end)

chest:Toggle("Auto Chest Farm (Instant TP)", function(v)
    _G.InstantChest = v
    while _G.InstantChest do wait()
        for _, chest in pairs(workspace:GetDescendants()) do
            if chest:IsA("Model") and chest:FindFirstChild("TouchInterest") then
                game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(chest.PrimaryPart.CFrame)
            end
        end
    end
end)

-- Boss Farming
boss:Button("Auto Rip Indra", function()
    while true do wait()
        for _, boss in pairs(workspace.Enemies:GetChildren()) do
            if boss.Name == "Rip Indra" and boss:FindFirstChild("Humanoid") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Attack", boss)
            end
        end
    end
end)

boss:Button("Auto Unlock Tushita", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4697, 75, -3456)
end)

boss:Button("Auto Unlock Yama", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5470, 330, -2910)
end)

-- Combat Features
combat:Toggle("Kill Aura", function(v)
    _G.KillAura = v
    while _G.KillAura do wait()
        for _, enemy in pairs(workspace.Enemies:GetChildren()) do
            if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Attack", enemy)
            end
        end
    end
end)

-- Misc Features
misc:Button("Teleport to Bosses", function()
    local bosses = {
        {"Rip Indra", CFrame.new(4000, 100, 4000)},
        {"SharkMan", CFrame.new(3000, 50, 2000)},
        {"Soul Reaper", CFrame.new(-6000, 50, -1200)}
    }
    for _, boss in pairs(bosses) do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = boss[2]
        wait(2)
    end
end)

misc:Slider("WalkSpeed", {min = 16, max = 300}, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)

misc:Slider("Jump Power", {min = 50, max = 500}, function(v)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end)

misc:Button("Infinite Energy", function()
    while true do wait()
        game.Players.LocalPlayer.Character.Energy.Value = math.huge
    end
end)

misc:Toggle("No Clip", function(v)
    _G.NoClip = v
    while _G.NoClip do wait()
        for _, part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

w:Minimize()
