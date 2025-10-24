local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local player = Players.LocalPlayer

local Window = WindUI:CreateWindow({
    Icon = "venetian-mask",
    Title = "ASGARD",
    Author = "by Radit_Jebog",
    Folder = "RuinzFish",
    Theme = "Midnight",
    Transparent = true,
    Size = UDim2.fromOffset(600, 400),
    KeySystem = false,
    OpenButton = {
        Icon = "lock-open",
        CornerRadius = UDim.new(0, 16),
        StrokeThickness = 0,
        Color = ColorSequence.new(Color3.fromHex("FF0F7B"), Color3.fromHex("F89B29")),
        OnlyMobile = false,
        Enabled = true,
        Draggable = true,
    }
})


--TabMain
local MainTab = Window:Tab({
    Title = "Main",
    Icon = "fish"
})

local FuncAutoFish = {
    autofish = false,
    preRecastDelay = 0.6,
    biteDelay = 1.5
}

local autoFishLoop

local function getNetFolder()
    local packages = ReplicatedStorage:FindFirstChild("Packages")
    if packages and packages:FindFirstChild("_Index") then
        for _, child in ipairs(packages._Index:GetChildren()) do
            if child.Name:find("^sleitnick_net@") then
                return child:FindFirstChild("net")
            end
        end
    end
    return ReplicatedStorage:FindFirstChild("net") or ReplicatedStorage:FindFirstChild("Net")
end

local function getFishingRemotes()
    local net = getNetFolder()
    if not net then return nil end
    local charge = net:FindFirstChild("RF/ChargeFishingRod")
    local mini = net:FindFirstChild("RF/RequestFishingMinigameStarted")
    local cancelIn = net:FindFirstChild("RF/CancelFishingInputs")
    local equip = net:FindFirstChild("RE/EquipToolFromHotbar")
    local complete = net:FindFirstChild("RE/FishingCompleted")
    if not (charge and mini and cancelIn and equip and complete) then return nil end
    return {charge = charge, mini = mini, cancelIn = cancelIn, equip = equip, complete = complete}
end

local function castOnce()
    local r = getFishingRemotes()
    if not r then return end
    task.spawn(function()
        r.equip:FireServer(1)
        task.wait(0.05)
        r.charge:InvokeServer(Workspace:GetServerTimeNow())
        task.wait(0.05)
        r.mini:InvokeServer(-0.10, 1)
    end)
end

local function recastBeforeBite()
    local r = getFishingRemotes()
    if not r then return end
    task.spawn(function()
        r.cancelIn:InvokeServer()
        task.wait(0.05)
        r.charge:InvokeServer(Workspace:GetServerTimeNow())
        task.wait(0.05)
        r.mini:InvokeServer(-0.10, 1)
    end)
end

local function reelNow()
    local r = getFishingRemotes()
    if not r then return end
    task.spawn(function()
        for _ = 1, 25 do
            r.complete:FireServer()
            task.wait(0.015)
        end
    end)
end

local function startAutoFish()
    if autoFishLoop then task.cancel(autoFishLoop) end
    FuncAutoFish.autofish = true
    autoFishLoop = task.spawn(function()
        while FuncAutoFish.autofish do
            castOnce()
            task.wait(FuncAutoFish.preRecastDelay)
            recastBeforeBite()
            reelNow()
            task.wait(FuncAutoFish.biteDelay)
            reelNow()
        end
    end)
end

local function stopAutoFish()
    FuncAutoFish.autofish = false
    if autoFishLoop then
        task.cancel(autoFishLoop)
        autoFishLoop = nil
    end
end

local AnimFolder = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Animations")
local noAnimEnabled = false
local animConnections = {}

MainTab:Toggle({
    Title = "No Animation",
    Desc = "Menonaktifkan semua animasi dari Modules.Animations agar karakter benar-benar diam.",
    Icon = "user-x",
    Callback = function(value)
        noAnimEnabled = value
        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end
        local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)
        if value then
            WindUI:Notify({ Title = "No Animation", Content = "Semua animasi dimatikan." })
            for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                pcall(function() track:Stop() end)
            end
            local connection = animator.AnimationPlayed:Connect(function(track)
                if noAnimEnabled then
                    local anim = track.Animation
                    if anim and anim:IsDescendantOf(AnimFolder) then
                        pcall(function() track:Stop() end)
                    end
                end
            end)
            table.insert(animConnections, connection)
        else
            WindUI:Notify({ Title = "No Animation", Content = "Animasi diaktifkan kembali." })
            for _, c in ipairs(animConnections) do
                if typeof(c) == "RBXScriptConnection" then
                    c:Disconnect()
                end
            end
            animConnections = {}
        end
    end
})

local autoSellState = false
local lastSell = 0
local AUTO_SELL_DELAY = 30

MainTab:Toggle({
    Title = "Auto Sell",
    Icon = "coins",
    Callback = function(value)
        autoSellState = value
        if value then
            WindUI:Notify({ Title = "Auto Sell", Content = "Started Auto Selling" })
            task.spawn(function()
                while autoSellState do
                    pcall(function()
                        local net = getNetFolder()
                        local sellFunc = net and net:FindFirstChild("RF/SellAllItems")
                        if sellFunc and os.time() - lastSell >= AUTO_SELL_DELAY then
                            sellFunc:InvokeServer()
                            lastSell = os.time()
                        end
                    end)
                    task.wait(10)
                end
            end)
        else
            WindUI:Notify({ Title = "Auto Sell", Content = "Stopped Auto Selling" })
        end
    end
})

MainTab:Toggle({
    Title = "Anti AFK",
    Icon = "moon",
    Callback = function(value)
        if value then
            WindUI:Notify({ Title = "Anti AFK", Content = "AFK protection enabled." })
            local VirtualUser = game:GetService("VirtualUser")
            player.Idled:Connect(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        else
            WindUI:Notify({ Title = "Anti AFK", Content = "Disabled." })
        end
    end
})

MainTab:Toggle({
    Title = "Auto Fish",
    Description = "Auto lempar + tarik ikan",
    Callback = function(value)
        if value then startAutoFish() else stopAutoFish() end
    end
})

MainTab:Slider({
    Title = "Delay Spam",
    Desc = "Waktu sebelum recast (detik)",
    Step = 0.1,
    Value = { Min = 0.2, Max = 2.0, Default = 0.5 },
    Callback = function(v)
        FuncAutoFish.preRecastDelay = v
    end
})

MainTab:Slider({
    Title = "Delay Fishing",
    Desc = "Waktu sebelum tarik ikan (detik)",
    Step = 0.1,
    Value = { Min = 0.5, Max = 3.0, Default = 1.5 },
    Callback = function(v)
        FuncAutoFish.biteDelay = v
    end
})


-- 🗺️ Tab Teleport
local TabTeleport = Window:Tab({
    Title = "Teleport",
    Icon = "map-pin"
})

-- 📍 Daftar lokasi teleport
local teleportLocations = {
    ["Crater Islands"] = CFrame.new(1066.1864, 57.2025681, 5045.5542),
    ["Tropical Grove"] = CFrame.new(-2165.05469, 2.77070165, 3639.87451),
    ["Volcano Island"] = CFrame.new(-701.447937, 48.1446075, 93.1546631),
    ["Coral Reefs"] = CFrame.new(-3118.39624, 2.42531538, 2135.26392),
    ["Winter Tundra"] = CFrame.new(2036.15308, 6.54998732, 3381.88916),
    ["Weather Machine"] = CFrame.new(-1459.3772, 14.7103214, 1831.5188),
    ["Treasure Room"] = CFrame.new(-3625.0708, -279.074219, -1594.57605),
    ["Sisyphus Statue"] = CFrame.new(-3777.43433, -135.074417, -975.198975),
    ["Fisherman Island"] = CFrame.new(-75.2439423, 3.24433279, 3103.45093),
    ["Ancient Jungle"] = CFrame.new(1630.15234, 6.62499952, -724.767212),
    ["Sacred Temple"] = CFrame.new(1468.44946, -22.1250019, -651.350342),
}

-- 🚀 Fungsi teleport
local function teleportTo(cf)
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = cf
        WindUI:Notify({
            Title = "🚀 Teleport",
            Content = "Berhasil teleport!",
        })
    else
        warn("HumanoidRootPart tidak ditemukan!")
    end
end

-- 🔽 Dropdown Teleport
local locationNames = {}
for name in pairs(teleportLocations) do
    table.insert(locationNames, name)
end

TabTeleport:Dropdown({
    Title = "Select Teleport Location",
    Desc = "Pilih lokasi untuk teleport",
    Values = locationNames,
    Value = nil,
    Multi = false,
    AllowNone = false,
    Callback = function(selected)
        local cf = teleportLocations[selected]
        if cf then
            teleportTo(cf)
        else
            warn("Lokasi teleport tidak ditemukan:", selected)
        end
    end
})

