function UpdateIslandESP() 
    local locations = game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()
    local player = game:GetService('Players').LocalPlayer
    local playerHead = player.Character and player.Character:FindFirstChild('Head')
    if not playerHead then 
        return 
    end
    for _, v in pairs(locations) do
        if IslandESP then 
            if v.Name ~= "Sea" then
                local nameEsp = v:FindFirstChild('NameEsp')
                if not nameEsp then
                    local bill = Instance.new('BillboardGui', v)
                    bill.Name = 'NameEsp'
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1, 200, 1, 30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel', bill)
                    name.Font = Enum.Font.GothamBold
                    name.TextSize = 14
                    name.TextWrapped = true
                    name.Size = UDim2.new(1, 0, 1, 0)
                    name.TextYAlignment = Enum.TextYAlignment.Top
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(7, 236, 240)
                else
                    local distance = (playerHead.Position - v.Position).Magnitude / 3
                    nameEsp.TextLabel.Text = string.format("%s   \n%.1f Distance", v.Name, distance)
                end
            end
        else
            local nameEsp = v:FindFirstChild('NameEsp')
            if nameEsp then
                nameEsp:Destroy()
            end
        end
    end
end

function isnil(thing)
	return (thing == nil)
end
local function round(n)
	return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)

function UpdatePlayerChams()
    local players = game:GetService('Players')
    local localPlayer = players.LocalPlayer
    local localPlayerHead = localPlayer.Character and localPlayer.Character:FindFirstChild('Head')
    if not localPlayerHead then 
        return 
    end
    for _, player in pairs(players:GetChildren()) do
        local character = player.Character
        if character and ESPPlayer then
            local head = character:FindFirstChild('Head')
            if head then
                local nameEsp = head:FindFirstChild('NameEsp'..Number)
                if not nameEsp then
                    local bill = Instance.new('BillboardGui', head)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1, 200, 1, 30)
                    bill.Adornee = head
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel', bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.TextSize = 14
                    name.TextWrapped = true
                    name.Size = UDim2.new(1, 0, 1, 0)
                    name.TextYAlignment = Enum.TextYAlignment.Top
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    if player.Team == localPlayer.Team then
                        name.TextColor3 = Color3.new(0, 1, 0)
                    else
                        name.TextColor3 = Color3.new(1, 0, 0)
                    end
                    name.Text = string.format("%s \n%.1f Distance", player.Name, (localPlayerHead.Position - head.Position).Magnitude / 3)
                else
                    nameEsp.TextLabel.Text = string.format(
                        "%s | %.1f Distance\nHealth : %.0f%%",
                        player.Name,
                        (localPlayerHead.Position - head.Position).Magnitude / 3,
                        (character.Humanoid.Health / character.Humanoid.MaxHealth) * 100
                    )
                end
            end
        elseif character then
            local nameEsp = character.Head:FindFirstChild('NameEsp'..Number)
            if nameEsp then
                nameEsp:Destroy()
            end
        end
    end
end

function UpdateChestChams() 
    local workspace = game:GetService("Workspace")
    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    local localPlayerHead = localPlayer.Character and localPlayer.Character:FindFirstChild("Head")
    if not localPlayerHead then 
        return 
    end
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v.Name:find("Chest") then
            if ChestESP then
                if not v:FindFirstChild('NameEsp' .. Number) then
                    local bill = Instance.new('BillboardGui', v)
                    bill.Name = 'NameEsp' .. Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1, 200, 1, 30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel', bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.TextSize = 14
                    name.TextWrapped = true
                    name.Size = UDim2.new(1, 0, 1, 0)
                    name.TextYAlignment = Enum.TextYAlignment.Top
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    local distance = round((localPlayerHead.Position - v.Position).Magnitude / 3)
                    if v.Name == "Chest1" then
                        name.TextColor3 = Color3.fromRGB(109, 109, 109)
                        name.Text = "Chest 1\n" .. distance .. " Distance"
                    elseif v.Name == "Chest2" then
                        name.TextColor3 = Color3.fromRGB(173, 158, 21)
                        name.Text = "Chest 2\n" .. distance .. " Distance"
                    elseif v.Name == "Chest3" then
                        name.TextColor3 = Color3.fromRGB(85, 255, 255)
                        name.Text = "Chest 3\n" .. distance .. " Distance"
                    end
                else
                    local distance = round((localPlayerHead.Position - v.Position).Magnitude / 3)
                    v['NameEsp' .. Number].TextLabel.Text = v.Name .. "\n" .. distance .. " Distance"
                end
            else
                local nameEsp = v:FindFirstChild('NameEsp' .. Number)
                if nameEsp then
                    nameEsp:Destroy()
                end
            end
        end
    end
end

function UpdateDevilChams()
    local workspace = game:GetService("Workspace")
    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    local localPlayerHead = localPlayer.Character and localPlayer.Character:FindFirstChild("Head")
    if not localPlayerHead then 
        return 
    end
    for _, v in pairs(workspace:GetChildren()) do
        if DevilFruitESP then
            if v:IsA("Model") and v.Name:find("Fruit") and v:FindFirstChild("Handle") then
                local handle = v.Handle
                local nameEsp = handle:FindFirstChild('NameEsp' .. Number)
                local distance = round((localPlayerHead.Position - handle.Position).Magnitude / 3)
                if not nameEsp then
                    local bill = Instance.new('BillboardGui', handle)
                    bill.Name = 'NameEsp' .. Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1, 200, 1, 30)
                    bill.Adornee = handle
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel', bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.TextSize = 14
                    name.TextWrapped = true
                    name.Size = UDim2.new(1, 0, 1, 0)
                    name.TextYAlignment = Enum.TextYAlignment.Top
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(255, 255, 255)
                    name.Text = v.Name .. "\n" .. distance .. " Distance"
                else
                    nameEsp.TextLabel.Text = v.Name .. "\n" .. distance .. " Distance"
                end
            end
        else
            if v:IsA("Model") and v:FindFirstChild("Handle") then
                local nameEsp = v.Handle:FindFirstChild('NameEsp' .. Number)
                if nameEsp then
                    nameEsp:Destroy()
                end
            end
        end
    end
end

function UpdateFlowerChams() 
    local workspace = game:GetService("Workspace")
    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    local localPlayerHead = localPlayer.Character and localPlayer.Character:FindFirstChild("Head")
    if not localPlayerHead then 
        return 
    end
    for _, v in pairs(workspace:GetChildren()) do
        if v.Name == "Flower2" or v.Name == "Flower1" then
            if FlowerESP then 
                if not v:FindFirstChild('NameEsp' .. Number) then
                    local bill = Instance.new('BillboardGui', v)
                    bill.Name = 'NameEsp' .. Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1, 200, 1, 30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel', bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.TextSize = 14
                    name.TextWrapped = true
                    name.Size = UDim2.new(1, 0, 1, 0)
                    name.TextYAlignment = Enum.TextYAlignment.Top
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    local distance = round((localPlayerHead.Position - v.Position).Magnitude / 3)
                    if v.Name == "Flower1" then 
                        name.Text = "Blue Flower\n" .. distance .. " Distance"
                        name.TextColor3 = Color3.fromRGB(0, 0, 255)
                    elseif v.Name == "Flower2" then
                        name.Text = "Red Flower\n" .. distance .. " Distance"
                        name.TextColor3 = Color3.fromRGB(255, 0, 0)
                    end
                else
                    local distance = round((localPlayerHead.Position - v.Position).Magnitude / 3)
                    v['NameEsp' .. Number].TextLabel.Text = v.Name .. "\n" .. distance .. " Distance"
                end
            else
                local nameEsp = v:FindFirstChild('NameEsp' .. Number)
                if nameEsp then
                    nameEsp:Destroy()
                end
            end
        end
    end
end

local function updateFruitEsp(spawner, color)
    local workspace = game:GetService("Workspace")
    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    local localPlayerHead = localPlayer.Character and localPlayer.Character:FindFirstChild("Head")
    if not localPlayerHead then 
        return 
    end
    for _, v in pairs(workspace[spawner]:GetChildren()) do
        if v:IsA("Tool") then
            if RealFruitESP then 
                local handle = v:FindFirstChild("Handle")
                if handle and not handle:FindFirstChild('NameEsp' .. Number) then
                    local bill = Instance.new('BillboardGui', handle)
                    bill.Name = 'NameEsp' .. Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1, 200, 1, 30)
                    bill.Adornee = handle
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel', bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.TextSize = 14
                    name.TextWrapped = true
                    name.Size = UDim2.new(1, 0, 1, 0)
                    name.TextYAlignment = Enum.TextYAlignment.Top
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = color
                    local distance = round((localPlayerHead.Position - handle.Position).Magnitude / 3)
                    name.Text = v.Name .. "\n" .. distance .. " Distance"
                elseif handle then
                    local distance = round((localPlayerHead.Position - handle.Position).Magnitude / 3)
                    handle['NameEsp' .. Number].TextLabel.Text = v.Name .. " " .. distance .. " Distance"
                end
            else
                local handle = v:FindFirstChild("Handle")
                if handle and handle:FindFirstChild('NameEsp' .. Number) then
                    handle:FindFirstChild('NameEsp' .. Number):Destroy()
                end
            end 
        end
    end
end
function UpdateRealFruitChams()
    updateFruitEsp("AppleSpawner", Color3.fromRGB(255, 0, 0))
    updateFruitEsp("PineappleSpawner", Color3.fromRGB(255, 174, 0))
    updateFruitEsp("BananaSpawner", Color3.fromRGB(251, 255, 0))
end

function UpdateIslandESP() 
    local workspace = game:GetService("Workspace")
    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    local localPlayerHead = localPlayer.Character and localPlayer.Character:FindFirstChild("Head")
    if not localPlayerHead then 
        return 
    end
    for _, v in pairs(workspace["_WorldOrigin"].Locations:GetChildren()) do
        if IslandESP then 
            if v.Name ~= "Sea" then
                if not v:FindFirstChild('NameEsp') then
                    local bill = Instance.new('BillboardGui', v)
                    bill.Name = 'NameEsp'
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1, 200, 1, 30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel', bill)
                    name.Font = Enum.Font.GothamBold
                    name.TextSize = 14
                    name.TextWrapped = true
                    name.Size = UDim2.new(1, 0, 1, 0)
                    name.TextYAlignment = Enum.TextYAlignment.Top
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(7, 236, 240)
                else
                    local distance = round((localPlayerHead.Position - v.Position).Magnitude / 3)
                    v['NameEsp'].TextLabel.Text = v.Name .. ' \n' .. distance .. ' Distance'
                end
            end
        else
            local nameEsp = v:FindFirstChild('NameEsp')
            if nameEsp then
                nameEsp:Destroy()
            end
        end
    end
end

function isnil(thing)
	return (thing == nil)
end
local function round(n)
	return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)

function UpdatePlayerChams()
    local players = game:GetService('Players')
    local localPlayer = players.LocalPlayer
    local localPlayerHead = localPlayer.Character and localPlayer.Character:FindFirstChild("Head")
    if not localPlayerHead then 
        return 
    end 
    for _, player in pairs(players:GetPlayers()) do
        local character = player.Character
        if character then
            local head = character:FindFirstChild("Head")
            if ESPPlayer then
                if head and not head:FindFirstChild('NameEsp' .. Number) then
                    local bill = Instance.new('BillboardGui', head)
                    bill.Name = 'NameEsp' .. Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1, 200, 1, 30)
                    bill.Adornee = head
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel', bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.TextSize = 14
                    name.TextWrapped = true
                    name.Size = UDim2.new(1, 0, 1, 0)
                    name.TextYAlignment = Enum.TextYAlignment.Top
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.Text = player.Name .. ' \n' .. round((localPlayerHead.Position - head.Position).Magnitude / 3) .. ' Distance'
                    if player.Team == localPlayer.Team then
                        name.TextColor3 = Color3.new(0, 1, 0)
                    else
                        name.TextColor3 = Color3.new(1, 0, 0)
                    end
                elseif head then
                    head['NameEsp' .. Number].TextLabel.Text = player.Name .. ' | ' .. round((localPlayerHead.Position - head.Position).Magnitude / 3) .. ' Distance\nHealth : ' .. round(character.Humanoid.Health * 100 / character.Humanoid.MaxHealth) .. '%'
                end
            else
                if head and head:FindFirstChild('NameEsp' .. Number) then
                    head:FindFirstChild('NameEsp' .. Number):Destroy()
                end
            end
        end
    end
end

function UpdateChestChams()
    local localPlayer = game.Players.LocalPlayer
    local localPlayerHead = localPlayer.Character and localPlayer.Character:FindFirstChild("Head")
    if not localPlayerHead then 
        return 
    end
    for _, v in ipairs(game.Workspace:GetChildren()) do
        if string.find(v.Name, "Chest") then
            if ChestESP then
                local nameEsp = v:FindFirstChild('NameEsp' .. Number)
                if not nameEsp then
                    local bill = Instance.new('BillboardGui', v)
                    bill.Name = 'NameEsp' .. Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1, 200, 1, 30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true

                    local name = Instance.new('TextLabel', bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.TextSize = 14
                    name.TextWrapped = true
                    name.Size = UDim2.new(1, 0, 1, 0)
                    name.TextYAlignment = Enum.TextYAlignment.Top
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    if v.Name == "Chest1" then
                        name.TextColor3 = Color3.fromRGB(109, 109, 109)
                        name.Text = ("Chest 1" .. ' \n' .. round((localPlayerHead.Position - v.Position).Magnitude / 3) .. ' Distance')
                    elseif v.Name == "Chest2" then
                        name.TextColor3 = Color3.fromRGB(173, 158, 21)
                        name.Text = ("Chest 2" .. ' \n' .. round((localPlayerHead.Position - v.Position).Magnitude / 3) .. ' Distance')
                    elseif v.Name == "Chest3" then
                        name.TextColor3 = Color3.fromRGB(85, 255, 255)
                        name.Text = ("Chest 3" .. ' \n' .. round((localPlayerHead.Position - v.Position).Magnitude / 3) .. ' Distance')
                    end
                else
                    nameEsp.TextLabel.Text = (v.Name .. '   \n' .. round((localPlayerHead.Position - v.Position).Magnitude / 3) .. ' Distance')
                end
            else
                if v:FindFirstChild('NameEsp' .. Number) then
                    v:FindFirstChild('NameEsp' .. Number):Destroy()
                end
            end
        end
    end
end

function UpdateDevilChams()
    local localPlayer = game.Players.LocalPlayer
    local localPlayerHead = localPlayer.Character and localPlayer.Character:FindFirstChild("Head")
    if not localPlayerHead then 
        return 
    end
    for _, v in ipairs(game.Workspace:GetChildren()) do
        if DevilFruitESP and string.find(v.Name, "Fruit") then
            local nameEsp = v.Handle and v.Handle:FindFirstChild('NameEsp' .. Number)
            if not nameEsp then
                local bill = Instance.new('BillboardGui', v.Handle)
                bill.Name = 'NameEsp' .. Number
                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                bill.Size = UDim2.new(1, 200, 1, 30)
                bill.Adornee = v.Handle
                bill.AlwaysOnTop = true
                local name = Instance.new('TextLabel', bill)
                name.Font = Enum.Font.GothamSemibold
                name.FontSize = Enum.FontSize.Size14
                name.TextWrapped = true
                name.Size = UDim2.new(1, 0, 1, 0)
                name.TextYAlignment = Enum.TextYAlignment.Top
                name.BackgroundTransparency = 1
                name.TextStrokeTransparency = 0.5
                name.TextColor3 = Color3.fromRGB(255, 255, 255)
                name.Text = (v.Name .. ' \n' .. round((localPlayerHead.Position - v.Handle.Position).Magnitude / 3) .. ' Distance')
            else
                nameEsp.TextLabel.Text = (v.Name .. '   \n' .. round((localPlayerHead.Position - v.Handle.Position).Magnitude / 3) .. ' Distance')
            end
        else
            if v.Handle and v.Handle:FindFirstChild('NameEsp' .. Number) then
                v.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
            end
        end
    end
end

function UpdateFlowerChams()
    local localPlayer = game.Players.LocalPlayer
    local localPlayerHead = localPlayer.Character and localPlayer.Character:FindFirstChild("Head")
    if not localPlayerHead then 
        return 
    end
    for _, v in ipairs(game.Workspace:GetChildren()) do
        if v.Name == "Flower1" or v.Name == "Flower2" then
            local nameEsp = v:FindFirstChild('NameEsp' .. Number)
            if FlowerESP then
                if not nameEsp then
                    local bill = Instance.new('BillboardGui', v)
                    bill.Name = 'NameEsp' .. Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1, 200, 1, 30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel', bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = Enum.FontSize.Size14
                    name.TextWrapped = true
                    name.Size = UDim2.new(1, 0, 1, 0)
                    name.TextYAlignment = Enum.TextYAlignment.Top
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = v.Name == "Flower1" and Color3.fromRGB(0, 0, 255) or Color3.fromRGB(255, 0, 0)
                    name.Text = (v.Name .. ' \n' .. round((localPlayerHead.Position - v.Position).Magnitude / 3) .. ' Distance')
                else
                    nameEsp.TextLabel.Text = (v.Name .. '   \n' .. round((localPlayerHead.Position - v.Position).Magnitude / 3) .. ' Distance')
                end
            else
                if nameEsp then
                    nameEsp:Destroy()
                end
            end
        end
    end
end

function UpdateRealFruitChams()
    local localPlayer = game.Players.LocalPlayer
    local localPlayerHead = localPlayer.Character and localPlayer.Character:FindFirstChild("Head")
    if not localPlayerHead then 
        return 
    end
    local function createOrUpdateBillboard(v, textColor, typeName)
        local nameEsp = v.Handle:FindFirstChild('NameEsp' .. Number)
        if not nameEsp then
            local bill = Instance.new('BillboardGui', v.Handle)
            bill.Name = 'NameEsp' .. Number
            bill.ExtentsOffset = Vector3.new(0, 1, 0)
            bill.Size = UDim2.new(1, 200, 1, 30)
            bill.Adornee = v.Handle
            bill.AlwaysOnTop = true
            local name = Instance.new('TextLabel', bill)
            name.Font = Enum.Font.GothamSemibold
            name.FontSize = Enum.FontSize.Size14
            name.TextWrapped = true
            name.Size = UDim2.new(1, 0, 1, 0)
            name.TextYAlignment = Enum.TextYAlignment.Top
            name.BackgroundTransparency = 1
            name.TextStrokeTransparency = 0.5
            name.TextColor3 = textColor
            name.Text = (typeName .. ' \n' .. round((localPlayerHead.Position - v.Handle.Position).Magnitude / 3) .. ' Distance')
        else
            nameEsp.TextLabel.Text = (typeName .. ' \n' .. round((localPlayerHead.Position - v.Handle.Position).Magnitude / 3) .. ' Distance')
        end
    end
    for _, v in ipairs(game.Workspace.AppleSpawner:GetChildren()) do
        if v:IsA("Tool") then
            if RealFruitESP then
                createOrUpdateBillboard(v, Color3.fromRGB(255, 0, 0), v.Name)
            else
                local nameEsp = v.Handle:FindFirstChild('NameEsp' .. Number)
                if nameEsp then
                    nameEsp:Destroy()
                end
            end
        end
    end
    for _, v in ipairs(game.Workspace.PineappleSpawner:GetChildren()) do
        if v:IsA("Tool") then
            if RealFruitESP then
                createOrUpdateBillboard(v, Color3.fromRGB(255, 174, 0), v.Name)
            else
                local nameEsp = v.Handle:FindFirstChild('NameEsp' .. Number)
                if nameEsp then
                    nameEsp:Destroy()
                end
            end
        end
    end
    for _, v in ipairs(game.Workspace.BananaSpawner:GetChildren()) do
        if v:IsA("Tool") then
            if RealFruitESP then
                createOrUpdateBillboard(v, Color3.fromRGB(251, 255, 0), v.Name)
            else
                local nameEsp = v.Handle:FindFirstChild('NameEsp' .. Number)
                if nameEsp then
                    nameEsp:Destroy()
                end
            end
        end
    end
end

spawn(function()
    while wait() do
        if MobESP then
            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v:FindFirstChild('HumanoidRootPart') then
                    if not v:FindFirstChild("MobEap") then
                        local BillboardGui = Instance.new("BillboardGui")
                        BillboardGui.Parent = v
                        BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                        BillboardGui.Active = true
                        BillboardGui.Name = "MobEap"
                        BillboardGui.AlwaysOnTop = true
                        BillboardGui.LightInfluence = 1.000
                        BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                        BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
                        local TextLabel = Instance.new("TextLabel")
                        TextLabel.Parent = BillboardGui
                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.BackgroundTransparency = 1.000
                        TextLabel.Size = UDim2.new(0, 200, 0, 50)
                        TextLabel.Font = Enum.Font.GothamBold
                        TextLabel.TextColor3 = Color3.fromRGB(7, 236, 240)
                        TextLabel.TextSize = 35
                        local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude)
                        TextLabel.Text = v.Name.." - "..Dis.." Distance"
                    else
                        local TextLabel = v.MobEap:FindFirstChild("TextLabel")
                        if TextLabel then
                            local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude)
                            TextLabel.Text = v.Name.." - "..Dis.." Distance"
                        end
                    end
                end
            end
        else
            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v:FindFirstChild("MobEap") then
                    v.MobEap:Destroy()
                end
            end
        end
    end
end)

spawn(function()
    while wait() do
        if SeaESP then
            for _, v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                if v:FindFirstChild('HumanoidRootPart') then
                    if not v:FindFirstChild("Seaesps") then
                        local BillboardGui = Instance.new("BillboardGui")
                        BillboardGui.Parent = v
                        BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                        BillboardGui.Active = true
                        BillboardGui.Name = "Seaesps"
                        BillboardGui.AlwaysOnTop = true
                        BillboardGui.LightInfluence = 1.000
                        BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                        BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
                        local TextLabel = Instance.new("TextLabel")
                        TextLabel.Parent = BillboardGui
                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.BackgroundTransparency = 1.000
                        TextLabel.Size = UDim2.new(0, 200, 0, 50)
                        TextLabel.Font = Enum.Font.GothamBold
                        TextLabel.TextColor3 = Color3.fromRGB(7, 236, 240)
                        TextLabel.TextSize = 35
                        local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude)
                        TextLabel.Text = v.Name.." - "..Dis.." Distance"
                    else
                        local TextLabel = v.Seaesps:FindFirstChild("TextLabel")
                        if TextLabel then
                            local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude)
                            TextLabel.Text = v.Name.." - "..Dis.." Distance"
                        end
                    end
                end
            end
        else
            for _, v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                if v:FindFirstChild("Seaesps") then
                    v.Seaesps:Destroy()
                end
            end
        end
    end
end)

spawn(function()
    while wait() do
        if NpcESP then
            for _, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                if v:FindFirstChild('HumanoidRootPart') then
                    if not v:FindFirstChild("NpcEspes") then
                        local BillboardGui = Instance.new("BillboardGui")
                        BillboardGui.Parent = v
                        BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                        BillboardGui.Active = true
                        BillboardGui.Name = "NpcEspes"
                        BillboardGui.AlwaysOnTop = true
                        BillboardGui.LightInfluence = 1.000
                        BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                        BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
                        local TextLabel = Instance.new("TextLabel")
                        TextLabel.Parent = BillboardGui
                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.BackgroundTransparency = 1.000
                        TextLabel.Size = UDim2.new(0, 200, 0, 50)
                        TextLabel.Font = Enum.Font.GothamBold
                        TextLabel.TextColor3 = Color3.fromRGB(7, 236, 240)
                        TextLabel.TextSize = 35
                    end
                    local TextLabel = v:FindFirstChild("NpcEspes") and v.NpcEspes:FindFirstChild("TextLabel")
                    if TextLabel then
                        local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude)
                        TextLabel.Text = v.Name.." - "..Dis.." Distance"
                    end
                end
            end
        else
            for _, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                if v:FindFirstChild("NpcEspes") then
                    v.NpcEspes:Destroy()
                end
            end
        end
    end
end)

function isnil(thing)
    return (thing == nil)
end
local function round(n)
    return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)

function UpdateIslandMirageESP() 
    if MirageIslandESP then
        for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            if v.Name == "Mirage Island" then
                if not v:FindFirstChild('NameEsp') then
                    local bill = Instance.new('BillboardGui', v)
                    bill.Name = 'NameEsp'
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1, 200, 1, 30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel', bill)
                    name.Font = Enum.Font.Code
                    name.FontSize = Enum.FontSize.Size14
                    name.TextWrapped = true
                    name.Size = UDim2.new(1, 0, 1, 0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(80, 245, 245)
                end
                v['NameEsp'].TextLabel.Text = (v.Name .. '   \n' .. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude / 3) .. ' M')
            end
        end
    else
        for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            if v:FindFirstChild('NameEsp') then
                v:FindFirstChild('NameEsp'):Destroy()
            end
        end
    end
end

function isnil(thing)
    return (thing == nil)
end
local function round(n)
    return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)

function UpdateAfdESP() 
    if AfdESP then
        for _, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
            if v.Name == "Advanced Fruit Dealer" then
                if not v:FindFirstChild('NameEsp') then
                    local bill = Instance.new('BillboardGui', v)
                    bill.Name = 'NameEsp'
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1, 200, 1, 30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel', bill)
                    name.Font = Enum.Font.Code
                    name.FontSize = Enum.FontSize.Size14
                    name.TextWrapped = true
                    name.Size = UDim2.new(1, 0, 1, 0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(80, 245, 245)
                end
                v['NameEsp'].TextLabel.Text = (v.Name .. '   \n' .. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude / 3) .. ' M')
            end
        end
    else
        for _, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
            if v:FindFirstChild('NameEsp') then
                v:FindFirstChild('NameEsp'):Destroy()
            end
        end
    end
end

function UpdateAuraESP()
    if AuraESP then
        local NPCs = game:GetService("Workspace").NPCs:GetChildren()
        for _, v in ipairs(NPCs) do
            if v.Name == "Master of Enhancement" then
                local nameEsp = v:FindFirstChild('NameEsp')
                if not nameEsp then
                    local bill = Instance.new('BillboardGui', v)
                    bill.Name = 'NameEsp'
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1, 200, 1, 30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel', bill)
                    name.Font = Enum.Font.Code
                    name.FontSize = Enum.FontSize.Size14
                    name.TextWrapped = true
                    name.Size = UDim2.new(1, 0, 1, 0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(80, 245, 245)
                    nameEsp = name
                end
                local distanceText = v.Name .. '   \n' .. round((game.Players.LocalPlayer.Character.Head.Position - v.Position).Magnitude / 3) .. ' M'
                nameEsp.Text = distanceText
            end
        end
    else
        local NPCs = game:GetService("Workspace").NPCs:GetChildren()
        for _, v in ipairs(NPCs) do
            local nameEsp = v:FindFirstChild('NameEsp')
            if nameEsp then
                nameEsp:Destroy()
            end
        end
    end
end

function UpdateLSDESP()
    if LADESP then
        local NPCs = game:GetService("Workspace").NPCs:GetChildren()
        for _, v in ipairs(NPCs) do
            if v.Name == "Legendary Sword Dealer" then
                local nameEsp = v:FindFirstChild('NameEsp')
                if not nameEsp then
                    local bill = Instance.new('BillboardGui', v)
                    bill.Name = 'NameEsp'
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1, 200, 1, 30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel', bill)
                    name.Font = Enum.Font.Code
                    name.FontSize = Enum.FontSize.Size14
                    name.TextWrapped = true
                    name.Size = UDim2.new(1, 0, 1, 0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(80, 245, 245)
                    nameEsp = name
                end
                local distanceText = v.Name .. '   \n' .. round((game.Players.LocalPlayer.Character.Head.Position - v.Position).Magnitude / 3) .. ' M'
                nameEsp.Text = distanceText
            end
        end
    else
        local NPCs = game:GetService("Workspace").NPCs:GetChildren()
        for _, v in ipairs(NPCs) do
            local nameEsp = v:FindFirstChild('NameEsp')
            if nameEsp then
                nameEsp:Destroy()
            end
        end
    end
end

function UpdateGeaESP() 
    if GearESP then
        local mysticIslandChildren = game:GetService("Workspace").Map.MysticIsland:GetChildren()
        for _, v in ipairs(mysticIslandChildren) do
            if v.Name == "MeshPart" then
                local nameEsp = v:FindFirstChild('NameEsp')
                if not nameEsp then
                    local bill = Instance.new('BillboardGui', v)
                    bill.Name = 'NameEsp'
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1, 200, 1, 30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel', bill)
                    name.Font = Enum.Font.Code
                    name.FontSize = Enum.FontSize.Size14
                    name.TextWrapped = true
                    name.Size = UDim2.new(1, 0, 1, 0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(80, 245, 245)
                    nameEsp = name
                end
                local distanceText = v.Name .. '   \n' .. round((game.Players.LocalPlayer.Character.Head.Position - v.Position).Magnitude / 3) .. ' M'
                nameEsp.Text = distanceText
            end
        end
    else
        local mysticIslandChildren = game:GetService("Workspace").Map.MysticIsland:GetChildren()
        for _, v in ipairs(mysticIslandChildren) do
            local nameEsp = v:FindFirstChild('NameEsp')
            if nameEsp then
                nameEsp:Destroy()
            end
        end
    end
end
