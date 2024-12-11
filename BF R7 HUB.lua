local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/UI-Library/main/Library.lua"))()
local w = lib:CreateWindow("R7 Hub - Ultimate Blox Fruits")
local races, dough, indra, misc = w:CreateFolder("Race V4"), w:CreateFolder("Dough King"), w:CreateFolder("Rip Indra"), w:CreateFolder("Miscellaneous")

-- Race V4 Automation
races:Toggle("Auto Unlock Race V4", function(v)
    _G.AutoRaceV4 = v
    while _G.AutoRaceV4 do wait(1)
        local moon = game.Lighting.ClockTime
        if moon >= 19 and moon <= 20 then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("MirageIsland")
            wait(3)
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CollectGear", "Blue Gear")
        end
    end
end)

-- Auto Dough King Farm
dough:Toggle("Auto Summon and Farm Dough King", function(v)
    _G.AutoDoughKing = v
    while _G.AutoDoughKing do wait()
        -- Ensure Cocoa and God's Chalice
        local cocoa = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", "Cocoa")
        local chalice = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", "God's Chalice")
        -- Summon Dough King
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("SweetChalice")
        wait(2)
        -- Teleport to Dough King and Attack
        for _, boss in pairs(workspace.Enemies:GetChildren()) do
            if boss.Name == "Dough King" and boss:FindFirstChild("Humanoid") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Attack", boss)
            end
        end
    end
end)

-- Auto Rip Indra Farm
indra:Toggle("Auto Summon and Farm Rip Indra", function(v)
    _G.AutoRipIndra = v
    while _G.AutoRipIndra do wait()
        -- Ensure God's Chalice and Haki Colors
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("GodsChalice")
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ActivateHaki")
        -- Spawn and Fight Rip Indra
        for _, boss in pairs(workspace.Enemies:GetChildren()) do
            if boss.Name == "Rip Indra" and boss:FindFirstChild("Humanoid") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Attack", boss)
            end
        end
    end
end)

-- Miscellaneous Features
misc:Button("Infinite Energy", function()
    while true do wait()
        game.Players.LocalPlayer.Character.Energy.Value = math.huge
    end
end)

misc:Slider("WalkSpeed", {min = 16, max = 300}, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)

misc:Slider("Jump Power", {min = 50, max = 500}, function(v)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
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
