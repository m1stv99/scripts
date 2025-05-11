local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "DezV HUB",
    LoadingTitle = "DezV HUB Interface",
    LoadingSubtitle = "by _inddx & Ahmadv99",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "TeleportSettingsUIConfig",
        FileName = "DezVHubConfig"
    }
})

local MainTab = Window:CreateTab("Main", 4483345998)
local PlayerTab = Window:CreateTab("Player", 4483345998)
local FoodTab = Window:CreateTab("Food", 4483345998)
local VehicleTab = Window:CreateTab("Vehicle", 4483345998)
local MiscTab = Window:CreateTab("Misc", 4483345998)

local teleportingEnabled = false
local alwaysDayEnabled = false
local autoBringEnabled = {
    Burger = false,
    Apple = false,
    banana = false,
    Garlic = false,
    Bread = false,
    Peper = false,
    t = false,
    Pizza = false,
    Onion = false,
    Donut = false,
    Food = false,
    Bar = false
}
local removeNpcsEnabled = false
local removeRocksEnabled = false
local removeCactusEnabled = false
local maxHpValue = 1000

local function teleportObjects(objectName)
    local workspaceChildren = game:GetService("Workspace"):GetChildren()
    for _, child in ipairs(workspaceChildren) do
        if child:IsA("Model") and child.Name == objectName then
            local parts = child:GetChildren()
            for _, part in ipairs(parts) do
                if part:IsA("BasePart") then
                    part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                end
            end
        end
    end
end

local function getHighestCheckpoint()
    local highestNumber = -1
    local highestCheckpoint = nil
    for _, checkpoint in pairs(game.Workspace.points:GetChildren()) do
        if checkpoint:IsA("Part") or checkpoint:IsA("Model") then
            local checkpointNumber = tonumber(checkpoint.Name)
            if checkpointNumber and checkpointNumber > highestNumber then
                highestNumber = checkpointNumber
                highestCheckpoint = checkpoint
            end
        end
    end
    return highestCheckpoint
end

local function teleportToHighestCheckpoint()
    while teleportingEnabled do
        local highestCheckpoint = getHighestCheckpoint()
        if highestCheckpoint then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = highestCheckpoint.CFrame
        end
        wait(1)
    end
end

local function setAlwaysDay()
    local lighting = game:GetService("Lighting")
    while alwaysDayEnabled do
        lighting.TimeOfDay = "12:00:00"
        for _, effect in ipairs({"Atmosphere", "Bloom", "Blur", "ColorCorrection", "DepthOfField", "SunRays"}) do
            local effectInstance = lighting:FindFirstChildOfClass(effect)
            if effectInstance then
                effectInstance:Destroy()
            end
        end
        wait(1)
    end
end

local function autoBring()
    local foodItems = {"Burger", "Apple", "banana", "Garlic", "Bread", "Peper", "t", "Pizza", "Onion", "Donut", "Food", "Bar"}
    while true do
        for _, food in ipairs(foodItems) do
            if autoBringEnabled[food] then
                teleportObjects(food)
            end
        end
        wait(1)
    end
end

local function unlimitedAmmo()
    for _, v in ipairs(game.Workspace:GetChildren()) do
        if v.Name == "Raygun" or v.Name == "BalloonGun" or v.Name == "Red PaintballGun" or v.Name == "Pink PaintballGun" or v.Name == "Blue PaintballGun" or v.Name == "Yellow PaintballGun" or v.Name == "Green PaintballGun" or v.Name == "Pistol" or v.Name == "AK47" or v.Name == "GOLDAK47" or v.Name == "Mac10" or v.Name == "PumpShotgun" or v.Name == "Nuke Launcher" or v.Name == "Railgun" or v.Name == "RPG" then
            v:SetAttribute("CurrentMagSize", 9999)
            v:SetAttribute("MagSize", 9999)
            v:SetAttribute("MaxBulletsAmount", 9999)
            wait()
        end
    end
    game.Workspace.ChildAdded:Connect(function(v)
        if v.Name == "Raygun" or v.Name == "BalloonGun" or v.Name == "Red PaintballGun" or v.Name == "Pink PaintballGun" or v.Name == "Blue PaintballGun" or v.Name == "Yellow PaintballGun" or v.Name == "Green PaintballGun" or v.Name == "Pistol" or v.Name == "AK47" or v.Name == "GOLDAK47" or v.Name == "Mac10" or v.Name == "PumpShotgun" or v.Name == "RPG" then
            v:SetAttribute("CurrentMagSize", 9999)
            v:SetAttribute("MagSize", 9999)
            v:SetAttribute("MaxBulletsAmount", 9999)
            wait()
        end
    end)
end

local function teleportCaps()
    teleportObjects("BottleCap")
    teleportObjects("5stack")
    teleportObjects("5Pile")
    teleportObjects("10pile")
    teleportObjects("15Pile")
    teleportObjects("20pile")
end

local function teleporttoShop_99()
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    local buildingsFolder = game.Workspace.modelspoint
    local function teleportToShop(buildingModel)
        local building = buildingModel:FindFirstChild("building")
        if building then
            local buyLever = building:FindFirstChild("BUY_LEVER")
            if buyLever then
                local part = buyLever:FindFirstChild("Part")
                if part and part:IsA("BasePart") then
                    rootPart.CFrame = CFrame.new(part.Position)
                end
            end
        end
    end
    for _, buildingModel in ipairs(buildingsFolder:GetChildren()) do
        if buildingModel:IsA("Model") then
            teleportToShop(buildingModel)
        end
    end
end

local function teleporttoShop_Dan()
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    local buildingsFolder = game.Workspace.modelspoint
    local function teleportToShop(buildingModel)
        local building = buildingModel:FindFirstChild("building")
        if building then
            local danModel = building:FindFirstChild("Price")
            if danModel then
                local headPart = danModel:FindFirstChild("Signs")
                if headPart and headPart:IsA("BasePart") then
                    rootPart.CFrame = CFrame.new(headPart.Position)
                end
            end
        end
    end
    for _, buildingModel in ipairs(buildingsFolder:GetChildren()) do
        if buildingModel:IsA("Model") then
            teleportToShop(buildingModel)
        end
    end
end

local function teleporttoChurch()
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    local vampireModel = game.Workspace:FindFirstChild("Vampire")
    if vampireModel and vampireModel:IsA("Model") then
        local headPart = vampireModel:FindFirstChild("Head")
        if headPart and headPart:IsA("BasePart") then
            rootPart.CFrame = CFrame.new(headPart.Position)
        end
    end
end

local function teleportRareItems()
    local rareItems = {
        "Backpack_6", "Backpack_8", "Rubber Duck", "Green PaintballGun", "Yellow PaintballGun",
        "Blue PaintballGun", "Saveable_HealingPotion", "Gray Duck", "Blue Duck", "DancePotion",
        "RubberChicken", "Firework", "Tophat Duck", "Pink PaintballGun", "Red PaintballGun",
        "Devil Duck", "Monster Mash Dance Potion", "FirePotion", "Shrek", "BalloonGun", "Raygun",
    }
    for _, item in ipairs(rareItems) do
        teleportObjects(item)
    end
end

local function teleportValuable()
    local valuableItems = {
        "axe", "Shield", "vaz", "Katana", "RadioactiveBarrel", "Keyboard", "Skateboard", "Cone",
        "Bowlball", "Brick", "Pizza", "AK47", "PumpShotgun", "RPG", "Mac10", "Pistol"
    }
    for _, item in ipairs(valuableItems) do
        teleportObjects(item)
    end
end

local function antiAfk()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0),game.Workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),game.Workspace.CurrentCamera.CFrame)
    end)
end

local function bringGasCansTo(cframePosition)
	for _, model in pairs(workspace:GetDescendants()) do
		if model:IsA("Model") and model.Name == "GasCan" then
			local primaryPart = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
			if primaryPart then
				model:SetPrimaryPartCFrame(cframePosition)
			end
		end
	end
end


local function destroyTornado()
    while true do
        local tornado = game.Workspace:FindFirstChild("TornadoModel")
        if tornado then
            tornado:Destroy()
        end
        wait(0.1)
    end
end

local function removeNPCs()
    local npcNames = {}
    for _, npc in pairs(game.ReplicatedStorage.Assets.NPCs:GetDescendants()) do
        if npc:IsA("Model") then
            table.insert(npcNames, npc.Name)
        end
    end
    local mutants = {
        "CowboyMutant", "Bandits", "Child1", "Citizen1", "Citizen10", "Citizen11", "Citizen2", "Citizen3",
        "Citizen4", "Citizen5", "Citizen6", "Citizen7", "Citizen8", "Citizen9", "Criminal", "Criminal1",
        "Firefighter1", "Firefighter", "MaskedCriminal1", "MaskedCriminal2", "MaskedCriminal3",
        "MaskedCriminal4", "MaskedCriminal5", "MaskedCriminal6", "MaskedCriminal7", "SecurityGuard1",
        "Sheriff1", "Sheriff2", "SuitedGangMember1", "SuitedGangMember2", "SuitedGangMember3",
        "SuitedGangMember4", "SuitedGangMember5", "Swat1", "Swat2", "Swat3"
    }
    for _, child in pairs(game.Workspace:GetChildren()) do
        if child:IsA("Model") and (table.find(npcNames, child.Name) or table.find(mutants, child.Name)) then
            child:Destroy()
        end
    end
end

local function removeRocks()
    while removeRocksEnabled do
        for _, model in pairs(game.Workspace.modelspoint:GetChildren()) do
            for _, descendant in pairs(model:GetDescendants()) do
                if descendant:IsA("Model") and descendant.Name:match("Spawnrock%d*") then
                    descendant:Destroy()
                end
            end
        end
        wait(1)
    end
end

local function removeCactus()
    while removeCactusEnabled do
        for _, model in pairs(game.Workspace.modelspoint:GetChildren()) do
            for _, descendant in pairs(model:GetDescendants()) do
                if descendant:IsA("Model") and descendant.Name:match("Cactus%d*") then
                    descendant:Destroy()
                end
            end
        end
        wait(1)
    end
end

local function removeSpeedLimit()
    for _, engine in pairs(game.Workspace:GetDescendants()) do
        if engine:IsA("Model") and engine.Name == "Engine" then
            for _, value in pairs(engine:GetChildren()) do
                if value:IsA("NumberValue") then
                    if value.Name == "maxgear" then
                        value.Value = 12
                    elseif value.Name == "hp" then
                        value.Value = maxHpValue
                    end
                end
            end
        end
    end
end

local function changeFuelType(fuelType)
    for _, engine in pairs(game.Workspace:GetDescendants()) do
        if engine:IsA("Model") and engine.Name == "Engine" then
            for _, value in pairs(engine:GetChildren()) do
                if value:IsA("StringValue") and value.Name == "FuelType" then
                    value.Value = fuelType
                end
            end
        end
    end
end

MainTab:CreateLabel("Credits:")
MainTab:CreateLabel("Script by _inddx  | & Ahmadv99")
MainTab:CreateLabel("UI: Rayfield")

PlayerTab:CreateToggle({
    Name = "Toggle Teleport",
    CurrentValue = false,
    Flag = "TeleportToggle",
    Callback = function(value)
        teleportingEnabled = value
        if value then
            coroutine.wrap(teleportToHighestCheckpoint)()
        end
    end
})

PlayerTab:CreateToggle({
    Name = "Toggle Always Day",
    CurrentValue = false,
    Flag = "AlwaysDayToggle",
    Callback = function(value)
        alwaysDayEnabled = value
        if value then
            coroutine.wrap(setAlwaysDay)()
        end
    end
})

PlayerTab:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 5000},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "WalkSpeedSlider",
    Callback = function(value)
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    end
})

PlayerTab:CreateSlider({
    Name = "Gravity",
    Range = {0, 196.2},
    Increment = 1,
    Suffix = "Gravity",
    CurrentValue = 196.2,
    Flag = "GravitySlider",
    Callback = function(value)
        game.Workspace.Gravity = value
    end
})

local function createAutoBringToggle(foodName)
    FoodTab:CreateToggle({
        Name = "Bring " .. foodName,
        CurrentValue = false,
        Flag = "Bring" .. foodName .. "Toggle",
        Callback = function(value)
            autoBringEnabled[foodName] = value
        end
    })
end

local foodItems = {"Burger", "Apple", "banana", "Garlic", "Bread", "Peper", "t", "Pizza", "Onion", "Donut", "Food", "Bar"}
for _, food in ipairs(foodItems) do
    createAutoBringToggle(food)
end

local function bringAllFood()
    for _, food in ipairs(foodItems) do
        teleportObjects(food)
    end
end

FoodTab:CreateButton({
    Name = "Bring All Food",
    Callback = bringAllFood
})

coroutine.wrap(autoBring)()

VehicleTab:CreateButton({
    Name = "Remove Speed Limit",
    Callback = removeSpeedLimit
})

VehicleTab:CreateSlider({
    Name = "Max HP",
    Range = {0, 10000},
    Increment = 100,
    Suffix = "HP",
    CurrentValue = 1000,
    Flag = "MaxHPSlider",
    Callback = function(value)
        maxHpValue = value
    end
})

VehicleTab:CreateButton({
    Name = "Change Fuel to Gas",
    Callback = function()
        changeFuelType("Gas")
    end
})

VehicleTab:CreateButton({
    Name = "Change Fuel to Diesel",
    Callback = function()
        changeFuelType("Diesel")
    end
})

MiscTab:CreateButton({
    Name = "Unlimited Ammo",
    Callback = unlimitedAmmo
})

MiscTab:CreateButton({
    Name = "Teleport Caps",
    Callback = teleportCaps
})

MiscTab:CreateButton({
    Name = "Teleport to Shop 99",
    Callback = teleporttoShop_99
})

MiscTab:CreateButton({
    Name = "Teleport to Shop Dan",
    Callback = teleporttoShop_Dan
})

MiscTab:CreateButton({
    Name = "Teleport to Church",
    Callback = teleporttoChurch
})

MiscTab:CreateButton({
    Name = "Teleport Rare Items",
    Callback = teleportRareItems
})

MiscTab:CreateButton({
    Name = "Teleport Valuable Items",
    Callback = teleportValuable
})

MiscTab:CreateButton({
    Name = "Bring GasCans",
    Callback = function()
        local targetPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        bringGasCansTo(targetPos)
    end
})


MiscTab:CreateButton({
    Name = "Anti AFK",
    Callback = antiAfk
})

MiscTab:CreateButton({
    Name = "Destroy Tornado",
    Callback = destroyTornado
})

MiscTab:CreateButton({
    Name = "Bring Guns",
    Callback = function()
        local guns = {"AK47", "PumpShotgun", "RPG", "Mac10", "Pistol", "AMMO_CRATE", "Railgun", "RayGun", "Nuke Launcher", "GoldMiniGun"}
        for _, gun in ipairs(guns) do
            teleportObjects(gun)
        end
    end
})

MiscTab:CreateToggle({
    Name = "Toggle Remove NPCs",
    CurrentValue = false,
    Flag = "RemoveNPCsToggle",
    Callback = function(value)
        removeNpcsEnabled = value
        if value then
            coroutine.wrap(function()
                while removeNpcsEnabled do
                    removeNPCs()
                    wait(1)
                end
            end)()
        end
    end
})

MiscTab:CreateToggle({
    Name = "Toggle Remove Rocks",
    CurrentValue = false,
    Flag = "RemoveRocksToggle",
    Callback = function(value)
        removeRocksEnabled = value
        if value then
            coroutine.wrap(removeRocks)()
        end
    end
})

MiscTab:CreateToggle({
    Name = "Toggle Remove Cactus",
    CurrentValue = false,
    Flag = "RemoveCactusToggle",
    Callback = function(value)
        removeCactusEnabled = value
        if value then
            coroutine.wrap(removeCactus)()
        end
    end
})
