
-- Library GUI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Vectic X Hub - Free", "DarkTheme")
-- GUI TAB 1 Library
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Main game")

local Section1 = Tab:NewSection("Visual")

-- GUI TAB 2 Library
local Tab2 = Window:NewTab("Race Mode")
local Section2 = Tab2:NewSection("Race")

-- GUI TAB 3 Library
local Tab3 = Window:NewTab("Misc")
local Section3 = Tab3:NewSection("Humanoid")
local Section4 = Tab3:NewSection("Player")
local Section5 = Tab3:NewSection("ESP Player")
local Section6 = Tab3:NewSection("Game")

-- GUI TAB 4 Library
local setting = Window:NewTab("Setting")
local Tabsetting1 = setting:NewSection("Keybind UI")

-- configs game
_G.farm = false
_G.Rebirth = false
_G.Gem = false
_G.autoOpencrystal = false
_G.selectedCrystal = "Blue Crystal"
_G.farmall = false
_G.autorace = false
_G.autojoin = false
_G.WalkSpeed = 16
_G.JumpPower = 100
_G.ESPplayer = false






-- Global local 
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Client = Players.LocalPlayer
local TeleportService = game:GetService("TeleportService")
local player = game.Players.LocalPlayer




-- Source Code

-- Anti AFK Kick
local VirtualUser = game:GetService("VirtualUser")
local player = game.Players.LocalPlayer

player.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
    print("Anti AFK")
end)


-- Local Funtion GUI TAB 1 Main
local function AutoFarm()

RunService.Heartbeat:Connect(function()
    if _G.farm == true then

        local args = {
            [1] = "collectOrb",
            [2] = "Ethereal Orb",
            [3] = "City"
        }   
    
        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
    end
end)
end

local function autoRebirth()
    RunService.Heartbeat:Connect(function()
    if _G.Rebirth == true then
        local args = {
            [1] = "rebirthRequest"
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("rebirthEvent"):FireServer(unpack(args))        
    end    
    end)
end

local function autogem()
    RunService.Heartbeat:Connect(function()
    if _G.Gem == true then
        local args = {
            [1] = "collectOrb",
            [2] = "Gem",
            [3] = "City"
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
        
        local args = {
            [1] = "collectOrb",
            [2] = "Infernal Gem",
            [3] = "City"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
    end  
    end)
end

local function autoOpencrystal()
    RunService.Heartbeat:Connect(function()
        if _G.autoOpencrystal == true then
            local args = {
                [1] = "openCrystal",
                [2] = _G.selectedCrystal
            }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("openCrystalRemote"):InvokeServer(unpack(args))

        end  
        end)  
end

local function autoOrb()
    RunService.Heartbeat:Connect(function()
        if _G.farmall == true then
            local args = {
                [1] = "collectOrb",
                [2] = "Orange Orb",
                [3] = "City"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
            
            local args = {
                [1] = "collectOrb",
                [2] = "Ethereal Orb",
                [3] = "City"
            }   
        
            game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))

            local args = {
                [1] = "collectOrb",
                [2] = "Infernal Gem",
                [3] = "City"
            }   
        
            game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))

            local args = {
                [1] = "collectOrb",
                [2] = "Red Orb",
                [3] = "City"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
            
            local args = {
                [1] = "collectOrb",
                [2] = "Gem",
                [3] = "City"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
            
            local args = {
                [1] = "collectOrb",
                [2] = "Blue Orb",
                [3] = "City"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
            
            local args = {
                [1] = "collectOrb",
                [2] = "Yellow Orb",
                [3] = "City"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
            
        end
        
    end)
end

-- Local Function GUI TAB 2 Race

local function autorace()
    RunService.Heartbeat:Connect(function()
        if not _G.autorace then return end

        local raceMaps = workspace:FindFirstChild("raceMaps")
        if not raceMaps then
            return
        end

        local currentMap = Client:FindFirstChild("currentMap")
        if not currentMap then
            return
        end



        for _, v in pairs(raceMaps:GetChildren()) do
            local mapValue = v:FindFirstChild("mapValue")
            if mapValue then
                if currentMap.Value == mapValue.Value then
                    repeat task.wait() until Client.PlayerGui.gameGui.countdownLabels.goLabel.Visible == false
                    local finishPart = v:FindFirstChild("finishPart")
                    if finishPart then
                        Client.Character.HumanoidRootPart.CFrame = finishPart.CFrame
                    else
                    end
                end
            else
            end
        end
    end)
end

local function autojoin()
    RunService.Heartbeat:Connect(function()
        if _G.autojoin == true then
            local args = {
                [1] = "joinRace"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("raceEvent"):FireServer(unpack(args))            
        end
    end)
end

-- Local Function GUI TAB 3 Misc

local function WalkSpeed(Speed)
    local Humanoid = Client.Character.Humanoid
        if Humanoid then
            Humanoid.WalkSpeed = Speed
        end
    end

local function JumpPower(Power)
    local Humanoid = Client.Character.Humanoid
        if Humanoid then
             Humanoid.JumpPower = Power
        end
    end

local function Resetcharacter(Reset)
    local Humanoid = Client.Character.Humanoid 
    Humanoid.Health = Reset
end
local function RebrithHand()
    local args = {
        [1] = "rebirthRequest"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("rebirthEvent"):FireServer(unpack(args))
end

local function joinRaceHand()
    local args = {
        [1] = "joinRace"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("raceEvent"):FireServer(unpack(args))
end



local function rejoinGame()
    local placeId = game.PlaceId
    local jobId = game.JobId

    TeleportService:TeleportToPlaceInstance(placeId, jobId, player)
end


-- Local Funtion ESP GUI TAB 3 Misc 

local RunService = game:GetService("RunService")
local ESP = {}
ESP.Enabled = true
ESP.Color = Color3.fromRGB(0, 255, 0) -- สีเขียว
ESP.OutlineColor = Color3.fromRGB(0, 0, 0) -- ขอบดำ
ESP.Thickness = 2 -- ความหนาของเส้นขอบ

local function ESPCreate(player)
    local espPart = Instance.new("BillboardGui")
    espPart.Adornee = player.Character.Head
    espPart.Size = UDim2.new(0, 100, 0, 50)
    espPart.StudsOffset = Vector3.new(0, 2, 0)
    espPart.AlwaysOnTop = true

    local label = Instance.new("TextLabel")
    label.Text = player.Name
    label.TextColor3 = ESP.Color
    label.TextStrokeTransparency = 0
    label.TextStrokeColor3 = ESP.OutlineColor
    label.TextSize = 20
    label.Font = Enum.Font.SourceSansBold
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Parent = espPart

    espPart.Parent = player.Character

    return espPart
end


local function ToggleESP()
    
        if _G.ESPplayer == true then
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("Head") then
                ESPCreate(player) 
            end
        end
    end
end
        

local function DestroyESP()
    
        if _G.ESPplayer == false then
            for _, player in pairs(game.Players:GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("Head") then
                    if player.Character:FindFirstChildOfClass("BillboardGui") then
                        player.Character:FindFirstChildOfClass("BillboardGui"):Destroy()
                    end
                end
            end
        end
end

local function UpdateESP()
    RunService.Heartbeat:Connect(function()
        if _G.ESPplayer == true then
            for _, player in pairs(Players:GetPlayers()) do
                -- ตรวจสอบว่าผู้เล่นมีตัวละครและมี "Head"
                if player.Character and player.Character:FindFirstChild("Head") then
                    -- ถ้าผู้เล่นยังไม่มี ESP (BillboardGui) จะสร้าง ESP
                    if not player.Character:FindFirstChildOfClass("BillboardGui") then
                        ESPCreate(player)  -- เรียกใช้ฟังก์ชันสร้าง ESP
                        print("Updated ESP for", player.Name)
                    end
                end
            end
        end
    end)
end




-- GUI TAB 1 Main
Section:NewToggle("Auto Farm", "auto farm exp boost!", function(state)
    if state then
        _G.farm = true
        AutoFarm()
    else
        _G.farm = false
    end
end)

Section:NewToggle("Auto Rebirth", "Auto Rebirth at max level", function(state)
    if state then
        _G.Rebirth = true
        autoRebirth()
    else
        _G.Rebirth = false
    end
end)

Section:NewToggle("Auto Gem", "farm gem", function(state)
    if state then
        _G.Gem = true
        autogem()
    else
        _G.Gem = false
    end
end)

Section:NewToggle("Auto Farm V2", "pick up orb all", function(state)
    if state then
        _G.farmall = true
        autoOrb()
    else 
        _G.farmall = false
    end
end)



Section1:NewDropdown("Select Crystal", "Select Crystal", {"Blue Crystal", "Red Crystal"}, function(currentOption)
    _G.selectedCrystal = currentOption
end)

Section1:NewToggle("Auto Open Crystal", "auto Open ghacha", function(state)
    if state then
        _G.autoOpencrystal = true
        autoOpencrystal()
    else
        _G.autoOpencrystal = false
    end
end)

-- GUI TAB 2 Race

Section2:NewToggle("auto Race", "auto Win", function(state)
    if state then
        _G.autorace = true
        autorace()
    else
        _G.autorace = false
    end
end)

Section2:NewToggle("auto Join", "auto join Race", function(state)
    if state then
        _G.autojoin = true
        autojoin()
    else
        _G.autojoin = false
    end
end)

-- GUI TAB 3 Misc

Section3:NewSlider("WalkSpeed", "Adjust Player Speed", 5000, 16, function(Speed)
        _G.WalkSpeed = Speed 
end)


Section3:NewToggle("Enable WalkSpeed", "Toggle WalkSpeed On/Off", function(state)
    if state then
        WalkSpeed(_G.WalkSpeed)
    else
        WalkSpeed(100)
    end
end)

Section3:NewSlider("Jump Power", "Adjust Player Jump Power", 2000, 16, function(Power)
    _G.JumpPower = Power 
end)


Section3:NewToggle("Enable JumpPower", "Toggle JumpPower On/Off", function(state)
    if state then
        JumpPower(_G.JumpPower)
    else
        JumpPower(100)
end
end)

Section4:NewButton("Reset Character", "DIE Button", function()
    Resetcharacter(0)
end)

Section4:NewButton("Rebrith Level", "Rebrith", function()
    RebrithHand()
end)

Section4:NewButton("Join Race", "Join Race by you", function()
    joinRaceHand()
end)

Section5:NewToggle("Enable ESP Player", "ESP Player", function(state)
    if state then
        _G.ESPplayer = true
        ToggleESP()
        UpdateESP()
    else
        _G.ESPplayer = false
        DestroyESP()
    end
end)

Section6:NewButton("Rejoin", "Rejoin game", function()
    rejoinGame()
end)

-- GUI TAB SETTING HUB SCRIPT 

Tabsetting1:NewKeybind("Toggle UI", "off/on UI keybind", Enum.KeyCode.LeftControl, function()
	Library:ToggleUI()
end)

-- Debug

