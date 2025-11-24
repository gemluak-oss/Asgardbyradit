  19:35:32.239  DataModel Loading https://assetdelivery.roblox.com/v1/asset/?id=95206881  -  Studio
  19:35:38.955  > --// ANTI DEOBFUSCATE GODMODE
--// Script akan rusak jika di edit

math.randomseed(os.time())

local RAW_SCRIPT = [[
print("    --==================================================
    -- 🌟 LIBRARY & SERVICES
    --==================================================
    local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Workspace = game:GetService("Workspace")
    local RunService = game:GetService("RunService")
    local player = Players.LocalPlayer

    WindUI:AddTheme({
        Name = "Elegant",

        Accent = Color3.fromHex("#FF8C32"),
        Dialog = Color3.fromHex("#000000"),
        Outline = Color3.fromHex("#444444"),
        Text = Color3.fromHex("#FFFFFF"),
        Placeholder = Color3.fromHex("#AAAAAA"),
        Background = Color3.fromHex("#000000"),
        Button = Color3.fromHex("#FF9B26"),
        Icon = Color3.fromHex("#FF7B00"),
        DialogBackground = Color3.fromHex("#262626")

    })

    WindUI:SetTheme("Elegant")

    --==================================================
    -- 🌟 WINDOW SETUP
    --==================================================
    local Window = WindUI:CreateWindow({
        Icon = "rbxassetid://136343770817701",
        Title = "Ruinz",
        Folder = "RuinzFishit",
        Theme = "Elegant",
        SideBarWidth = 140,
        Resizable = false,
        Transparent = false,
        Size = UDim2.fromOffset(400, 200),
        KeySystem = false,
        OpenButton = {
            Icon = "rbxassetid://136343770817701",
            CornerRadius = UDim.new(0, 16),
            StrokeThickness = 0,
            Color = ColorSequence.new(Color3.fromHex("FF0F7B"), Color3.fromHex("F89B29")),
            OnlyMobile = false,
            Enabled = true,
            Draggable = true,
        }
    })
    Window:SetIconSize(45)
    Window:Tag({
        Title = "LITE",
        Icon = "", 
        Color = Color3.fromHex("#F5F5F5"),
        Radius = 10,
        Outline = Color3.fromHex("#EAEAEA"),
        Shadow = true
    })




    --======================================================
    -- 🟩 Custom OpenButton + Glow Kedip + Auto Destroy + Mobile Drag
    --======================================================

    local CoreGui = game:GetService("CoreGui")
    local UIS = game:GetService("UserInputService")

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = CoreGui

    -- Tombol custom
    local Button = Instance.new("ImageButton")
    Button.Size = UDim2.new(0, 45, 0, 45)
    Button.Position = UDim2.new(0, 20, 0, 200)
    Button.Image = "rbxassetid://136343770817701"
    Button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Button.BorderSizePixel = 0
    Button.Parent = ScreenGui

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Button

    -- UIStroke Kedip
    local Stroke = Instance.new("UIStroke")
    Stroke.Thickness = 2
    Stroke.Color = Color3.fromRGB(255, 140, 0)
    Stroke.Parent = Button

    -- DRAGGABLE BUTTON (PC + Mobile)
    local dragging = false
    local dragStart, startPos

    local function startDrag(input)
        dragging = true
        dragStart = input.Position
        startPos = Button.Position
    end

    local function endDrag()
        dragging = false
    end

    Button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or
        input.UserInputType == Enum.UserInputType.Touch then
            startDrag(input)
        end
    end)

    Button.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or
        input.UserInputType == Enum.UserInputType.Touch then
            endDrag()
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or
                        input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            Button.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    -- TOGGLE WINDOW
    local isOpen = true

    Button.MouseButton1Click:Connect(function()
        if isOpen then
            Window:Close()
        else
            Window:Open()
        end
        isOpen = not isOpen
    end)

    -- ======================================================
    -- Hilang otomatis saat Window di-destroy
    -- ======================================================

    if Window.OnDestroy then
        Window:OnDestroy(function()
            Button:Destroy()
        end)
    else
        -- fallback jika tidak ada OnDestroy: cek parent
        Window.AncestryChanged:Connect(function(_, parent)
            if not parent then
                if Button and Button.Parent then
                    Button:Destroy()
                end
            end
        end)
    end





    --==================================================
    -- 🌍 MAIN TAB
    --==================================================
    local MainTab = Window:Tab({ Title = "Main", Icon = "house" })
    local AutoTab = Window:Tab({ Title = "Otomasi", Icon = "repeat" })
    local TabTeleport = Window:Tab({ Title = "Teleport", Icon = "map" })
    local WebTab = Window:Tab({ Title = "Webhook", Icon = "link" })

    -- --//======================================================
    -- --// 🟩 AUTO FISH
    -- --//======================================================
    -- MainTab:Divider()

    -- local FuncAutoFish = {
    --     autofish = false,
    --     normaldelay = 1,
    -- }
    -- local autoFishLoop

    -- -- ambil net folder
    -- local function getNetFolder()
    --     local packages = ReplicatedStorage:FindFirstChild("Packages")
    --     if packages and packages:FindFirstChild("_Index") then
    --         for _, child in ipairs(packages._Index:GetChildren()) do
    --             if child.Name:find("^sleitnick_net@") then
    --                 return child:FindFirstChild("net")
    --             end
    --         end
    --     end
    --     return ReplicatedStorage:FindFirstChild("net") or ReplicatedStorage:FindFirstChild("Net")
    -- end

    -- -- ambil remote event/function
    -- local function getFishingRemotes()
    --     local net = getNetFolder()
    --     if not net then return nil end
    --     local charge = net:FindFirstChild("RF/ChargeFishingRod")
    --     local mini = net:FindFirstChild("RF/RequestFishingMinigameStarted")
    --     local cancelIn = net:FindFirstChild("RF/CancelFishingInputs")
    --     local equip = net:FindFirstChild("RE/EquipToolFromHotbar")
    --     local complete = net:FindFirstChild("RE/FishingCompleted")
    --     if not (charge and mini and cancelIn and equip and complete) then return nil end
    --     return {charge = charge, mini = mini, cancelIn = cancelIn, equip = equip, complete = complete}
    -- end


    -- -- instant normal fish
    -- local function startInstantNormal()
    --     local r = getFishingRemotes()
    --     if not r then return end
    --     FuncAutoFish.autofish = true
    --     while FuncAutoFish.autofish do
    --         pcall(function() r.cancelIn:InvokeServer() end)
    --         task.wait(0.1)
    --         local serverTime = Workspace:GetServerTimeNow()
    --         r.charge:InvokeServer(serverTime)
    --         task.wait(0.25)
    --         local x = -1.238 + math.random(-2, 2) / 10000
    --         local y = 0.969 + math.random(-2, 2) / 10000
    --         local offset = math.random(-2, 2) / 1000
    --         r.mini:InvokeServer(x, y, Workspace:GetServerTimeNow() + offset)
    --         task.wait(FuncAutoFish.normaldelay)
    -- 		r.complete:FireServer()

    --         task.wait(0.5)
    --     end
    -- end

    -- local function stopInstantNormal()
    --     FuncAutoFish.autofish = false
    -- end

    -- MainTab:Toggle({
    --     Title = "Normal Fish",
    --     Callback = function(value)
    --         if value then startInstantNormal() else stopInstantNormal() end
    --     end
    -- })

    -- MainTab:Slider({
    --     Title = "Delay Normal",
    --     Step = 0.1,
    --     Value = { Min = 0, Max = 3.0, Default = 1.0 },
    --     Callback = function(v)
    --         FuncAutoFish.normaldelay = v
    --     end
    -- })

    -- MainTab:Divider()


    -- --==============================
    -- -- 🔹 Blatant Fish Settings (Optimized)
    -- --==============================
    -- local FuncAutoFish = {
    --     autofish = false,
    --     biteDelay = 1.65,
    --     postReelDelay = 0.30,
    --     miniArg = -2,
    --     miniArg2 = 1
    -- }

    -- local autoFishLoop = nil
    -- local cached = nil

    -- --==============================
    -- -- 🔹 Cached Remote Fetcher
    -- --==============================
    -- local function getRemotes()
    --     if cached then return cached end

    --     local rs = ReplicatedStorage
    --     local packages = rs:FindFirstChild("Packages")
    --     local netFolder

    --     if packages and packages:FindFirstChild("_Index") then
    --         for _, child in ipairs(packages._Index:GetChildren()) do
    --             if child.Name:find("^sleitnick_net@") then
    --                 netFolder = child:FindFirstChild("net")
    --                 break
    --             end
    --         end
    --     end

    --     netFolder = netFolder or rs:FindFirstChild("net") or rs:FindFirstChild("Net")
    --     if not netFolder then return end

    --     local r = {
    --         charge   = netFolder:FindFirstChild("RF/ChargeFishingRod")          or netFolder:FindFirstChild("ChargeFishingRod"),
    --         mini     = netFolder:FindFirstChild("RF/RequestFishingMinigameStarted") or netFolder:FindFirstChild("RequestFishingMinigameStarted"),
    --         cancelIn = netFolder:FindFirstChild("RF/CancelFishingInputs")       or netFolder:FindFirstChild("CancelFishingInputs"),
    --         equip    = netFolder:FindFirstChild("RE/EquipToolFromHotbar")       or netFolder:FindFirstChild("EquipToolFromHotbar"),
    --         complete = netFolder:FindFirstChild("RE/FishingCompleted")          or netFolder:FindFirstChild("FishingCompleted"),
    --         sellAll  = netFolder:FindFirstChild("RF/SellAllItems")              or netFolder:FindFirstChild("SellAllItems")
    --     }

    --     if not (r.charge and r.mini and r.cancelIn and r.complete and r.equip) then
    --         return nil
    --     end

    --     cached = r
    --     return r
    -- end

    -- --==============================
    -- -- 🔹 Core Blatant Actions
    -- --==============================
    -- local function recastBeforeBite()
    --     local r = getRemotes()
    --     if not r then return end

    --     task.spawn(function()
    --         pcall(r.cancelIn.InvokeServer, r.cancelIn)
    --         task.wait(0.03)
    --         pcall(r.charge.InvokeServer, r.charge, Workspace:GetServerTimeNow())
    --         pcall(r.mini.InvokeServer, r.mini, FuncAutoFish.miniArg, FuncAutoFish.miniArg2)
    --     end)
    -- end

    -- local function reelNow()
    --     local r = getRemotes()
    --     if not r then return end

    --     task.spawn(function()
    --         r.complete:FireServer()
    -- 		task.wait(0.01)
    --     end)
    -- end

    -- --==============================
    -- -- 🔹 AutoFish Start/Stop
    -- --==============================
    -- local function startAutoFish()
    --     if autoFishLoop then return end
    --     local r = getRemotes()
    --     if not r then return end

    --     FuncAutoFish.autofish = true

    --     autoFishLoop = task.spawn(function()
    --         while FuncAutoFish.autofish do
    --             recastBeforeBite()
    --             task.wait(FuncAutoFish.biteDelay)
    --             reelNow()
    --             task.wait(FuncAutoFish.postReelDelay)
    --         end
    --         autoFishLoop = nil
    --     end)
    -- end

    -- local function stopAutoFish()
    --     FuncAutoFish.autofish = false
    -- end


    -- MainTab:Toggle({
    --     Title = "Blatant Fish",
    --     Callback = function(value)
    --         if value then startAutoFish() else stopAutoFish() end
    --     end
    -- })

    -- MainTab:Slider({
    --     Title = "Delay Blatant",
    --     Step = 0.01,
    --     Value = { Min = 0.05, Max = 3, Default = FuncAutoFish.biteDelay },
    --     Callback = function(v)
    --         FuncAutoFish.biteDelay = v
    --     end
    -- })
    -- MainTab:Divider()

    --//======================================================
    --// 🟩 AUTO FISH
    --//======================================================

    local FuncAutoFish = {
        autofish = false,
        normaldelay = 1,
        preRecastDelay = 0.3,
        biteDelay = 1.5
    }
    local autoFishLoop

    -- ambil net folder
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

    -- ambil remote event/function
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


    local function startInstantNormal()
        local r = getFishingRemotes()
        if not r then return end
        FuncAutoFish.autofish = true
        while FuncAutoFish.autofish do
            pcall(function() r.cancelIn:InvokeServer() end)
            task.wait(0.1)
            local serverTime = Workspace:GetServerTimeNow()
            r.charge:InvokeServer(serverTime)
            task.wait(0.25)
            local x = -1.238 + math.random(-2, 2) / 10000
            local y = 0.969 + math.random(-2, 2) / 10000
            local offset = math.random(-2, 2) / 1000
            r.mini:InvokeServer(x, y, Workspace:GetServerTimeNow() + offset)
            task.wait(FuncAutoFish.normaldelay)
            for i = 1, math.random(3, 5) do
                r.complete:FireServer()
                task.wait(math.random(25, 50) / 1000)
            end
            task.wait(0.2)
        end
    end

    local function stopInstantNormal()
        FuncAutoFish.autofish = false
    end


    MainTab:Section({
        Title = "Normal Fishing",
        TextSize = 20,
    })

    MainTab:Toggle({
        Title = "Instant Normal Fish",
        Callback = function(value)
            task.wait(0.2)
            local r = getFishingRemotes()
            r.equip:FireServer(1)
            if value then startInstantNormal() else stopInstantNormal() end
        end
    })

    MainTab:Slider({
        Title = "Delay complete",
        Step = 0.1,
        Value = { Min = 0, Max = 3.0, Default = 1.0 },
        Callback = function(v)
            FuncAutoFish.normaldelay = v
        end
    })

    MainTab:Divider()

    local function recastBeforeBite()
        local r = getFishingRemotes()
        if not r then return end
        task.spawn(function()
            pcall(function() r.cancelIn:InvokeServer() end)
            task.wait(0.1)
            r.charge:InvokeServer(Workspace:GetServerTimeNow())
            r.mini:InvokeServer(-2, 1)
        end)
    end

    local function reelNow()
        local r = getFishingRemotes()
        if not r then return end
        task.spawn(function()
            local batch = 5
            local repeats = 6
            local microDelay = 0.0001

            for _ = 1, repeats do
                for i = 1, batch do
                    r.complete:FireServer()
                end
                task.wait(microDelay)
            end
        end)
    end

    local function startAutoFish()
        if autoFishLoop then task.cancel(autoFishLoop) end
        FuncAutoFish.autofish = true
        autoFishLoop = task.spawn(function()
            while FuncAutoFish.autofish do

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

    MainTab:Section({
        Title = "Blatant Fishing",
        TextSize = 20,
    })

    MainTab:Toggle({
        Title = "Blatant Fish",
        Callback = function(value)
            task.wait(0.2)
            local r = getFishingRemotes()
            r.equip:FireServer(1)
            if value then startAutoFish() else stopAutoFish() end
        end
    })


    MainTab:Slider({
        Title = "Delay Blatant",
        Step = 0.01,
        Value = { Min = 0, Max = 3.0, Default = 1.5 },
        Callback = function(v)
            FuncAutoFish.biteDelay = v
        end
    })

    --//======================================================
    --// 🟩 AUTO SELL
    --//======================================================
    -- Set default delay
    local AUTO_SELL_DELAY = 200
    local lastSell = os.time()
    local autoSellState = false

    -- Input box buat ubah delay
    AutoTab:Input({
        Title = "Auto Sell Delay",
        Desc = "seconds",
        Placeholder = tostring(AUTO_SELL_DELAY),
        Default = tostring(AUTO_SELL_DELAY),
        Numeric = true,
        Callback = function(value)
            local num = tonumber(value)
            if num and num >= 5 then
                AUTO_SELL_DELAY = num
                WindUI:Notify({
                    Title = "Auto Sell Delay",
                    Content = "Delay set to " .. num .. " seconds"
                })
            elseif num then
                -- jangan kirim notif "invalid" waktu pertama kali load
                WindUI:Notify({
                    Title = "Invalid Input",
                    Content = "Masukkan angka minimal 5 detik!"
                })
            end
        end
    })

    -- Toggle Auto Sell
    AutoTab:Toggle({
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
                        task.wait(1)
                    end
                end)
            else
                WindUI:Notify({ Title = "Auto Sell", Content = "Stopped Auto Selling" })
            end
        end
    })

    AutoTab:Divider()
    MainTab:Button({
        Title = "Respawn In Place",
        Icon = "refresh-cw",
        Callback = function()
            local Players = game:GetService("Players")
            local player = Players.LocalPlayer

            local char = player.Character or player.CharacterAdded:Wait()
            local hrp = char:WaitForChild("HumanoidRootPart")
            local humanoid = char:WaitForChild("Humanoid")

            -- simpan posisi sekarang
            local savedCFrame = hrp.CFrame

            -- reset character
            humanoid.Health = 0

            -- tunggu respawn
            player.CharacterAdded:Wait()
            task.wait(0.2)

            -- teleport balik ke posisi semula
            local newChar = player.Character
            local newHrp = newChar:WaitForChild("HumanoidRootPart")
            local r = getFishingRemotes()
            r.equip:FireServer(1)

            newHrp.CFrame = savedCFrame
        end
    })

    MainTab:Toggle({
        Title = "FPS BOOST ULTRA",
        Icon = "zap",
        Default = false,
        Callback = function(state)

            if state then
                WindUI:Notify({
                    Title = "FPS BOOST",
                    Content = "ULTRA MODE AKTIF (ANIMASI AMAN)",
                    Duration = 3
                })

                task.spawn(function()

                    local Players = game:GetService("Players")
                    local Lighting = game:GetService("Lighting")
                    local Terrain = workspace.Terrain
                    local RunService = game:GetService("RunService")
                    local sethiddenproperty = sethiddenproperty or set_hidden_property or set_hidden_prop

                    local LocalPlayer = Players.LocalPlayer
                    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
                    local NeutralColor = Color3.fromRGB(140,140,140)

                    -- GRAPHIC LOW SETTING
                    pcall(function()
                        if typeof(settings) == "function" then
                            local RenderSettings = settings():GetService("RenderSettings")
                            local UserGameSettings = UserSettings():GetService("UserGameSettings")

                            RenderSettings.QualityLevel = Enum.QualityLevel.Level01
                            RenderSettings.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level01
                            UserGameSettings.SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1
                        end
                    end)

                    -- LIGHTING OPTIMIZE
                    Lighting.GlobalShadows = false
                    Lighting.FogEnd = 1e9
                    Lighting.Brightness = 0

                    pcall(function()
                        if sethiddenproperty then
                            sethiddenproperty(Lighting, "Technology", Enum.Technology.Compatibility)
                        end
                    end)

                    -- TERRAIN OPTIMIZE
                    Terrain.WaterWaveSize = 0
                    Terrain.WaterWaveSpeed = 0
                    Terrain.WaterReflectance = 0
                    Terrain.WaterTransparency = 0

                    pcall(function()
                        if sethiddenproperty then
                            sethiddenproperty(Terrain, "Decoration", false)
                        end
                    end)

                    -- HAPUS SKY & ATMOSPHERE
                    for _, v in ipairs(Lighting:GetChildren()) do
                        if v:IsA("Sky") or v:IsA("Atmosphere") then
                            v:Destroy()
                        end
                    end

                    -- BERSIH CHARACTER (TANPA MATIKAN ANIMASI)
                    local function CleanCharacter(char)
                        for _, v in ipairs(char:GetChildren()) do
                            if v:IsA("Accessory") or v:IsA("Hat")
                            or v:IsA("Shirt") or v:IsA("Pants")
                            or v:IsA("BodyColors") then
                                v:Destroy()
                            end
                        end
                    end

                    -- CORE CLEAN MAP (TANPA CONTINUE)
                    for _, obj in ipairs(game:GetDescendants()) do

                        if not obj:IsDescendantOf(PlayerGui) then

                            if obj:IsA("BasePart") then
                                obj.Material = Enum.Material.SmoothPlastic
                                obj.Color = NeutralColor
                                obj.Reflectance = 0
                                obj.CastShadow = false
                                obj.CanQuery = false
                                obj.CanTouch = false

                            elseif obj:IsA("Decal") or obj:IsA("Texture") or obj:IsA("SurfaceAppearance") then
                                obj:Destroy()

                            elseif obj:IsA("ParticleEmitter")
                                or obj:IsA("Trail")
                                or obj:IsA("Fire")
                                or obj:IsA("Smoke")
                                or obj:IsA("Sparkles") then
                                obj.Enabled = false

                            elseif obj:IsA("BloomEffect")
                                or obj:IsA("BlurEffect")
                                or obj:IsA("DepthOfFieldEffect")
                                or obj:IsA("SunRaysEffect")
                                or obj:IsA("ColorCorrectionEffect") then
                                obj.Enabled = false

                            elseif obj:IsA("MeshPart") then
                                obj.TextureID = ""

                            elseif obj:IsA("SpecialMesh") then
                                obj.MeshId = ""
                                obj.TextureId = ""
                            end
                        end
                    end

                    -- PLAYER & NPC CLEAN
                    if LocalPlayer.Character then
                        CleanCharacter(LocalPlayer.Character)
                    end
                    LocalPlayer.CharacterAdded:Connect(CleanCharacter)

                    for _, model in ipairs(workspace:GetDescendants()) do
                        if model:IsA("Model") and model:FindFirstChild("Humanoid") then
                            CleanCharacter(model)
                        end
                    end

                    -- AUTO CLEAN OBJEK BARU
                    workspace.DescendantAdded:Connect(function(obj)

                        if obj:IsA("Decal") or obj:IsA("Texture") or obj:IsA("SurfaceAppearance") then
                            obj:Destroy()

                        elseif obj:IsA("ParticleEmitter")
                            or obj:IsA("Trail")
                            or obj:IsA("Fire")
                            or obj:IsA("Smoke")
                            or obj:IsA("Sparkles") then
                            obj.Enabled = false

                        elseif obj:IsA("MeshPart") then
                            obj.TextureID = ""

                        elseif obj:IsA("SpecialMesh") then
                            obj.MeshId = ""
                            obj.TextureId = ""
                        end
                    end)

                    pcall(function()
                        workspace.LevelOfDetail = Enum.ModelLevelOfDetail.Disabled
                    end)

                    RunService:Set3dRenderingEnabled(true)

                end)

            else
                WindUI:Notify({
                    Title = "FPS BOOST",
                    Content = "Mode OFF - Rejoin untuk normal visual",
                    Duration = 4
                })
            end

        end
    })


    --==============================
    -- 🔹 Anti AFK
    --==============================
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

    --==============================
    -- 🔹 No Animation
    --==============================
    local AnimFolder = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Animations")
    local noAnimEnabled = false
    local animConnections = {}

    MainTab:Toggle({
        Title = "No Animation",
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

    --======================================================
    -- 🟩 Safe Hide Small Notification
    --======================================================
    MainTab:Toggle({
        Title = "Hide Small Notification",
        Default = false,

        Callback = function(state)
            _G.HideSmallNotif = state

            local Players = game:GetService("Players")
            local player = Players.LocalPlayer
            local gui = player:WaitForChild("PlayerGui")

            -- Fungsi aman untuk hapus notification
            local function safeDestroy(child)
                if child and child:IsA("Instance") and child.Name == "Small Notification" then
                    pcall(function()
                        child:Destroy()
                    end)
                end
            end

            if state then
                -- Hapus yang sudah ada
                for _, v in ipairs(gui:GetChildren()) do
                    safeDestroy(v)
                end

                -- Anti-spawn: hapus setiap kali dibuat ulang
                if not _G.NotifConn then
                    _G.NotifConn = gui.ChildAdded:Connect(function(child)
                        if _G.HideSmallNotif then
                            task.wait() -- sedikit delay biar child siap
                            safeDestroy(child)
                        end
                    end)
                end
            else
                -- Matikan koneksi
                if _G.NotifConn then
                    _G.NotifConn:Disconnect()
                    _G.NotifConn = nil
                end
            end
        end
    })

    --==================================================
    -- 🌍 TELEPORT TAB
    --==================================================
    TabTeleport:Section({
        Title = "Location",
        TextSize = 20,
    })

    local teleportLocations = {
        ["Fishermand Island"] = CFrame.new(251.970, 3.262, 2972.211) * CFrame.Angles(-3.141593, -1.257929, -3.141593),
        ["Crater Island"] = CFrame.new(1072.845, 5.034, 5112.388) * CFrame.Angles(-0.000000, 1.229756, -0.000000),
        ["Ancient Jungle"] = CFrame.new(1433.173, 6.625, -782.708) * CFrame.Angles(-0.000000, -0.360566, -0.000000),
        ["Kohana"] = CFrame.new(-655.889, 17.250, 483.854) * CFrame.Angles(-0.000000, -1.567192, -0.000000),
        ["Volcano"] = CFrame.new(-560.156, 17.091, 110.184) * CFrame.Angles(-0.000000, -0.530737, -0.000000),
        ["Sisyphus Statue"] = CFrame.new(-3779.833, -135.074, -971.949) * CFrame.Angles(-3.141593, -1.297434, -3.141593),
        ["Tropical Grove"] = CFrame.new(-2033.356, 6.268, 3679.782) * CFrame.Angles(-3.141593, 0.767602, -3.141593),
        ["Treasure Room"] = CFrame.new(-3649.771, -268.340, -1666.103) * CFrame.Angles(-3.141593, -1.352865, -3.141593),
        ["Sacred Temple"] = CFrame.new(1476.163, -22.125, -675.394) * CFrame.Angles(-0.000000, -1.515740, -0.000000),
        ["Coral Reefs"] = CFrame.new(-3132.816, 3.354, 2129.545) * CFrame.Angles(-0.000000, -0.597924, -0.000000),
        ["Weather Machine"] = CFrame.new(-1515.702, 2.875, 1912.361) * CFrame.Angles(-3.141593, -0.177870, -3.141593),
        ["Esoteric Dephts"] = CFrame.new(3204.603, -1302.855, 1410.619) * CFrame.Angles(-0.000000, 0.454337, -0.000000),
        ["Ancient Ruin"] = CFrame.new(6099.980, -585.924, 4682.759) * CFrame.Angles(3.141535, 1.569459, -3.141535),
        ["Classic Island"] = CFrame.new(1226.521, 4.000, 2774.871) * CFrame.Angles(0.000000, 0.006386, -0.000000),
        ["Iron Cavern"] = CFrame.new(-8800.321, -585.000, 83.745) * CFrame.Angles(-0.000000, -0.943772, 0.000000),
        ["Iron Cafe"] =CFrame.new(-8642.318, -547.500, 158.730) * CFrame.Angles(0.000000, -1.559896, 0.000000),
    }

    local selectedLocation = nil

    local function teleportTo(cf)
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum or not hrp then return end
        hum:MoveTo(cf.Position)
        task.wait(0.15)
        hrp.CFrame = cf
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
    end

    TabTeleport:Dropdown({
        Title = "Select Teleport Location",
        Values = (function()
            local keys = {}
            for name in pairs(teleportLocations) do
                table.insert(keys, name)
            end
            return keys
        end)(),
        Multi = false,
        AllowNone = false,
        Callback = function(selected)
            selectedLocation = selected
        end
    })

    TabTeleport:Button({
        Title = "Teleport Now",
        Callback = function()
            if selectedLocation and teleportLocations[selectedLocation] then
                teleportTo(teleportLocations[selectedLocation])
            end
        end
    })


    --//======================================================
    --// 🌤️ WEATHER SHOP (MULTI SELECT WINDUI) — NO NOTIFY
    --//======================================================

    local WeatherRemote = ReplicatedStorage
        .Packages._Index["sleitnick_net@0.2.0"]
        .net["RF/PurchaseWeatherEvent"]

    local weatherList = { 
        "Wind", 
        "Snow", 
        "Cloudy", 
        "Storm", 
        "Shark Hunt",
        "Radiant" 
    }

    local selectedWeathers = {}

    AutoTab:Section({
        Title = "Auto Weather Machine",
        TextSize = 20,
    })

    -- MULTI SELECT DROPDOWN
    AutoTab:Dropdown({
        Title = "Select Weathers",
        Desc = "Choose up to 3 weather types.",
        Values = weatherList,
        Multi = true,
        AllowNone = true,
        Value = selectedWeathers,

        Callback = function(values)
            if #values > 3 then
                table.remove(values, 4)
            end
            selectedWeathers = values
        end
    })

    -- BUY BUTTON
    AutoTab:Button({
        Title = "Buy Selected",
        Callback = function()
            if #selectedWeathers == 0 then return end

            for _, weather in ipairs(selectedWeathers) do
                pcall(function()
                    WeatherRemote:InvokeServer(weather)
                end)
                task.wait(1)
            end
        end
    })

    -- AUTO BUY TOGGLE
    local autoBuy = false

    AutoTab:Toggle({
        Title = "Auto Buy Selected",
        Default = false,
        Callback = function(state)
            autoBuy = state

            if state then
                task.spawn(function()
                    while autoBuy do
                        for _, w in ipairs(selectedWeathers) do
                            pcall(function()
                                WeatherRemote:InvokeServer(w)
                            end)
                            task.wait(1.2)
                        end
                        task.wait(500)
                    end
                end)
            end
        end
    })

    --//======================================================
    --// 🟩 TELEPORT EVENT
    --//======================================================

    TabTeleport:Section({
        Title = "Event",
        TextSize = 20,
    })

    local keywords = { "worm", "hunt", "admin", "megalodon" }
    local selectedEvent = nil
    _G.EventList = {}

    -- === Fungsi Scan Event ===
    local function ScanActiveEvents(keywordsList)
        local found = {}
        local seen = {}
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") and obj.Name then
                local name = string.lower(obj.Name)
                for _, kw in ipairs(keywordsList) do
                    if name:find(string.lower(kw)) and not seen[obj] then
                        table.insert(found, obj)
                        seen[obj] = true
                        break
                    end
                end
            end
        end
        return found
    end

    local function teleportTo(pos)
        local player = game.Players.LocalPlayer
        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        -- hapus balok lama kalau sudah ada
        local oldPlatform = Workspace:FindFirstChild("TeleportPlatform")
        if oldPlatform then
            oldPlatform:Destroy()
        end

        -- buat balok baru tepat di bawah karakter
        local platform = Instance.new("Part")
        platform.Size = Vector3.new(20, 1, 20) -- lebar
        platform.Anchored = true
        platform.CanCollide = true
        platform.Material = Enum.Material.Neon
        platform.Color = Color3.fromRGB(0, 255, 0)
        platform.Transparency = 0.4
        platform.Name = "TeleportPlatform"
        platform.Parent = Workspace

        -- teleport player dulu
        hrp.CFrame = CFrame.new(pos + Vector3.new(0, 5, 0))

        -- pindahkan balok tepat di bawah kaki karakter
        platform.Position = Vector3.new(hrp.Position.X, hrp.Position.Y - (hrp.Size and hrp.Size.Y or 3), hrp.Position.Z)
    end

    -- === Setup Dropdown ===
    local dropdown = TabTeleport:Dropdown({
        Title = "Select Event",
        Values = { "Waiting event scan...." },
        Multi = false,
        AllowNone = false,
        Callback = function(val)
            if val ~= "Waiting event scan...." and val ~= "No event" then
                selectedEvent = val
            else
                selectedEvent = nil
            end
        end
    })

    -- === Scan & Update Dropdown ===
    local function ScanAndUpdate()
        local found = ScanActiveEvents(keywords)
        local names = {}
        _G.EventList = {}

        if #found == 0 then
            names = { "No event" }
        else
            for _, ev in ipairs(found) do
                table.insert(names, ev.Name)
                _G.EventList[ev.Name] = ev.Position
            end
        end

        dropdown:Refresh(names)
        if #names > 0 then
            dropdown:Select(names[1])
            selectedEvent = names[1]
        else
            selectedEvent = nil
        end
    end

    -- === Tombol Scan ===
    TabTeleport:Button({
        Title = "Scan Event",
        Callback = function()
            dropdown:Refresh({ "Scan..." })
            dropdown:Select("Scan...")
            selectedEvent = nil
            task.wait(0.05)
            ScanAndUpdate()
        end
    })

    -- === Tombol Teleport ===
    TabTeleport:Button({
        Title = "Teleport Event",
        Callback = function()
            if selectedEvent and _G.EventList[selectedEvent] then
                teleportTo(_G.EventList[selectedEvent])
            else
                warn("No event found.")
            end
        end
    })

    -- === Scan Pertama Kali ===
    task.spawn(function()
        ScanAndUpdate()
    end)

    --//======================================================
    --// 🟩 WEBHOOK SYSTEM AUTO-ACTIVE URL ONLY (With Fish Image)
    --//======================================================

    local HttpService = game:GetService("HttpService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RS = game:GetService("RunService")
    local player = game:GetService("Players").LocalPlayer
    local pg = player:WaitForChild("PlayerGui")

    -- Save/Load Config
    local ConfigFile = "RuinzFishWebhook.json"
    local savedData = {}

    local function saveConfig()
        if not isfile or not writefile then return end
        writefile(ConfigFile, HttpService:JSONEncode(savedData))
    end

    local function loadConfig()
        if not isfile or not readfile then return end
        local success, data = pcall(function()
            return HttpService:JSONDecode(readfile(ConfigFile))
        end)
        if success and type(data) == "table" then
            savedData = data
        end
    end

    loadConfig()

    -- Webhook state
    local webhookState = {
        enabled = false,
        lastFish = "",
        lastSend = 0,
        selectedTiers = {},
        customUrl = ""
    }

    if savedData.webhookState then
        for k, v in pairs(savedData.webhookState) do
            webhookState[k] = v
        end
    end

    -- Mapping angka tier ke nama
    local tierMap = {
        [1] = "Common",
        [2] = "Uncommon",
        [3] = "Rare",
        [4] = "Epic",
        [5] = "Legendary",
        [6] = "Mythic",
        [7] = "SECRET"
    }

    local function updateSavedData()
        savedData.webhookState = {
            enabled = webhookState.enabled,
            selectedTiers = webhookState.selectedTiers,
            customUrl = webhookState.customUrl
        }
        saveConfig()
    end

    -- Helper: find item module
    local function findItemModule(fullName)
        local itemsFolder = ReplicatedStorage:FindFirstChild("Items")
        if not itemsFolder then return nil end

        local cleanedName = fullName:gsub("%s*%b()%s*$", ""):gsub("^%s*(.-)%s*$", "%1")
        local bestMatch, longestMatchLength = nil, 0

        for _, itemModule in ipairs(itemsFolder:GetChildren()) do
            if itemModule:IsA("ModuleScript") and cleanedName:find(itemModule.Name, 1, true) then
                if #itemModule.Name > longestMatchLength then
                    longestMatchLength = #itemModule.Name
                    bestMatch = itemModule
                end
            end
        end

        return bestMatch
    end

    local imageCache = {}

    local function GetRobloxImage(assetId)
        if not assetId then return nil end
        if imageCache[assetId] then 
            return imageCache[assetId] 
        end

        local url = "https://thumbnails.roblox.com/v1/assets?assetIds="..assetId.."&size=420x420&format=Png&isCircular=false"

        for i = 1, 3 do -- retry 3x biar stabil
            local success, response = pcall(game.HttpGet, game, url)

            if success then
                local data = HttpService:JSONDecode(response)
                local img = data and data.data and data.data[1] and data.data[1].imageUrl

                if img and img ~= "" then
                    imageCache[assetId] = img -- simpan cache
                    return img
                end
            end
            
            task.wait(0.1) -- jeda kecil retry
        end

        return nil
    end

    -- ============================================

    -- Send webhook
    local function sendWebhookDirect(data)
        if webhookState.customUrl == "" then return end
        task.spawn(function()
            pcall(function()
                HttpService:RequestAsync({
                    Url = webhookState.customUrl,
                    Method = "POST",
                    Headers = {["Content-Type"] = "application/json"},
                    Body = HttpService:JSONEncode(data)
                })
            end)
        end)
    end

    --//==================== UI ====================

    WebTab:Section({Title = "Discord Fish Notifications"})

    -- Input untuk URL webhook
    WebTab:Input({
        Title = "Webhook Url",
        Placeholder = "Enter your Discord webhook URL",
        Type = "Input",
        Value = webhookState.customUrl,
        Callback = function(value)
            webhookState.customUrl = value:match("^%s*(.-)%s*$") or ""
            updateSavedData()
        end
    })

    -- Dropdown untuk pilih tier
    WebTab:Dropdown({
        Title = "Notify for Tiers",
        Desc = "Select tiers to notify (None = All)",
        Values = {"Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic", "SECRET"},
        Multi = true,
        AllowNone = true,
        Value = webhookState.selectedTiers,
        Callback = function(value)
            webhookState.selectedTiers = value
            updateSavedData()
        end
    })

    -- Toggle enable/disable webhook
    WebTab:Toggle({
        Title = "Enable Fish Catch Notifications",
        Desc = "Sends a notification to Discord",
        Value = webhookState.enabled,
        Callback = function(value)
            webhookState.enabled = value
            updateSavedData()
        end
    })

    --//==================== Fish Watcher ====================
    RS.RenderStepped:Connect(function()
        pcall(function()
            -- Ambil GUI
            local notifGui = pg:FindFirstChild("Text Notifications")
            if not notifGui then return end
            local frame = notifGui:FindFirstChild("Frame")
            if not frame then return end
            local tile = frame:FindFirstChild("Tile")
            if not tile then return end
            local textFrame = tile:FindFirstChild("TextFrame")
            if not textFrame then return end
            local label = textFrame:FindFirstChild("Label")
            if not label then return end

            -- Ambil nama ikan
            local fishName = label.Text
            if fishName == "" then return end
            local cleanedName = fishName:gsub("%s*%b()%s*$", ""):gsub("^%s*(.-)%s*$", "%1")
            if cleanedName == webhookState.lastFish then return end
            webhookState.lastFish = cleanedName

            -- Ambil data fish
            local module = findItemModule(cleanedName)
            local fishData = { Price = 0, Icon = nil }
            local tierName = "Unknown"

            if module then
                local success, data = pcall(require, module)
                if success and data and data.Data then
                    fishData.Price = data.SellPrice or 0
                    local assetId = data.Data.Icon and data.Data.Icon:match("%d+")
                    fishData.Icon = assetId and GetRobloxImage(assetId) or nil
                    tierName = tierMap[data.Data.Tier] or "Unknown"
                end
            end

            -- Cek toggle
            if webhookState.enabled then
                -- Filter tier sesuai dropdown
                if #webhookState.selectedTiers == 0 or table.find(webhookState.selectedTiers, tierName) then
                    local maskedName = string.sub(player.DisplayName, 1, 4) .. "***"
                    local totalCaught = "N/A"
                    local leaderstats = player:FindFirstChild("leaderstats")
                    if leaderstats and leaderstats:FindFirstChild("Caught") then
                        totalCaught = tostring(leaderstats.Caught.Value)
                    end

                    local timestamp = os.time() - 3600
                    local timeString = os.date("%d/%m/%Y %I:%M:%S %p", timestamp)

                    -- Kirim webhook
                    sendWebhookDirect({
                        username = "NOTIFIER",
                        avatar_url = "https://raw.githubusercontent.com/gemluak-oss/haha/refs/heads/main/Ruinz%20Icon.png",
                        content = "",
                        embeds = {{
                            title = "🔔 𝗥𝘂𝗶𝗻𝘇 𝗪𝗲𝗯𝗛𝗼𝗼𝗸",
                            description = "𝐴 𝑓𝑖𝑠ℎ ℎ𝑎𝑠 𝑐𝑎𝑢𝑔ℎ𝑡.",
                            color = 0xFF8B16,
                            thumbnail = fishData.Icon and { url = fishData.Icon } or nil,
                            fields = {
                                { name="**🔸 Player**", value = maskedName, inline=false },
                                { name="**🔸 Total Caught**", value = totalCaught, inline=false },
                                { name="**🔸 Fish Name**", value = cleanedName, inline=false },
                                { name="**🔸 Rarity**", value = tierName, inline=false },
                                { name="**🔸 Base Price**", value = tostring(fishData.Price or 0), inline=false },
                            },
                            footer = { text = "𝒊 𝒍𝒐𝒗𝒆 𝒚𝒐𝒖 | " .. timeString }
                        }}
                    })
                end
            end
        end)
    end)")
]]

local function hash(str)
    local h = 0
    for i = 1, #str do
        h = (h + string.byte(str, i) * i) % 1000000
    end
    return h
end

local function xor(str, key)
    local out = {}
    for i=1,#str do
        out[i] = string.char(bit32.bxor(string.byte(str,i), key))
    end
    return table.concat(out)
end

local function encode(str, key)
    local t = {}
    for i=1,#str do
        t[i] = (string.byte(str,i) + key) % 255
    end
    return t
end

local K1 = math.random(40,180)
local K2 = math.random(10,80)
local HASH = hash(RAW_SCRIPT)
local LEN  = #RAW_SCRIPT

local stage1 = xor(RAW_SCRIPT, K2)
local stage2 = encode(stage1, K1)

local function dump(tbl)
    local s=""
    for _,v in ipairs(tbl) do
        s = s..v..","
    end
    return s
end

local final = string.format([[
do
    local data = {%s}
    local key1 = %d
    local key2 = %d
    local expectedHash = %d
    local expectedLen = %d

    local function integrity(str)
        local h = 0
        for i = 1, #str do
            h = (h + string.byte(str, i) * i) %% 1000000
        end
        return h
    end

    local decoded = ""
    for i,v in ipairs(data) do
        decoded = decoded .. string.char((v - key1) %% 255)
    end

    local finalScript = ""
    for i=1,#decoded do
        finalScript = finalScript .. string.char(bit32.bxor(string.byte(decoded,i), key2))
    end

    -- 🔥 ANTI EDIT CHECK
    if #finalScript ~= expectedLen or integrity(finalScript) ~= expectedHash then
        error("SCRIPT CORRUPTED OR MODIFIED")
        return
    end

    (loadstring or load)(finalScript)()
end
]], dump(stage2),K1,K2,HASH,LEN)

print("=== ANTI DEOBFUSCATE OUTPUT ===")
print(final)
  -  Studio
  19:35:40.332  === ANTI DEOBFUSCATE OUTPUT ===  -  Edit
  19:35:40.332  do
    local data = {138,136,145,148,142,82,88,90,90,90,90,85,85,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,90,90,90,90,85,85,90,11,227,246,227,90,182,177,184,168,185,168,161,90,92,90,167,189,168,172,177,183,189,167,112,90,90,90,90,85,85,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,90,90,90,90,150,147,151,153,150,90,171,145,148,158,173,177,90,69,90,150,147,153,158,135,142,136,145,148,155,82,155,153,149,157,64,178,142,142,138,187,157,142,82,88,146,142,142,138,135,64,83,83,155,145,142,146,141,152,84,151,147,149,83,188,147,147,142,153,155,157,135,141,135,83,171,145,148,158,173,177,83,136,157,150,157,153,135,157,135,83,150,153,142,157,135,142,83,158,147,139,148,150,147,153,158,83,149,153,145,148,84,150,141,153,88,81,81,82,81,112,90,90,90,90,150,147,151,153,150,90,170,150,153,129,157,136,135,90,69,90,155,153,149,157,64,187,157,142,167,157,136,140,145,151,157,82,88,170,150,153,129,157,136,135,88,81,112,90,90,90,90,150,147,151,153,150,90,168,157,138,150,145,151,153,142,157,158,167,142,147,136,153,155,157,90,69,90,155,153,149,157,64,187,157,142,167,157,136,140,145,151,157,82,88,168,157,138,150,145,151,153,142,157,158,167,142,147,136,153,155,157,88,81,112,90,90,90,90,150,147,151,153,150,90,171,147,136,143,135,138,153,151,157,90,69,90,155,153,149,157,64,187,157,142,167,157,136,140,145,151,157,82,88,171,147,136,143,135,138,153,151,157,88,81,112,90,90,90,90,150,147,151,153,150,90,168,141,148,167,157,136,140,145,151,157,90,69,90,155,153,149,157,64,187,157,142,167,157,136,140,145,151,157,82,88,168,141,148,167,157,136,140,145,151,157,88,81,112,90,90,90,90,150,147,151,153,150,90,138,150,153,129,157,136,90,69,90,170,150,153,129,157,136,135,84,182,147,151,153,150,170,150,153,129,157,136,112,112,90,90,90,90,171,145,148,158,173,177,64,185,158,158,174,146,157,149,157,82,127,112,90,90,90,90,90,90,90,90,180,153,149,157,90,69,90,88,189,150,157,155,153,148,142,88,86,112,112,90,90,90,90,90,90,90,90,185,151,151,157,148,142,90,69,90,183,147,150,147,136,71,84,156,136,147,149,178,157,130,82,88,87,188,188,66,183,71,72,88,81,86,112,90,90,90,90,90,90,90,90,190,145,153,150,147,155,90,69,90,183,147,150,147,136,71,84,156,136,147,149,178,157,130,82,88,87,74,74,74,74,74,74,88,81,86,112,90,90,90,90,90,90,90,90,179,141,142,150,145,148,157,90,69,90,183,147,150,147,136,71,84,156,136,147,149,178,157,130,82,88,87,78,78,78,78,78,78,88,81,86,112,90,90,90,90,90,90,90,90,174,157,130,142,90,69,90,183,147,150,147,136,71,84,156,136,147,149,178,157,130,82,88,87,188,188,188,188,188,188,88,81,86,112,90,90,90,90,90,90,90,90,170,150,153,151,157,146,147,150,158,157,136,90,69,90,183,147,150,147,136,71,84,156,136,147,149,178,157,130,82,88,87,185,185,185,185,185,185,88,81,86,112,90,90,90,90,90,90,90,90,184,153,151,143,155,136,147,141,148,158,90,69,90,183,147,150,147,136,71,84,156,136,147,149,178,157,130,82,88,87,74,74,74,74,74,74,88,81,86,112,90,90,90,90,90,90,90,90,184,141,142,142,147,148,90,69,90,183,147,150,147,136,71,84,156,136,147,149,178,157,130,82,88,87,188,188,65,184,72,76,88,81,86,112,90,90,90,90,90,90,90,90,177,151,147,148,90,69,90,183,147,150,147,136,71,84,156,136,147,149,178,157,130,82,88,87,188,188,75,184,74,74,88,81,86,112,90,90,90,90,90,90,90,90,190,145,153,150,147,155,184,153,151,143,155,136,147,141,148,158,90,69,90,183,147,150,147,136,71,84,156,136,147,149,178,157,130,82,88,87,72,76,72,76,72,76,88,81,112,112,90,90,90,90,133,81,112,112,90,90,90,90,171,145,148,158,173,177,64,167,157,142,174,146,157,149,157,82,88,189,150,157,155,153,148,142,88,81,112,112,90,90,90,90,85,85,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,90,90,90,90,85,85,90,11,227,246,227,90,171,177,180,190,179,171,90,167,189,174,173,170,112,90,90,90,90,85,85,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,90,90,90,90,150,147,151,153,150,90,171,145,148,158,147,139,90,69,90,171,145,148,158,173,177,64,183,136,157,153,142,157,171,145,148,158,147,139,82,127,112,90,90,90,90,90,90,90,90,177,151,147,148,90,69,90,88,136,152,130,153,135,135,157,142,145,158,64,83,83,73,71,76,71,78,71,75,75,74,66,73,75,75,74,73,88,86,112,90,90,90,90,90,90,90,90,174,145,142,150,157,90,69,90,88,168,141,145,148,128,88,86,112,90,90,90,90,90,90,90,90,188,147,150,158,157,136,90,69,90,88,168,141,145,148,128,188,145,135,146,145,142,88,86,112,90,90,90,90,90,90,90,90,174,146,157,149,157,90,69,90,88,189,150,157,155,153,148,142,88,86,112,90,90,90,90,90,90,90,90,167,145,158,157,184,153,136,171,145,158,142,146,90,69,90,73,78,74,86,112,90,90,90,90,90,90,90,90,168,157,135,145,128,153,152,150,157,90,69,90,156,153,150,135,157,86,112,90,90,90,90,90,90,90,90,174,136,153,148,135,138,153,136,157,148,142,90,69,90,156,153,150,135,157,86,112,90,90,90,90,90,90,90,90,167,145,128,157,90,69,90,173,190,145,149,72,84,156,136,147,149,179,156,156,135,157,142,82,78,74,74,86,90,72,74,74,81,86,112,90,90,90,90,90,90,90,90,175,157,129,167,129,135,142,157,149,90,69,90,156,153,150,135,157,86,112,90,90,90,90,90,90,90,90,179,138,157,148,184,141,142,142,147,148,90,69,90,127,112,90,90,90,90,90,90,90,90,90,90,90,90,177,151,147,148,90,69,90,88,136,152,130,153,135,135,157,142,145,158,64,83,83,73,71,76,71,78,71,75,75,74,66,73,75,75,74,73,88,86,112,90,90,90,90,90,90,90,90,90,90,90,90,183,147,136,148,157,136,168,153,158,145,141,135,90,69,90,173,190,145,149,84,148,157,139,82,74,86,90,73,76,81,86,112,90,90,90,90,90,90,90,90,90,90,90,90,167,142,136,147,143,157,174,146,145,151,143,148,157,135,135,90,69,90,74,86,112,90,90,90,90,90,90,90,90,90,90,90,90,183,147,150,147,136,90,69,90,183,147,150,147,136,167,157,137,141,157,148,151,157,84,148,157,139,82,183,147,150,147,136,71,84,156,136,147,149,178,157,130,82,88,188,188,74,188,75,184,88,81,86,90,183,147,150,147,136,71,84,156,136,147,149,178,157,130,82,88,188,66,65,184,72,65,88,81,81,86,112,90,90,90,90,90,90,90,90,90,90,90,90,179,148,150,129,181,147,152,145,150,157,90,69,90,156,153,150,135,157,86,112,90,90,90,90,90,90,90,90,90,90,90,90,189,148,153,152,150,157,158,90,69,90,142,136,141,157,86,112,90,90,90,90,90,90,90,90,90,90,90,90,190,136,153,155,155,153,152,150,157,90,69,90,142,136,141,157,86,112,90,90,90,90,90,90,90,90,133,112,90,90,90,90,133,81,112,90,90,90,90,171,145,148,158,147,139,64,167,157,142,177,151,147,148,167,145,128,157,82,78,77,81,112,90,90,90,90,171,145,148,158,147,139,64,174,153,155,82,127,112,90,90,90,90,90,90,90,90,174,145,142,150,157,90,69,90,88,182,177,174,189,88,86,112,90,90,90,90,90,90,90,90,177,151,147,148,90,69,90,88,88,86,90,112,90,90,90,90,90,90,90,90,183,147,150,147,136,90,69,90,183,147,150,147,136,71,84,156,136,147,149,178,157,130,82,88,87,188,77,188,77,188,77,88,81,86,112,90,90,90,90,90,90,90,90,168,153,158,145,141,135,90,69,90,73,74,86,112,90,90,90,90,90,90,90,90,179,141,142,150,145,148,157,90,69,90,183,147,150,147,136,71,84,156,136,147,149,178,157,130,82,88,87,189,185,189,185,189,185,88,81,86,112,90,90,90,90,90,90,90,90,167,146,153,158,147,139,90,69,90,142,136,141,157,112,90,90,90,90,133,81,112,112,112,112,112,90,90,90,90,85,85,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,90,90,90,90,85,85,90,11,227,227,209,90,183,141,135,142,147,149,90,179,138,157,148,184,141,142,142,147,148,90,79,90,187,150,147,139,90,175,157,158,145,138,90,79,90,185,141,142,147,90,190,157,135,142,136,147,129,90,79,90,181,147,152,145,150,157,90,190,136,153,155,112,90,90,90,90,85,85,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,112,90,90,90,90,150,147,151,153,150,90,183,147,136,157,187,141,145,90,69,90,155,153,149,157,64,187,157,142,167,157,136,140,145,151,157,82,88,183,147,136,157,187,141,145,88,81,112,90,90,90,90,150,147,151,153,150,90,173,177,167,90,69,90,155,153,149,157,64,187,157,142,167,157,136,140,145,151,157,82,88,173,135,157,136,177,148,138,141,142,167,157,136,140,145,151,157,88,81,112,112,90,90,90,90,150,147,151,153,150,90,167,151,136,157,157,148,187,141,145,90,69,90,177,148,135,142,153,148,151,157,84,148,157,139,82,88,167,151,136,157,157,148,187,141,145,88,81,112,90,90,90,90,167,151,136,157,157,148,187,141,145,84,177,155,148,147,136,157,187,141,145,177,148,135,157,142,90,69,90,142,136,141,157,112,90,90,90,90,167,151,136,157,157,148,187,141,145,84,168,157,135,157,142,179,148,167,138,153,139,148,90,69,90,156,153,150,135,157,112,90,90,90,90,167,151,136,157,157,148,187,141,145,84,170,153,136,157,148,142,90,69,90,183,147,136,157,187,141,145,112,112,90,90,90,90,85,85,90,174,147,149,152,147,150,90,151,141,135,142,147,149,112,90,90,90,90,150,147,151,153,150,90,184,141,142,142,147,148,90,69,90,177,148,135,142,153,148,151,157,84,148,157,139,82,88,177,149,153,155,157,184,141,142,142,147,148,88,81,112,90,90,90,90,184,141,142,142,147,148,84,167,145,128,157,90,69,90,173,190,145,149,72,84,148,157,139,82,74,86,90,78,77,86,90,74,86,90,78,77,81,112,90,90,90,90,184,141,142,142,147,148,84,170,147,135,145,142,145,147,148,90,69,90,173,190,145,149,72,84,148,157,139,82,74,86,90,72,74,86,90,74,86,90,72,74,74,81,112,90,90,90,90,184,141,142,142,147,148,84,177,149,153,155,157,90,69,90,88,136,152,130,153,135,135,157,142,145,158,64,83,83,73,71,76,71,78,71,75,75,74,66,73,75,75,74,73,88,112,90,90,90,90,184,141,142,142,147,148,84,184,153,151,143,155,136,147,141,148,158,183,147,150,147,136,71,90,69,90,183,147,150,147,136,71,84,156,136,147,149,168,187,184,82,72,74,86,90,72,74,86,90,72,74,81,112,90,90,90,90,184,141,142,142,147,148,84,184,147,136,158,157,136,167,145,128,157,170,145,130,157,150,90,69,90,74,112,90,90,90,90,184,141,142,142,147,148,84,170,153,136,157,148,142,90,69,90,167,151,136,157,157,148,187,141,145,112,112,90,90,90,90,150,147,151,153,150,90,183,147,136,148,157,136,90,69,90,177,148,135,142,153,148,151,157,84,148,157,139,82,88,173,177,183,147,136,148,157,136,88,81,112,90,90,90,90,183,147,136,148,157,136,84,183,147,136,148,157,136,168,153,158,145,141,135,90,69,90,173,190,145,149,84,148,157,139,82,74,86,90,76,81,112,90,90,90,90,183,147,136,148,157,136,84,170,153,136,157,148,142,90,69,90,184,141,142,142,147,148,112,112,90,90,90,90,85,85,90,173,177,167,142,136,147,143,157,90,175,157,158,145,138,112,90,90,90,90,150,147,151,153,150,90,167,142,136,147,143,157,90,69,90,177,148,135,142,153,148,151,157,84,148,157,139,82,88,173,177,167,142,136,147,143,157,88,81,112,90,90,90,90,167,142,136,147,143,157,84,174,146,145,151,143,148,157,135,135,90,69,90,72,112,90,90,90,90,167,142,136,147,143,157,84,183,147,150,147,136,90,69,90,183,147,150,147,136,71,84,156,136,147,149,168,187,184,82,72,77,77,86,90,73,78,74,86,90,74,81,112,90,90,90,90,167,142,136,147,143,157,84,170,153,136,157,148,142,90,69,90,184,141,142,142,147,148,112,112,90,90,90,90,85,85,90,190,168,185,187,187,185,184,182,189,90,184,173,174,174,179,180,90,82,170,183,90,79,90,181,147,152,145,150,157,81,112,90,90,90,90,150,147,151,153,150,90,158,136,153,155,155,145,148,155,90,69,90,156,153,150,135,157,112,90,90,90,90,150,147,151,153,150,90,158,136,153,155,167,142,153,136,142,86,90,135,142,153,136,142,170,147,135,112,112,90,90,90,90,150,147,151,153,150,90,156,141,148,151,142,145,147,148,90,135,142,153,136,142,190,136,153,155,82,145,148,138,141,142,81,112,90,90,90,90,90,90,90,90,158,136,153,155,155,145,148,155,90,69,90,142,136,141,157,112,90,90,90,90,90,90,90,90,158,136,153,155,167,142,153,136,142,90,69,90,145,148,138,141,142,84,170,147,135,145,142,145,147,148,112,90,90,90,90,90,90,90,90,135,142,153,136,142,170,147,135,90,69,90,184,141,142,142,147,148,84,170,147,135,145,142,145,147,148,112,90,90,90,90,157,148,158,112,112,90,90,90,90,150,147,151,153,150,90,156,141,148,151,142,145,147,148,90,157,148,158,190,136,153,155,82,81,112,90,90,90,90,90,90,90,90,158,136,153,155,155,145,148,155,90,69,90,156,153,150,135,157,112,90,90,90,90,157,148,158,112,112,90,90,90,90,184,141,142,142,147,148,84,177,148,138,141,142,184,157,155,153,148,64,183,147,148,148,157,151,142,82,156,141,148,151,142,145,147,148,82,145,148,138,141,142,81,112,90,90,90,90,90,90,90,90,145,156,90,145,148,138,141,142,84,173,135,157,136,177,148,138,141,142,174,129,138,157,90,69,69,90,189,148,141,149,84,173,135,157,136,177,148,138,141,142,174,129,138,157,84,181,147,141,135,157,184,141,142,142,147,148,73,90,147,136,112,90,90,90,90,90,90,90,90,145,148,138,141,142,84,173,135,157,136,177,148,138,141,142,174,129,138,157,90,69,69,90,189,148,141,149,84,173,135,157,136,177,148,138,141,142,174,129,138,157,84,174,147,141,151,146,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,135,142,153,136,142,190,136,153,155,82,145,148,138,141,142,81,112,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,157,148,158,81,112,112,90,90,90,90,184,141,142,142,147,148,84,177,148,138,141,142,189,148,158,157,158,64,183,147,148,148,157,151,142,82,156,141,148,151,142,145,147,148,82,145,148,138,141,142,81,112,90,90,90,90,90,90,90,90,145,156,90,145,148,138,141,142,84,173,135,157,136,177,148,138,141,142,174,129,138,157,90,69,69,90,189,148,141,149,84,173,135,157,136,177,148,138,141,142,174,129,138,157,84,181,147,141,135,157,184,141,142,142,147,148,73,90,147,136,112,90,90,90,90,90,90,90,90,145,148,138,141,142,84,173,135,157,136,177,148,138,141,142,174,129,138,157,90,69,69,90,189,148,141,149,84,173,135,157,136,177,148,138,141,142,174,129,138,157,84,174,147,141,151,146,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,190,136,153,155,82,81,112,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,157,148,158,81,112,112,90,90,90,90,173,177,167,84,177,148,138,141,142,183,146,153,148,155,157,158,64,183,147,148,148,157,151,142,82,156,141,148,151,142,145,147,148,82,145,148,138,141,142,81,112,90,90,90,90,90,90,90,90,145,156,90,158,136,153,155,155,145,148,155,90,153,148,158,90,82,145,148,138,141,142,84,173,135,157,136,177,148,138,141,142,174,129,138,157,90,69,69,90,189,148,141,149,84,173,135,157,136,177,148,138,141,142,174,129,138,157,84,181,147,141,135,157,181,147,140,157,149,157,148,142,90,147,136,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,145,148,138,141,142,84,173,135,157,136,177,148,138,141,142,174,129,138,157,90,69,69,90,189,148,141,149,84,173,135,157,136,177,148,138,141,142,174,129,138,157,84,174,147,141,151,146,81,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,158,157,150,142,153,90,69,90,145,148,138,141,142,84,170,147,135,145,142,145,147,148,90,85,90,158,136,153,155,167,142,153,136,142,112,90,90,90,90,90,90,90,90,90,90,90,90,184,141,142,142,147,148,84,170,147,135,145,142,145,147,148,90,69,90,173,190,145,149,72,84,148,157,139,82,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,135,142,153,136,142,170,147,135,84,162,84,167,151,153,150,157,86,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,135,142,153,136,142,170,147,135,84,162,84,179,156,156,135,157,142,90,79,90,158,157,150,142,153,84,162,86,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,135,142,153,136,142,170,147,135,84,161,84,167,151,153,150,157,86,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,135,142,153,136,142,170,147,135,84,161,84,179,156,156,135,157,142,90,79,90,158,157,150,142,153,84,161,112,90,90,90,90,90,90,90,90,90,90,90,90,81,112,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,157,148,158,81,112,112,90,90,90,90,85,85,90,174,179,187,187,182,189,90,171,177,180,190,179,171,112,90,90,90,90,150,147,151,153,150,90,145,135,179,138,157,148,90,69,90,142,136,141,157,112,112,90,90,90,90,184,141,142,142,147,148,84,181,147,141,135,157,184,141,142,142,147,148,73,183,150,145,151,143,64,183,147,148,148,157,151,142,82,156,141,148,151,142,145,147,148,82,81,112,90,90,90,90,90,90,90,90,145,156,90,145,135,179,138,157,148,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,171,145,148,158,147,139,64,183,150,147,135,157,82,81,112,90,90,90,90,90,90,90,90,157,150,135,157,112,90,90,90,90,90,90,90,90,90,90,90,90,171,145,148,158,147,139,64,179,138,157,148,82,81,112,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,90,90,90,90,145,135,179,138,157,148,90,69,90,148,147,142,90,145,135,179,138,157,148,112,90,90,90,90,157,148,158,81,112,112,90,90,90,90,85,85,90,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,90,90,90,90,85,85,90,178,145,150,153,148,155,90,147,142,147,149,153,142,145,135,90,135,153,153,142,90,171,145,148,158,147,139,90,158,145,85,158,157,135,142,136,147,129,112,90,90,90,90,85,85,90,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,112,90,90,90,90,145,156,90,171,145,148,158,147,139,84,179,148,190,157,135,142,136,147,129,90,142,146,157,148,112,90,90,90,90,90,90,90,90,171,145,148,158,147,139,64,179,148,190,157,135,142,136,147,129,82,156,141,148,151,142,145,147,148,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,184,141,142,142,147,148,64,190,157,135,142,136,147,129,82,81,112,90,90,90,90,90,90,90,90,157,148,158,81,112,90,90,90,90,157,150,135,157,112,90,90,90,90,90,90,90,90,85,85,90,156,153,150,150,152,153,151,143,90,144,145,143,153,90,142,145,158,153,143,90,153,158,153,90,179,148,190,157,135,142,136,147,129,64,90,151,157,143,90,138,153,136,157,148,142,112,90,90,90,90,90,90,90,90,171,145,148,158,147,139,84,185,148,151,157,135,142,136,129,183,146,153,148,155,157,158,64,183,147,148,148,157,151,142,82,156,141,148,151,142,145,147,148,82,163,86,90,138,153,136,157,148,142,81,112,90,90,90,90,90,90,90,90,90,90,90,90,145,156,90,148,147,142,90,138,153,136,157,148,142,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,145,156,90,184,141,142,142,147,148,90,153,148,158,90,184,141,142,142,147,148,84,170,153,136,157,148,142,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,184,141,142,142,147,148,64,190,157,135,142,136,147,129,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,90,90,90,90,157,148,158,81,112,90,90,90,90,157,148,158,112,112,112,112,112,112,90,90,90,90,85,85,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,90,90,90,90,85,85,90,11,227,246,245,90,181,185,177,180,90,174,185,184,112,90,90,90,90,85,85,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,90,90,90,90,150,147,151,153,150,90,181,153,145,148,174,153,152,90,69,90,171,145,148,158,147,139,64,174,153,152,82,127,90,174,145,142,150,157,90,69,90,88,181,153,145,148,88,86,90,177,151,147,148,90,69,90,88,146,147,141,135,157,88,90,133,81,112,90,90,90,90,150,147,151,153,150,90,185,141,142,147,174,153,152,90,69,90,171,145,148,158,147,139,64,174,153,152,82,127,90,174,145,142,150,157,90,69,90,88,179,142,147,149,153,135,145,88,86,90,177,151,147,148,90,69,90,88,136,157,138,157,153,142,88,90,133,81,112,90,90,90,90,150,147,151,153,150,90,174,153,152,174,157,150,157,138,147,136,142,90,69,90,171,145,148,158,147,139,64,174,153,152,82,127,90,174,145,142,150,157,90,69,90,88,174,157,150,157,138,147,136,142,88,86,90,177,151,147,148,90,69,90,88,149,153,138,88,90,133,81,112,90,90,90,90,150,147,151,153,150,90,171,157,152,174,153,152,90,69,90,171,145,148,158,147,139,64,174,153,152,82,127,90,174,145,142,150,157,90,69,90,88,171,157,152,146,147,147,143,88,86,90,177,151,147,148,90,69,90,88,150,145,148,143,88,90,133,81,112,112,90,90,90,90,85,85,90,85,85,83,83,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,90,90,90,90,85,85,90,85,85,83,83,90,11,227,227,209,90,185,173,174,179,90,188,177,167,178,112,90,90,90,90,85,85,90,85,85,83,83,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,90,90,90,90,85,85,90,181,153,145,148,174,153,152,64,190,145,140,145,158,157,136,82,81,112,112,90,90,90,90,85,85,90,150,147,151,153,150,90,188,141,148,151,185,141,142,147,188,145,135,146,90,69,90,127,112,90,90,90,90,85,85,90,90,90,90,90,153,141,142,147,156,145,135,146,90,69,90,156,153,150,135,157,86,112,90,90,90,90,85,85,90,90,90,90,90,148,147,136,149,153,150,158,157,150,153,129,90,69,90,73,86,112,90,90,90,90,85,85,90,133,112,90,90,90,90,85,85,90,150,147,151,153,150,90,153,141,142,147,188,145,135,146,182,147,147,138,112,112,90,90,90,90,85,85,90,85,85,90,153,149,152,145,150,90,148,157,142,90,156,147,150,158,157,136,112,90,90,90,90,85,85,90,150,147,151,153,150,90,156,141,148,151,142,145,147,148,90,155,157,142,180,157,142,188,147,150,158,157,136,82,81,112,90,90,90,90,85,85,90,90,90,90,90,150,147,151,153,150,90,138,153,151,143,153,155,157,135,90,69,90,168,157,138,150,145,151,153,142,157,158,167,142,147,136,153,155,157,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,170,153,151,143,153,155,157,135,88,81,112,90,90,90,90,85,85,90,90,90,90,90,145,156,90,138,153,151,143,153,155,157,135,90,153,148,158,90,138,153,151,143,153,155,157,135,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,163,177,148,158,157,130,88,81,90,142,146,157,148,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,156,147,136,90,163,86,90,151,146,145,150,158,90,145,148,90,145,138,153,145,136,135,82,138,153,151,143,153,155,157,135,84,163,177,148,158,157,130,64,187,157,142,183,146,145,150,158,136,157,148,82,81,81,90,158,147,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,90,90,90,90,145,156,90,151,146,145,150,158,84,180,153,149,157,64,156,145,148,158,82,88,164,135,150,157,145,142,148,145,151,143,163,148,157,142,186,88,81,90,142,146,157,148,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,136,157,142,141,136,148,90,151,146,145,150,158,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,148,157,142,88,81,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,85,85,90,90,90,90,90,157,148,158,112,90,90,90,90,85,85,90,90,90,90,90,136,157,142,141,136,148,90,168,157,138,150,145,151,153,142,157,158,167,142,147,136,153,155,157,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,148,157,142,88,81,90,147,136,90,168,157,138,150,145,151,153,142,157,158,167,142,147,136,153,155,157,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,180,157,142,88,81,112,90,90,90,90,85,85,90,157,148,158,112,112,90,90,90,90,85,85,90,85,85,90,153,149,152,145,150,90,136,157,149,147,142,157,90,157,140,157,148,142,83,156,141,148,151,142,145,147,148,112,90,90,90,90,85,85,90,150,147,151,153,150,90,156,141,148,151,142,145,147,148,90,155,157,142,188,145,135,146,145,148,155,168,157,149,147,142,157,135,82,81,112,90,90,90,90,85,85,90,90,90,90,90,150,147,151,153,150,90,148,157,142,90,69,90,155,157,142,180,157,142,188,147,150,158,157,136,82,81,112,90,90,90,90,85,85,90,90,90,90,90,145,156,90,148,147,142,90,148,157,142,90,142,146,157,148,90,136,157,142,141,136,148,90,148,145,150,90,157,148,158,112,90,90,90,90,85,85,90,90,90,90,90,150,147,151,153,150,90,151,146,153,136,155,157,90,69,90,148,157,142,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,168,188,83,183,146,153,136,155,157,188,145,135,146,145,148,155,168,147,158,88,81,112,90,90,90,90,85,85,90,90,90,90,90,150,147,151,153,150,90,149,145,148,145,90,69,90,148,157,142,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,168,188,83,168,157,137,141,157,135,142,188,145,135,146,145,148,155,181,145,148,145,155,153,149,157,167,142,153,136,142,157,158,88,81,112,90,90,90,90,85,85,90,90,90,90,90,150,147,151,153,150,90,151,153,148,151,157,150,177,148,90,69,90,148,157,142,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,168,188,83,183,153,148,151,157,150,188,145,135,146,145,148,155,177,148,138,141,142,135,88,81,112,90,90,90,90,85,85,90,90,90,90,90,150,147,151,153,150,90,157,137,141,145,138,90,69,90,148,157,142,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,168,189,83,189,137,141,145,138,174,147,147,150,188,136,147,149,178,147,142,152,153,136,88,81,112,90,90,90,90,85,85,90,90,90,90,90,150,147,151,153,150,90,151,147,149,138,150,157,142,157,90,69,90,148,157,142,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,168,189,83,188,145,135,146,145,148,155,183,147,149,138,150,157,142,157,158,88,81,112,90,90,90,90,85,85,90,90,90,90,90,145,156,90,148,147,142,90,82,151,146,153,136,155,157,90,153,148,158,90,149,145,148,145,90,153,148,158,90,151,153,148,151,157,150,177,148,90,153,148,158,90,157,137,141,145,138,90,153,148,158,90,151,147,149,138,150,157,142,157,81,90,142,146,157,148,90,136,157,142,141,136,148,90,148,145,150,90,157,148,158,112,90,90,90,90,85,85,90,90,90,90,90,136,157,142,141,136,148,90,127,151,146,153,136,155,157,90,69,90,151,146,153,136,155,157,86,90,149,145,148,145,90,69,90,149,145,148,145,86,90,151,153,148,151,157,150,177,148,90,69,90,151,153,148,151,157,150,177,148,86,90,157,137,141,145,138,90,69,90,157,137,141,145,138,86,90,151,147,149,138,150,157,142,157,90,69,90,151,147,149,138,150,157,142,157,133,112,90,90,90,90,85,85,90,157,148,158,112,112,112,90,90,90,90,85,85,90,85,85,90,145,148,135,142,153,148,142,90,148,147,136,149,153,150,90,156,145,135,146,112,90,90,90,90,85,85,90,150,147,151,153,150,90,156,141,148,151,142,145,147,148,90,135,142,153,136,142,177,148,135,142,153,148,142,180,147,136,149,153,150,82,81,112,90,90,90,90,85,85,90,90,90,90,90,150,147,151,153,150,90,136,90,69,90,155,157,142,188,145,135,146,145,148,155,168,157,149,147,142,157,135,82,81,112,90,90,90,90,85,85,90,90,90,90,90,145,156,90,148,147,142,90,136,90,142,146,157,148,90,136,157,142,141,136,148,90,157,148,158,112,90,90,90,90,85,85,90,90,90,90,90,188,141,148,151,185,141,142,147,188,145,135,146,84,153,141,142,147,156,145,135,146,90,69,90,142,136,141,157,112,90,90,90,90,85,85,90,90,90,90,90,139,146,145,150,157,90,188,141,148,151,185,141,142,147,188,145,135,146,84,153,141,142,147,156,145,135,146,90,158,147,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,138,151,153,150,150,82,156,141,148,151,142,145,147,148,82,81,90,136,84,151,153,148,151,157,150,177,148,64,177,148,140,147,143,157,167,157,136,140,157,136,82,81,90,157,148,158,81,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,142,153,135,143,84,139,153,145,142,82,74,84,73,81,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,135,157,136,140,157,136,174,145,149,157,90,69,90,171,147,136,143,135,138,153,151,157,64,187,157,142,167,157,136,140,157,136,174,145,149,157,180,147,139,82,81,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,136,84,151,146,153,136,155,157,64,177,148,140,147,143,157,167,157,136,140,157,136,82,135,157,136,140,157,136,174,145,149,157,81,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,142,153,135,143,84,139,153,145,142,82,74,84,72,77,81,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,130,90,69,90,85,73,84,72,71,66,90,79,90,149,153,142,146,84,136,153,148,158,147,149,82,85,72,86,90,72,81,90,83,90,73,74,74,74,74,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,129,90,69,90,74,84,65,76,65,90,79,90,149,153,142,146,84,136,153,148,158,147,149,82,85,72,86,90,72,81,90,83,90,73,74,74,74,74,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,147,156,156,135,157,142,90,69,90,149,153,142,146,84,136,153,148,158,147,149,82,85,72,86,90,72,81,90,83,90,73,74,74,74,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,136,84,149,145,148,145,64,177,148,140,147,143,157,167,157,136,140,157,136,82,130,86,90,129,86,90,171,147,136,143,135,138,153,151,157,64,187,157,142,167,157,136,140,157,136,174,145,149,157,180,147,139,82,81,90,79,90,147,156,156,135,157,142,81,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,142,153,135,143,84,139,153,145,142,82,188,141,148,151,185,141,142,147,188,145,135,146,84,148,147,136,149,153,150,158,157,150,153,129,81,112,90,90,90,90,85,85,90,113,113,136,84,151,147,149,138,150,157,142,157,64,188,145,136,157,167,157,136,140,157,136,82,81,112,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,142,153,135,143,84,139,153,145,142,82,74,84,77,81,112,90,90,90,90,85,85,90,90,90,90,90,157,148,158,112,90,90,90,90,85,85,90,157,148,158,112,112,90,90,90,90,85,85,90,150,147,151,153,150,90,156,141,148,151,142,145,147,148,90,135,142,147,138,177,148,135,142,153,148,142,180,147,136,149,153,150,82,81,112,90,90,90,90,85,85,90,90,90,90,90,188,141,148,151,185,141,142,147,188,145,135,146,84,153,141,142,147,156,145,135,146,90,69,90,156,153,150,135,157,112,90,90,90,90,85,85,90,157,148,158,112,112,90,90,90,90,85,85,90,181,153,145,148,174,153,152,64,174,147,155,155,150,157,82,127,112,90,90,90,90,85,85,90,90,90,90,90,174,145,142,150,157,90,69,90,88,180,147,136,149,153,150,90,188,145,135,146,88,86,112,90,90,90,90,85,85,90,90,90,90,90,183,153,150,150,152,153,151,143,90,69,90,156,141,148,151,142,145,147,148,82,140,153,150,141,157,81,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,145,156,90,140,153,150,141,157,90,142,146,157,148,90,135,142,153,136,142,177,148,135,142,153,148,142,180,147,136,149,153,150,82,81,90,157,150,135,157,90,135,142,147,138,177,148,135,142,153,148,142,180,147,136,149,153,150,82,81,90,157,148,158,112,90,90,90,90,85,85,90,90,90,90,90,157,148,158,112,90,90,90,90,85,85,90,133,81,112,112,90,90,90,90,85,85,90,181,153,145,148,174,153,152,64,167,150,145,158,157,136,82,127,112,90,90,90,90,85,85,90,90,90,90,90,174,145,142,150,157,90,69,90,88,190,157,150,153,129,90,180,147,136,149,153,150,88,86,112,90,90,90,90,85,85,90,90,90,90,90,167,142,157,138,90,69,90,74,84,73,86,112,90,90,90,90,85,85,90,90,90,90,90,172,153,150,141,157,90,69,90,127,90,181,145,148,90,69,90,74,86,90,181,153,130,90,69,90,71,84,74,86,90,190,157,156,153,141,150,142,90,69,90,73,84,74,90,133,86,112,90,90,90,90,85,85,90,90,90,90,90,183,153,150,150,152,153,151,143,90,69,90,156,141,148,151,142,145,147,148,82,140,81,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,188,141,148,151,185,141,142,147,188,145,135,146,84,148,147,136,149,153,150,158,157,150,153,129,90,69,90,140,112,90,90,90,90,85,85,90,90,90,90,90,157,148,158,112,90,90,90,90,85,85,90,133,81,112,112,90,90,90,90,85,85,90,181,153,145,148,174,153,152,64,190,145,140,145,158,157,136,82,81,112,112,112,90,90,90,90,85,85,90,85,85,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,90,90,90,90,85,85,90,85,85,90,11,227,238,193,90,184,150,153,142,153,148,142,90,188,145,135,146,90,167,157,142,142,145,148,155,135,90,82,179,138,142,145,149,145,128,157,158,81,112,90,90,90,90,85,85,90,85,85,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,90,90,90,90,85,85,90,150,147,151,153,150,90,188,141,148,151,185,141,142,147,188,145,135,146,90,69,90,127,112,90,90,90,90,85,85,90,90,90,90,90,153,141,142,147,156,145,135,146,90,69,90,156,153,150,135,157,86,112,90,90,90,90,85,85,90,90,90,90,90,152,145,142,157,190,157,150,153,129,90,69,90,73,84,76,77,86,112,90,90,90,90,85,85,90,90,90,90,90,138,147,135,142,168,157,157,150,190,157,150,153,129,90,69,90,74,84,71,74,86,112,90,90,90,90,85,85,90,90,90,90,90,149,145,148,145,185,136,155,90,69,90,85,72,86,112,90,90,90,90,85,85,90,90,90,90,90,149,145,148,145,185,136,155,72,90,69,90,73,112,90,90,90,90,85,85,90,133,112,112,90,90,90,90,85,85,90,150,147,151,153,150,90,153,141,142,147,188,145,135,146,182,147,147,138,90,69,90,148,145,150,112,90,90,90,90,85,85,90,150,147,151,153,150,90,151,153,151,146,157,158,90,69,90,148,145,150,112,112,90,90,90,90,85,85,90,85,85,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,90,90,90,90,85,85,90,85,85,90,11,227,238,193,90,183,153,151,146,157,158,90,168,157,149,147,142,157,90,188,157,142,151,146,157,136,112,90,90,90,90,85,85,90,85,85,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,90,90,90,90,85,85,90,150,147,151,153,150,90,156,141,148,151,142,145,147,148,90,155,157,142,168,157,149,147,142,157,135,82,81,112,90,90,90,90,85,85,90,90,90,90,90,145,156,90,151,153,151,146,157,158,90,142,146,157,148,90,136,157,142,141,136,148,90,151,153,151,146,157,158,90,157,148,158,112,112,90,90,90,90,85,85,90,90,90,90,90,150,147,151,153,150,90,136,135,90,69,90,168,157,138,150,145,151,153,142,157,158,167,142,147,136,153,155,157,112,90,90,90,90,85,85,90,90,90,90,90,150,147,151,153,150,90,138,153,151,143,153,155,157,135,90,69,90,136,135,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,170,153,151,143,153,155,157,135,88,81,112,90,90,90,90,85,85,90,90,90,90,90,150,147,151,153,150,90,148,157,142,188,147,150,158,157,136,112,112,90,90,90,90,85,85,90,90,90,90,90,145,156,90,138,153,151,143,153,155,157,135,90,153,148,158,90,138,153,151,143,153,155,157,135,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,163,177,148,158,157,130,88,81,90,142,146,157,148,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,156,147,136,90,163,86,90,151,146,145,150,158,90,145,148,90,145,138,153,145,136,135,82,138,153,151,143,153,155,157,135,84,163,177,148,158,157,130,64,187,157,142,183,146,145,150,158,136,157,148,82,81,81,90,158,147,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,90,90,90,90,145,156,90,151,146,145,150,158,84,180,153,149,157,64,156,145,148,158,82,88,164,135,150,157,145,142,148,145,151,143,163,148,157,142,186,88,81,90,142,146,157,148,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,148,157,142,188,147,150,158,157,136,90,69,90,151,146,145,150,158,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,148,157,142,88,81,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,152,136,157,153,143,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,85,85,90,90,90,90,90,157,148,158,112,112,90,90,90,90,85,85,90,90,90,90,90,148,157,142,188,147,150,158,157,136,90,69,90,148,157,142,188,147,150,158,157,136,90,147,136,90,136,135,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,148,157,142,88,81,90,147,136,90,136,135,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,180,157,142,88,81,112,90,90,90,90,85,85,90,90,90,90,90,145,156,90,148,147,142,90,148,157,142,188,147,150,158,157,136,90,142,146,157,148,90,136,157,142,141,136,148,90,157,148,158,112,112,90,90,90,90,85,85,90,90,90,90,90,150,147,151,153,150,90,136,90,69,90,127,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,151,146,153,136,155,157,90,90,90,69,90,148,157,142,188,147,150,158,157,136,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,168,188,83,183,146,153,136,155,157,188,145,135,146,145,148,155,168,147,158,88,81,90,90,90,90,90,90,90,90,90,90,147,136,90,148,157,142,188,147,150,158,157,136,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,183,146,153,136,155,157,188,145,135,146,145,148,155,168,147,158,88,81,86,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,149,145,148,145,90,90,90,90,90,69,90,148,157,142,188,147,150,158,157,136,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,168,188,83,168,157,137,141,157,135,142,188,145,135,146,145,148,155,181,145,148,145,155,153,149,157,167,142,153,136,142,157,158,88,81,90,147,136,90,148,157,142,188,147,150,158,157,136,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,168,157,137,141,157,135,142,188,145,135,146,145,148,155,181,145,148,145,155,153,149,157,167,142,153,136,142,157,158,88,81,86,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,151,153,148,151,157,150,177,148,90,69,90,148,157,142,188,147,150,158,157,136,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,168,188,83,183,153,148,151,157,150,188,145,135,146,145,148,155,177,148,138,141,142,135,88,81,90,90,90,90,90,90,90,147,136,90,148,157,142,188,147,150,158,157,136,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,183,153,148,151,157,150,188,145,135,146,145,148,155,177,148,138,141,142,135,88,81,86,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,157,137,141,145,138,90,90,90,90,69,90,148,157,142,188,147,150,158,157,136,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,168,189,83,189,137,141,145,138,174,147,147,150,188,136,147,149,178,147,142,152,153,136,88,81,90,90,90,90,90,90,90,147,136,90,148,157,142,188,147,150,158,157,136,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,189,137,141,145,138,174,147,147,150,188,136,147,149,178,147,142,152,153,136,88,81,86,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,151,147,149,138,150,157,142,157,90,69,90,148,157,142,188,147,150,158,157,136,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,168,189,83,188,145,135,146,145,148,155,183,147,149,138,150,157,142,157,158,88,81,90,90,90,90,90,90,90,90,90,90,147,136,90,148,157,142,188,147,150,158,157,136,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,188,145,135,146,145,148,155,183,147,149,138,150,157,142,157,158,88,81,86,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,135,157,150,150,185,150,150,90,90,69,90,148,157,142,188,147,150,158,157,136,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,168,188,83,167,157,150,150,185,150,150,177,142,157,149,135,88,81,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,136,90,148,157,142,188,147,150,158,157,136,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,167,157,150,150,185,150,150,177,142,157,149,135,88,81,112,90,90,90,90,85,85,90,90,90,90,90,133,112,112,90,90,90,90,85,85,90,90,90,90,90,145,156,90,148,147,142,90,82,136,84,151,146,153,136,155,157,90,153,148,158,90,136,84,149,145,148,145,90,153,148,158,90,136,84,151,153,148,151,157,150,177,148,90,153,148,158,90,136,84,151,147,149,138,150,157,142,157,90,153,148,158,90,136,84,157,137,141,145,138,81,90,142,146,157,148,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,136,157,142,141,136,148,90,148,145,150,112,90,90,90,90,85,85,90,90,90,90,90,157,148,158,112,112,90,90,90,90,85,85,90,90,90,90,90,151,153,151,146,157,158,90,69,90,136,112,90,90,90,90,85,85,90,90,90,90,90,136,157,142,141,136,148,90,136,112,90,90,90,90,85,85,90,157,148,158,112,112,90,90,90,90,85,85,90,85,85,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,90,90,90,90,85,85,90,85,85,90,11,227,238,193,90,183,147,136,157,90,184,150,153,142,153,148,142,90,185,151,142,145,147,148,135,112,90,90,90,90,85,85,90,85,85,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,90,90,90,90,85,85,90,150,147,151,153,150,90,156,141,148,151,142,145,147,148,90,136,157,151,153,135,142,184,157,156,147,136,157,184,145,142,157,82,81,112,90,90,90,90,85,85,90,90,90,90,90,150,147,151,153,150,90,136,90,69,90,155,157,142,168,157,149,147,142,157,135,82,81,112,90,90,90,90,85,85,90,90,90,90,90,145,156,90,148,147,142,90,136,90,142,146,157,148,90,136,157,142,141,136,148,90,157,148,158,112,112,90,90,90,90,85,85,90,90,90,90,90,142,153,135,143,84,135,138,153,139,148,82,156,141,148,151,142,145,147,148,82,81,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,138,151,153,150,150,82,136,84,151,153,148,151,157,150,177,148,84,177,148,140,147,143,157,167,157,136,140,157,136,86,90,136,84,151,153,148,151,157,150,177,148,81,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,142,153,135,143,84,139,153,145,142,82,74,84,74,71,81,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,138,151,153,150,150,82,136,84,151,146,153,136,155,157,84,177,148,140,147,143,157,167,157,136,140,157,136,86,90,136,84,151,146,153,136,155,157,86,90,171,147,136,143,135,138,153,151,157,64,187,157,142,167,157,136,140,157,136,174,145,149,157,180,147,139,82,81,81,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,138,151,153,150,150,82,136,84,149,145,148,145,84,177,148,140,147,143,157,167,157,136,140,157,136,86,90,136,84,149,145,148,145,86,90,188,141,148,151,185,141,142,147,188,145,135,146,84,149,145,148,145,185,136,155,86,90,188,141,148,151,185,141,142,147,188,145,135,146,84,149,145,148,145,185,136,155,72,81,112,90,90,90,90,85,85,90,90,90,90,90,157,148,158,81,112,90,90,90,90,85,85,90,157,148,158,112,112,90,90,90,90,85,85,90,150,147,151,153,150,90,156,141,148,151,142,145,147,148,90,136,157,157,150,180,147,139,82,81,112,90,90,90,90,85,85,90,90,90,90,90,150,147,151,153,150,90,136,90,69,90,155,157,142,168,157,149,147,142,157,135,82,81,112,90,90,90,90,85,85,90,90,90,90,90,145,156,90,148,147,142,90,136,90,142,146,157,148,90,136,157,142,141,136,148,90,157,148,158,112,112,90,90,90,90,85,85,90,90,90,90,90,142,153,135,143,84,135,138,153,139,148,82,156,141,148,151,142,145,147,148,82,81,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,136,84,151,147,149,138,150,157,142,157,64,188,145,136,157,167,157,136,140,157,136,82,81,112,90,90,90,90,85,85,90,113,113,142,153,135,143,84,139,153,145,142,82,74,84,74,73,81,112,90,90,90,90,85,85,90,90,90,90,90,157,148,158,81,112,90,90,90,90,85,85,90,157,148,158,112,112,90,90,90,90,85,85,90,85,85,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,90,90,90,90,85,85,90,85,85,90,11,227,238,193,90,185,141,142,147,188,145,135,146,90,167,142,153,136,142,83,167,142,147,138,112,90,90,90,90,85,85,90,85,85,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,90,90,90,90,85,85,90,150,147,151,153,150,90,156,141,148,151,142,145,147,148,90,135,142,153,136,142,185,141,142,147,188,145,135,146,82,81,112,90,90,90,90,85,85,90,90,90,90,90,145,156,90,153,141,142,147,188,145,135,146,182,147,147,138,90,142,146,157,148,90,136,157,142,141,136,148,90,157,148,158,112,90,90,90,90,85,85,90,90,90,90,90,150,147,151,153,150,90,136,90,69,90,155,157,142,168,157,149,147,142,157,135,82,81,112,90,90,90,90,85,85,90,90,90,90,90,145,156,90,148,147,142,90,136,90,142,146,157,148,90,136,157,142,141,136,148,90,157,148,158,112,112,90,90,90,90,85,85,90,90,90,90,90,188,141,148,151,185,141,142,147,188,145,135,146,84,153,141,142,147,156,145,135,146,90,69,90,142,136,141,157,112,112,90,90,90,90,85,85,90,90,90,90,90,153,141,142,147,188,145,135,146,182,147,147,138,90,69,90,142,153,135,143,84,135,138,153,139,148,82,156,141,148,151,142,145,147,148,82,81,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,139,146,145,150,157,90,188,141,148,151,185,141,142,147,188,145,135,146,84,153,141,142,147,156,145,135,146,90,158,147,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,90,90,90,90,136,157,151,153,135,142,184,157,156,147,136,157,184,145,142,157,82,81,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,90,90,90,90,142,153,135,143,84,139,153,145,142,82,188,141,148,151,185,141,142,147,188,145,135,146,84,152,145,142,157,190,157,150,153,129,81,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,90,90,90,90,136,157,157,150,180,147,139,82,81,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,90,90,90,90,142,153,135,143,84,139,153,145,142,82,188,141,148,151,185,141,142,147,188,145,135,146,84,138,147,135,142,168,157,157,150,190,157,150,153,129,81,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,153,141,142,147,188,145,135,146,182,147,147,138,90,69,90,148,145,150,112,90,90,90,90,85,85,90,90,90,90,90,157,148,158,81,112,90,90,90,90,85,85,90,157,148,158,112,112,90,90,90,90,85,85,90,150,147,151,153,150,90,156,141,148,151,142,145,147,148,90,135,142,147,138,185,141,142,147,188,145,135,146,82,81,112,90,90,90,90,85,85,90,90,90,90,90,188,141,148,151,185,141,142,147,188,145,135,146,84,153,141,142,147,156,145,135,146,90,69,90,156,153,150,135,157,112,90,90,90,90,85,85,90,157,148,158,112,112,112,90,90,90,90,85,85,90,181,153,145,148,174,153,152,64,174,147,155,155,150,157,82,127,112,90,90,90,90,85,85,90,90,90,90,90,174,145,142,150,157,90,69,90,88,184,150,153,142,153,148,142,90,188,145,135,146,88,86,112,90,90,90,90,85,85,90,90,90,90,90,183,153,150,150,152,153,151,143,90,69,90,156,141,148,151,142,145,147,148,82,140,153,150,141,157,81,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,145,156,90,140,153,150,141,157,90,142,146,157,148,90,135,142,153,136,142,185,141,142,147,188,145,135,146,82,81,90,157,150,135,157,90,135,142,147,138,185,141,142,147,188,145,135,146,82,81,90,157,148,158,112,90,90,90,90,85,85,90,90,90,90,90,157,148,158,112,90,90,90,90,85,85,90,133,81,112,112,90,90,90,90,85,85,90,181,153,145,148,174,153,152,64,167,150,145,158,157,136,82,127,112,90,90,90,90,85,85,90,90,90,90,90,174,145,142,150,157,90,69,90,88,190,157,150,153,129,90,184,150,153,142,153,148,142,88,86,112,90,90,90,90,85,85,90,90,90,90,90,167,142,157,138,90,69,90,74,84,74,73,86,112,90,90,90,90,85,85,90,90,90,90,90,172,153,150,141,157,90,69,90,127,90,181,145,148,90,69,90,74,84,74,77,86,90,181,153,130,90,69,90,71,86,90,190,157,156,153,141,150,142,90,69,90,188,141,148,151,185,141,142,147,188,145,135,146,84,152,145,142,157,190,157,150,153,129,90,133,86,112,90,90,90,90,85,85,90,90,90,90,90,183,153,150,150,152,153,151,143,90,69,90,156,141,148,151,142,145,147,148,82,140,81,112,90,90,90,90,85,85,90,90,90,90,90,90,90,90,90,188,141,148,151,185,141,142,147,188,145,135,146,84,152,145,142,157,190,157,150,153,129,90,69,90,140,112,90,90,90,90,85,85,90,90,90,90,90,157,148,158,112,90,90,90,90,85,85,90,133,81,112,90,90,90,90,85,85,90,181,153,145,148,174,153,152,64,190,145,140,145,158,157,136,82,81,112,112,90,90,90,90,85,85,83,83,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,90,90,90,90,85,85,83,83,90,11,227,227,209,90,185,173,174,179,90,188,177,167,178,112,90,90,90,90,85,85,83,83,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,112,90,90,90,90,150,147,151,153,150,90,188,141,148,151,185,141,142,147,188,145,135,146,90,69,90,127,112,90,90,90,90,90,90,90,90,153,141,142,147,156,145,135,146,90,69,90,156,153,150,135,157,86,112,90,90,90,90,90,90,90,90,148,147,136,149,153,150,158,157,150,153,129,90,69,90,73,86,112,90,90,90,90,90,90,90,90,138,136,157,168,157,151,153,135,142,190,157,150,153,129,90,69,90,74,84,71,86,112,90,90,90,90,90,90,90,90,152,145,142,157,190,157,150,153,129,90,69,90,73,84,77,112,90,90,90,90,133,112,90,90,90,90,150,147,151,153,150,90,153,141,142,147,188,145,135,146,182,147,147,138,112,112,90,90,90,90,85,85,90,153,149,152,145,150,90,148,157,142,90,156,147,150,158,157,136,112,90,90,90,90,150,147,151,153,150,90,156,141,148,151,142,145,147,148,90,155,157,142,180,157,142,188,147,150,158,157,136,82,81,112,90,90,90,90,90,90,90,90,150,147,151,153,150,90,138,153,151,143,153,155,157,135,90,69,90,168,157,138,150,145,151,153,142,157,158,167,142,147,136,153,155,157,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,170,153,151,143,153,155,157,135,88,81,112,90,90,90,90,90,90,90,90,145,156,90,138,153,151,143,153,155,157,135,90,153,148,158,90,138,153,151,143,153,155,157,135,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,163,177,148,158,157,130,88,81,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,156,147,136,90,163,86,90,151,146,145,150,158,90,145,148,90,145,138,153,145,136,135,82,138,153,151,143,153,155,157,135,84,163,177,148,158,157,130,64,187,157,142,183,146,145,150,158,136,157,148,82,81,81,90,158,147,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,145,156,90,151,146,145,150,158,84,180,153,149,157,64,156,145,148,158,82,88,164,135,150,157,145,142,148,145,151,143,163,148,157,142,186,88,81,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,136,157,142,141,136,148,90,151,146,145,150,158,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,148,157,142,88,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,90,90,90,90,136,157,142,141,136,148,90,168,157,138,150,145,151,153,142,157,158,167,142,147,136,153,155,157,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,148,157,142,88,81,90,147,136,90,168,157,138,150,145,151,153,142,157,158,167,142,147,136,153,155,157,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,180,157,142,88,81,112,90,90,90,90,157,148,158,112,112,90,90,90,90,85,85,90,153,149,152,145,150,90,136,157,149,147,142,157,90,157,140,157,148,142,83,156,141,148,151,142,145,147,148,112,90,90,90,90,150,147,151,153,150,90,156,141,148,151,142,145,147,148,90,155,157,142,188,145,135,146,145,148,155,168,157,149,147,142,157,135,82,81,112,90,90,90,90,90,90,90,90,150,147,151,153,150,90,148,157,142,90,69,90,155,157,142,180,157,142,188,147,150,158,157,136,82,81,112,90,90,90,90,90,90,90,90,145,156,90,148,147,142,90,148,157,142,90,142,146,157,148,90,136,157,142,141,136,148,90,148,145,150,90,157,148,158,112,90,90,90,90,90,90,90,90,150,147,151,153,150,90,151,146,153,136,155,157,90,69,90,148,157,142,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,168,188,83,183,146,153,136,155,157,188,145,135,146,145,148,155,168,147,158,88,81,112,90,90,90,90,90,90,90,90,150,147,151,153,150,90,149,145,148,145,90,69,90,148,157,142,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,168,188,83,168,157,137,141,157,135,142,188,145,135,146,145,148,155,181,145,148,145,155,153,149,157,167,142,153,136,142,157,158,88,81,112,90,90,90,90,90,90,90,90,150,147,151,153,150,90,151,153,148,151,157,150,177,148,90,69,90,148,157,142,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,168,188,83,183,153,148,151,157,150,188,145,135,146,145,148,155,177,148,138,141,142,135,88,81,112,90,90,90,90,90,90,90,90,150,147,151,153,150,90,157,137,141,145,138,90,69,90,148,157,142,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,168,189,83,189,137,141,145,138,174,147,147,150,188,136,147,149,178,147,142,152,153,136,88,81,112,90,90,90,90,90,90,90,90,150,147,151,153,150,90,151,147,149,138,150,157,142,157,90,69,90,148,157,142,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,168,189,83,188,145,135,146,145,148,155,183,147,149,138,150,157,142,157,158,88,81,112,90,90,90,90,90,90,90,90,145,156,90,148,147,142,90,82,151,146,153,136,155,157,90,153,148,158,90,149,145,148,145,90,153,148,158,90,151,153,148,151,157,150,177,148,90,153,148,158,90,157,137,141,145,138,90,153,148,158,90,151,147,149,138,150,157,142,157,81,90,142,146,157,148,90,136,157,142,141,136,148,90,148,145,150,90,157,148,158,112,90,90,90,90,90,90,90,90,136,157,142,141,136,148,90,127,151,146,153,136,155,157,90,69,90,151,146,153,136,155,157,86,90,149,145,148,145,90,69,90,149,145,148,145,86,90,151,153,148,151,157,150,177,148,90,69,90,151,153,148,151,157,150,177,148,86,90,157,137,141,145,138,90,69,90,157,137,141,145,138,86,90,151,147,149,138,150,157,142,157,90,69,90,151,147,149,138,150,157,142,157,133,112,90,90,90,90,157,148,158,112,112,112,90,90,90,90,150,147,151,153,150,90,156,141,148,151,142,145,147,148,90,135,142,153,136,142,177,148,135,142,153,148,142,180,147,136,149,153,150,82,81,112,90,90,90,90,90,90,90,90,150,147,151,153,150,90,136,90,69,90,155,157,142,188,145,135,146,145,148,155,168,157,149,147,142,157,135,82,81,112,90,90,90,90,90,90,90,90,145,156,90,148,147,142,90,136,90,142,146,157,148,90,136,157,142,141,136,148,90,157,148,158,112,90,90,90,90,90,90,90,90,188,141,148,151,185,141,142,147,188,145,135,146,84,153,141,142,147,156,145,135,146,90,69,90,142,136,141,157,112,90,90,90,90,90,90,90,90,139,146,145,150,157,90,188,141,148,151,185,141,142,147,188,145,135,146,84,153,141,142,147,156,145,135,146,90,158,147,112,90,90,90,90,90,90,90,90,90,90,90,90,138,151,153,150,150,82,156,141,148,151,142,145,147,148,82,81,90,136,84,151,153,148,151,157,150,177,148,64,177,148,140,147,143,157,167,157,136,140,157,136,82,81,90,157,148,158,81,112,90,90,90,90,90,90,90,90,90,90,90,90,142,153,135,143,84,139,153,145,142,82,74,84,73,81,112,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,135,157,136,140,157,136,174,145,149,157,90,69,90,171,147,136,143,135,138,153,151,157,64,187,157,142,167,157,136,140,157,136,174,145,149,157,180,147,139,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,136,84,151,146,153,136,155,157,64,177,148,140,147,143,157,167,157,136,140,157,136,82,135,157,136,140,157,136,174,145,149,157,81,112,90,90,90,90,90,90,90,90,90,90,90,90,142,153,135,143,84,139,153,145,142,82,74,84,72,77,81,112,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,130,90,69,90,85,73,84,72,71,66,90,79,90,149,153,142,146,84,136,153,148,158,147,149,82,85,72,86,90,72,81,90,83,90,73,74,74,74,74,112,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,129,90,69,90,74,84,65,76,65,90,79,90,149,153,142,146,84,136,153,148,158,147,149,82,85,72,86,90,72,81,90,83,90,73,74,74,74,74,112,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,147,156,156,135,157,142,90,69,90,149,153,142,146,84,136,153,148,158,147,149,82,85,72,86,90,72,81,90,83,90,73,74,74,74,112,90,90,90,90,90,90,90,90,90,90,90,90,136,84,149,145,148,145,64,177,148,140,147,143,157,167,157,136,140,157,136,82,130,86,90,129,86,90,171,147,136,143,135,138,153,151,157,64,187,157,142,167,157,136,140,157,136,174,145,149,157,180,147,139,82,81,90,79,90,147,156,156,135,157,142,81,112,90,90,90,90,90,90,90,90,90,90,90,90,142,153,135,143,84,139,153,145,142,82,188,141,148,151,185,141,142,147,188,145,135,146,84,148,147,136,149,153,150,158,157,150,153,129,81,112,90,90,90,90,90,90,90,90,90,90,90,90,156,147,136,90,145,90,69,90,73,86,90,149,153,142,146,84,136,153,148,158,147,149,82,71,86,90,77,81,90,158,147,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,136,84,151,147,149,138,150,157,142,157,64,188,145,136,157,167,157,136,140,157,136,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,142,153,135,143,84,139,153,145,142,82,149,153,142,146,84,136,153,148,158,147,149,82,72,77,86,90,77,74,81,90,83,90,73,74,74,74,81,112,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,90,90,90,90,90,90,90,90,142,153,135,143,84,139,153,145,142,82,74,84,72,81,112,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,157,148,158,112,112,90,90,90,90,150,147,151,153,150,90,156,141,148,151,142,145,147,148,90,135,142,147,138,177,148,135,142,153,148,142,180,147,136,149,153,150,82,81,112,90,90,90,90,90,90,90,90,188,141,148,151,185,141,142,147,188,145,135,146,84,153,141,142,147,156,145,135,146,90,69,90,156,153,150,135,157,112,90,90,90,90,157,148,158,112,112,112,90,90,90,90,181,153,145,148,174,153,152,64,167,157,151,142,145,147,148,82,127,112,90,90,90,90,90,90,90,90,174,145,142,150,157,90,69,90,88,180,147,136,149,153,150,90,188,145,135,146,145,148,155,88,86,112,90,90,90,90,90,90,90,90,174,157,130,142,167,145,128,157,90,69,90,72,74,86,112,90,90,90,90,133,81,112,112,90,90,90,90,181,153,145,148,174,153,152,64,174,147,155,155,150,157,82,127,112,90,90,90,90,90,90,90,90,174,145,142,150,157,90,69,90,88,177,148,135,142,153,148,142,90,180,147,136,149,153,150,90,188,145,135,146,88,86,112,90,90,90,90,90,90,90,90,183,153,150,150,152,153,151,143,90,69,90,156,141,148,151,142,145,147,148,82,140,153,150,141,157,81,112,90,90,90,90,90,90,90,90,90,90,90,90,142,153,135,143,84,139,153,145,142,82,74,84,72,81,112,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,136,90,69,90,155,157,142,188,145,135,146,145,148,155,168,157,149,147,142,157,135,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,136,84,157,137,141,145,138,64,188,145,136,157,167,157,136,140,157,136,82,73,81,112,90,90,90,90,90,90,90,90,90,90,90,90,145,156,90,140,153,150,141,157,90,142,146,157,148,90,135,142,153,136,142,177,148,135,142,153,148,142,180,147,136,149,153,150,82,81,90,157,150,135,157,90,135,142,147,138,177,148,135,142,153,148,142,180,147,136,149,153,150,82,81,90,157,148,158,112,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,133,81,112,112,90,90,90,90,181,153,145,148,174,153,152,64,167,150,145,158,157,136,82,127,112,90,90,90,90,90,90,90,90,174,145,142,150,157,90,69,90,88,190,157,150,153,129,90,151,147,149,138,150,157,142,157,88,86,112,90,90,90,90,90,90,90,90,167,142,157,138,90,69,90,74,84,73,86,112,90,90,90,90,90,90,90,90,172,153,150,141,157,90,69,90,127,90,181,145,148,90,69,90,74,86,90,181,153,130,90,69,90,71,84,74,86,90,190,157,156,153,141,150,142,90,69,90,73,84,74,90,133,86,112,90,90,90,90,90,90,90,90,183,153,150,150,152,153,151,143,90,69,90,156,141,148,151,142,145,147,148,82,140,81,112,90,90,90,90,90,90,90,90,90,90,90,90,188,141,148,151,185,141,142,147,188,145,135,146,84,148,147,136,149,153,150,158,157,150,153,129,90,69,90,140,112,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,133,81,112,112,90,90,90,90,181,153,145,148,174,153,152,64,190,145,140,145,158,157,136,82,81,112,112,90,90,90,90,150,147,151,153,150,90,156,141,148,151,142,145,147,148,90,136,157,151,153,135,142,184,157,156,147,136,157,184,145,142,157,82,81,112,90,90,90,90,90,90,90,90,150,147,151,153,150,90,136,90,69,90,155,157,142,188,145,135,146,145,148,155,168,157,149,147,142,157,135,82,81,112,90,90,90,90,90,90,90,90,145,156,90,148,147,142,90,136,90,142,146,157,148,90,136,157,142,141,136,148,90,157,148,158,112,90,90,90,90,90,90,90,90,142,153,135,143,84,135,138,153,139,148,82,156,141,148,151,142,145,147,148,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,138,151,153,150,150,82,156,141,148,151,142,145,147,148,82,81,90,136,84,151,153,148,151,157,150,177,148,64,177,148,140,147,143,157,167,157,136,140,157,136,82,81,90,157,148,158,81,112,90,90,90,90,90,90,90,90,90,90,90,90,142,153,135,143,84,139,153,145,142,82,74,84,73,81,112,90,90,90,90,90,90,90,90,90,90,90,90,136,84,151,146,153,136,155,157,64,177,148,140,147,143,157,167,157,136,140,157,136,82,171,147,136,143,135,138,153,151,157,64,187,157,142,167,157,136,140,157,136,174,145,149,157,180,147,139,82,81,81,112,90,90,90,90,90,90,90,90,90,90,90,90,136,84,149,145,148,145,64,177,148,140,147,143,157,167,157,136,140,157,136,82,85,72,86,90,73,81,112,90,90,90,90,90,90,90,90,157,148,158,81,112,90,90,90,90,157,148,158,112,112,90,90,90,90,150,147,151,153,150,90,156,141,148,151,142,145,147,148,90,136,157,157,150,180,147,139,82,81,112,90,90,90,90,90,90,90,90,150,147,151,153,150,90,136,90,69,90,155,157,142,188,145,135,146,145,148,155,168,157,149,147,142,157,135,82,81,112,90,90,90,90,90,90,90,90,145,156,90,148,147,142,90,136,90,142,146,157,148,90,136,157,142,141,136,148,90,157,148,158,112,90,90,90,90,90,90,90,90,142,153,135,143,84,135,138,153,139,148,82,156,141,148,151,142,145,147,148,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,152,153,142,151,146,90,69,90,77,112,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,136,157,138,157,153,142,135,90,69,90,76,112,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,149,145,151,136,147,190,157,150,153,129,90,69,90,74,84,74,74,74,73,112,112,90,90,90,90,90,90,90,90,90,90,90,90,156,147,136,90,163,90,69,90,73,86,90,136,157,138,157,153,142,135,90,158,147,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,156,147,136,90,145,90,69,90,73,86,90,152,153,142,151,146,90,158,147,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,136,84,151,147,149,138,150,157,142,157,64,188,145,136,157,167,157,136,140,157,136,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,142,153,135,143,84,139,153,145,142,82,149,145,151,136,147,190,157,150,153,129,81,112,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,90,90,90,90,157,148,158,81,112,90,90,90,90,157,148,158,112,112,90,90,90,90,150,147,151,153,150,90,156,141,148,151,142,145,147,148,90,135,142,153,136,142,185,141,142,147,188,145,135,146,82,81,112,90,90,90,90,90,90,90,90,145,156,90,153,141,142,147,188,145,135,146,182,147,147,138,90,142,146,157,148,90,142,153,135,143,84,151,153,148,151,157,150,82,153,141,142,147,188,145,135,146,182,147,147,138,81,90,157,148,158,112,90,90,90,90,90,90,90,90,188,141,148,151,185,141,142,147,188,145,135,146,84,153,141,142,147,156,145,135,146,90,69,90,142,136,141,157,112,90,90,90,90,90,90,90,90,153,141,142,147,188,145,135,146,182,147,147,138,90,69,90,142,153,135,143,84,135,138,153,139,148,82,156,141,148,151,142,145,147,148,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,139,146,145,150,157,90,188,141,148,151,185,141,142,147,188,145,135,146,84,153,141,142,147,156,145,135,146,90,158,147,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,142,153,135,143,84,139,153,145,142,82,188,141,148,151,185,141,142,147,188,145,135,146,84,138,136,157,168,157,151,153,135,142,190,157,150,153,129,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,136,157,151,153,135,142,184,157,156,147,136,157,184,145,142,157,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,136,157,157,150,180,147,139,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,142,153,135,143,84,139,153,145,142,82,188,141,148,151,185,141,142,147,188,145,135,146,84,152,145,142,157,190,157,150,153,129,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,136,157,157,150,180,147,139,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,90,90,90,90,157,148,158,81,112,90,90,90,90,157,148,158,112,112,90,90,90,90,150,147,151,153,150,90,156,141,148,151,142,145,147,148,90,135,142,147,138,185,141,142,147,188,145,135,146,82,81,112,90,90,90,90,90,90,90,90,188,141,148,151,185,141,142,147,188,145,135,146,84,153,141,142,147,156,145,135,146,90,69,90,156,153,150,135,157,112,90,90,90,90,90,90,90,90,145,156,90,153,141,142,147,188,145,135,146,182,147,147,138,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,142,153,135,143,84,151,153,148,151,157,150,82,153,141,142,147,188,145,135,146,182,147,147,138,81,112,90,90,90,90,90,90,90,90,90,90,90,90,153,141,142,147,188,145,135,146,182,147,147,138,90,69,90,148,145,150,112,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,157,148,158,112,112,90,90,90,90,181,153,145,148,174,153,152,64,167,157,151,142,145,147,148,82,127,112,90,90,90,90,90,90,90,90,174,145,142,150,157,90,69,90,88,184,150,153,142,153,148,142,90,188,145,135,146,145,148,155,88,86,112,90,90,90,90,90,90,90,90,174,157,130,142,167,145,128,157,90,69,90,72,74,86,112,90,90,90,90,133,81,112,112,90,90,90,90,181,153,145,148,174,153,152,64,174,147,155,155,150,157,82,127,112,90,90,90,90,90,90,90,90,174,145,142,150,157,90,69,90,88,184,150,153,142,153,148,142,90,188,145,135,146,88,86,112,90,90,90,90,90,90,90,90,183,153,150,150,152,153,151,143,90,69,90,156,141,148,151,142,145,147,148,82,140,153,150,141,157,81,112,90,90,90,90,90,90,90,90,90,90,90,90,142,153,135,143,84,139,153,145,142,82,74,84,72,81,112,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,136,90,69,90,155,157,142,188,145,135,146,145,148,155,168,157,149,147,142,157,135,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,136,84,157,137,141,145,138,64,188,145,136,157,167,157,136,140,157,136,82,73,81,112,90,90,90,90,90,90,90,90,90,90,90,90,145,156,90,140,153,150,141,157,90,142,146,157,148,90,135,142,153,136,142,185,141,142,147,188,145,135,146,82,81,90,157,150,135,157,90,135,142,147,138,185,141,142,147,188,145,135,146,82,81,90,157,148,158,112,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,133,81,112,112,112,90,90,90,90,181,153,145,148,174,153,152,64,167,150,145,158,157,136,82,127,112,90,90,90,90,90,90,90,90,174,145,142,150,157,90,69,90,88,190,157,150,153,129,90,184,150,153,142,153,148,142,88,86,112,90,90,90,90,90,90,90,90,167,142,157,138,90,69,90,74,84,74,73,86,112,90,90,90,90,90,90,90,90,172,153,150,141,157,90,69,90,127,90,181,145,148,90,69,90,74,86,90,181,153,130,90,69,90,71,84,74,86,90,190,157,156,153,141,150,142,90,69,90,73,84,77,90,133,86,112,90,90,90,90,90,90,90,90,183,153,150,150,152,153,151,143,90,69,90,156,141,148,151,142,145,147,148,82,140,81,112,90,90,90,90,90,90,90,90,90,90,90,90,188,141,148,151,185,141,142,147,188,145,135,146,84,152,145,142,157,190,157,150,153,129,90,69,90,140,112,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,133,81,112,112,90,90,90,90,85,85,83,83,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,90,90,90,90,85,85,83,83,90,11,227,227,209,90,185,173,174,179,90,167,189,182,182,112,90,90,90,90,85,85,83,83,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,90,90,90,90,85,85,90,167,157,142,90,158,157,156,153,141,150,142,90,158,157,150,153,129,112,90,90,90,90,150,147,151,153,150,90,185,173,174,179,163,167,189,182,182,163,190,189,182,185,161,90,69,90,72,74,74,112,90,90,90,90,150,147,151,153,150,90,150,153,135,142,167,157,150,150,90,69,90,147,135,84,142,145,149,157,82,81,112,90,90,90,90,150,147,151,153,150,90,153,141,142,147,167,157,150,150,167,142,153,142,157,90,69,90,156,153,150,135,157,112,112,90,90,90,90,85,85,90,177,148,138,141,142,90,152,147,130,90,152,141,153,142,90,141,152,153,146,90,158,157,150,153,129,112,90,90,90,90,185,141,142,147,174,153,152,64,177,148,138,141,142,82,127,112,90,90,90,90,90,90,90,90,174,145,142,150,157,90,69,90,88,185,141,142,147,90,167,157,150,150,90,190,157,150,153,129,88,86,112,90,90,90,90,90,90,90,90,190,157,135,151,90,69,90,88,135,157,151,147,148,158,135,88,86,112,90,90,90,90,90,90,90,90,170,150,153,151,157,146,147,150,158,157,136,90,69,90,142,147,135,142,136,145,148,155,82,185,173,174,179,163,167,189,182,182,163,190,189,182,185,161,81,86,112,90,90,90,90,90,90,90,90,190,157,156,153,141,150,142,90,69,90,142,147,135,142,136,145,148,155,82,185,173,174,179,163,167,189,182,182,163,190,189,182,185,161,81,86,112,90,90,90,90,90,90,90,90,180,141,149,157,136,145,151,90,69,90,142,136,141,157,86,112,90,90,90,90,90,90,90,90,183,153,150,150,152,153,151,143,90,69,90,156,141,148,151,142,145,147,148,82,140,153,150,141,157,81,112,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,148,141,149,90,69,90,142,147,148,141,149,152,157,136,82,140,153,150,141,157,81,112,90,90,90,90,90,90,90,90,90,90,90,90,145,156,90,148,141,149,90,153,148,158,90,148,141,149,90,68,69,90,77,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,185,173,174,179,163,167,189,182,182,163,190,189,182,185,161,90,69,90,148,141,149,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,171,145,148,158,173,177,64,180,147,142,145,156,129,82,127,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,174,145,142,150,157,90,69,90,88,185,141,142,147,90,167,157,150,150,90,190,157,150,153,129,88,86,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,183,147,148,142,157,148,142,90,69,90,88,190,157,150,153,129,90,135,157,142,90,142,147,90,88,90,84,84,90,148,141,149,90,84,84,90,88,90,135,157,151,147,148,158,135,88,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,133,81,112,90,90,90,90,90,90,90,90,90,90,90,90,157,150,135,157,145,156,90,148,141,149,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,85,85,90,144,153,148,155,153,148,90,143,145,136,145,149,90,148,147,142,145,156,90,88,145,148,140,153,150,145,158,88,90,139,153,143,142,141,90,138,157,136,142,153,149,153,90,143,153,150,145,90,150,147,153,158,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,171,145,148,158,173,177,64,180,147,142,145,156,129,82,127,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,174,145,142,150,157,90,69,90,88,177,148,140,153,150,145,158,90,177,148,138,141,142,88,86,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,183,147,148,142,157,148,142,90,69,90,88,181,153,135,141,143,143,153,148,90,153,148,155,143,153,90,149,145,148,145,149,153,150,90,77,90,158,157,142,145,143,89,88,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,133,81,112,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,133,81,112,112,90,90,90,90,85,85,90,174,147,155,155,150,157,90,185,141,142,147,90,167,157,150,150,112,90,90,90,90,185,141,142,147,174,153,152,64,174,147,155,155,150,157,82,127,112,90,90,90,90,90,90,90,90,174,145,142,150,157,90,69,90,88,185,141,142,147,90,167,157,150,150,88,86,112,90,90,90,90,90,90,90,90,177,151,147,148,90,69,90,88,151,147,145,148,135,88,86,112,90,90,90,90,90,90,90,90,183,153,150,150,152,153,151,143,90,69,90,156,141,148,151,142,145,147,148,82,140,153,150,141,157,81,112,90,90,90,90,90,90,90,90,90,90,90,90,153,141,142,147,167,157,150,150,167,142,153,142,157,90,69,90,140,153,150,141,157,112,90,90,90,90,90,90,90,90,90,90,90,90,145,156,90,140,153,150,141,157,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,171,145,148,158,173,177,64,180,147,142,145,156,129,82,127,90,174,145,142,150,157,90,69,90,88,185,141,142,147,90,167,157,150,150,88,86,90,183,147,148,142,157,148,142,90,69,90,88,167,142,153,136,142,157,158,90,185,141,142,147,90,167,157,150,150,145,148,155,88,90,133,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,142,153,135,143,84,135,138,153,139,148,82,156,141,148,151,142,145,147,148,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,139,146,145,150,157,90,153,141,142,147,167,157,150,150,167,142,153,142,157,90,158,147,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,138,151,153,150,150,82,156,141,148,151,142,145,147,148,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,148,157,142,90,69,90,155,157,142,180,157,142,188,147,150,158,157,136,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,135,157,150,150,188,141,148,151,90,69,90,148,157,142,90,153,148,158,90,148,157,142,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,168,188,83,167,157,150,150,185,150,150,177,142,157,149,135,88,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,145,156,90,135,157,150,150,188,141,148,151,90,153,148,158,90,147,135,84,142,145,149,157,82,81,90,85,90,150,153,135,142,167,157,150,150,90,68,69,90,185,173,174,179,163,167,189,182,182,163,190,189,182,185,161,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,135,157,150,150,188,141,148,151,64,177,148,140,147,143,157,167,157,136,140,157,136,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,150,153,135,142,167,157,150,150,90,69,90,147,135,84,142,145,149,157,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,142,153,135,143,84,139,153,145,142,82,73,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,81,112,90,90,90,90,90,90,90,90,90,90,90,90,157,150,135,157,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,171,145,148,158,173,177,64,180,147,142,145,156,129,82,127,90,174,145,142,150,157,90,69,90,88,185,141,142,147,90,167,157,150,150,88,86,90,183,147,148,142,157,148,142,90,69,90,88,167,142,147,138,138,157,158,90,185,141,142,147,90,167,157,150,150,145,148,155,88,90,133,81,112,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,133,81,112,112,90,90,90,90,185,141,142,147,174,153,152,64,190,145,140,145,158,157,136,82,81,112,90,90,90,90,181,153,145,148,174,153,152,64,184,141,142,142,147,148,82,127,112,90,90,90,90,90,90,90,90,174,145,142,150,157,90,69,90,88,168,157,135,138,153,139,148,90,177,148,90,170,150,153,151,157,88,86,112,90,90,90,90,90,90,90,90,177,151,147,148,90,69,90,88,136,157,156,136,157,135,146,85,151,139,88,86,112,90,90,90,90,90,90,90,90,183,153,150,150,152,153,151,143,90,69,90,156,141,148,151,142,145,147,148,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,170,150,153,129,157,136,135,90,69,90,155,153,149,157,64,187,157,142,167,157,136,140,145,151,157,82,88,170,150,153,129,157,136,135,88,81,112,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,138,150,153,129,157,136,90,69,90,170,150,153,129,157,136,135,84,182,147,151,153,150,170,150,153,129,157,136,112,112,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,151,146,153,136,90,69,90,138,150,153,129,157,136,84,183,146,153,136,153,151,142,157,136,90,147,136,90,138,150,153,129,157,136,84,183,146,153,136,153,151,142,157,136,185,158,158,157,158,64,171,153,145,142,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,146,136,138,90,69,90,151,146,153,136,64,171,153,145,142,188,147,136,183,146,145,150,158,82,88,178,141,149,153,148,147,145,158,168,147,147,142,170,153,136,142,88,81,112,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,146,141,149,153,148,147,145,158,90,69,90,151,146,153,136,64,171,153,145,142,188,147,136,183,146,145,150,158,82,88,178,141,149,153,148,147,145,158,88,81,112,112,90,90,90,90,90,90,90,90,90,90,90,90,85,85,90,135,145,149,138,153,148,90,138,147,135,145,135,145,90,135,157,143,153,136,153,148,155,112,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,135,153,140,157,158,183,188,136,153,149,157,90,69,90,146,136,138,84,183,188,136,153,149,157,112,112,90,90,90,90,90,90,90,90,90,90,90,90,85,85,90,136,157,135,157,142,90,151,146,153,136,153,151,142,157,136,112,90,90,90,90,90,90,90,90,90,90,90,90,146,141,149,153,148,147,145,158,84,178,157,153,150,142,146,90,69,90,74,112,112,90,90,90,90,90,90,90,90,90,90,90,90,85,85,90,142,141,148,155,155,141,90,136,157,135,138,153,139,148,112,90,90,90,90,90,90,90,90,90,90,90,90,138,150,153,129,157,136,84,183,146,153,136,153,151,142,157,136,185,158,158,157,158,64,171,153,145,142,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,142,153,135,143,84,139,153,145,142,82,74,84,72,81,112,112,90,90,90,90,90,90,90,90,90,90,90,90,85,85,90,142,157,150,157,138,147,136,142,90,152,153,150,145,143,90,143,157,90,138,147,135,145,135,145,90,135,157,149,141,150,153,112,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,148,157,139,183,146,153,136,90,69,90,138,150,153,129,157,136,84,183,146,153,136,153,151,142,157,136,112,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,148,157,139,178,136,138,90,69,90,148,157,139,183,146,153,136,64,171,153,145,142,188,147,136,183,146,145,150,158,82,88,178,141,149,153,148,147,145,158,168,147,147,142,170,153,136,142,88,81,112,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,136,90,69,90,155,157,142,188,145,135,146,145,148,155,168,157,149,147,142,157,135,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,136,84,157,137,141,145,138,64,188,145,136,157,167,157,136,140,157,136,82,73,81,112,112,90,90,90,90,90,90,90,90,90,90,90,90,148,157,139,178,136,138,84,183,188,136,153,149,157,90,69,90,135,153,140,157,158,183,188,136,153,149,157,112,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,133,81,112,112,90,90,90,90,181,153,145,148,174,153,152,64,174,147,155,155,150,157,82,127,112,90,90,90,90,90,90,90,90,174,145,142,150,157,90,69,90,88,188,170,167,90,184,179,179,167,174,90,173,182,174,168,185,88,86,112,90,90,90,90,90,90,90,90,177,151,147,148,90,69,90,88,128,153,138,88,86,112,90,90,90,90,90,90,90,90,190,157,156,153,141,150,142,90,69,90,156,153,150,135,157,86,112,90,90,90,90,90,90,90,90,183,153,150,150,152,153,151,143,90,69,90,156,141,148,151,142,145,147,148,82,135,142,153,142,157,81,112,112,90,90,90,90,90,90,90,90,90,90,90,90,145,156,90,135,142,153,142,157,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,171,145,148,158,173,177,64,180,147,142,145,156,129,82,127,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,174,145,142,150,157,90,69,90,88,188,170,167,90,184,179,179,167,174,88,86,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,183,147,148,142,157,148,142,90,69,90,88,173,182,174,168,185,90,181,179,190,189,90,185,175,174,177,188,90,82,185,180,177,181,185,167,177,90,185,181,185,180,81,88,86,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,190,141,136,153,142,145,147,148,90,69,90,71,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,133,81,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,142,153,135,143,84,135,138,153,139,148,82,156,141,148,151,142,145,147,148,82,81,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,170,150,153,129,157,136,135,90,69,90,155,153,149,157,64,187,157,142,167,157,136,140,145,151,157,82,88,170,150,153,129,157,136,135,88,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,182,145,155,146,142,145,148,155,90,69,90,155,153,149,157,64,187,157,142,167,157,136,140,145,151,157,82,88,182,145,155,146,142,145,148,155,88,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,174,157,136,136,153,145,148,90,69,90,139,147,136,143,135,138,153,151,157,84,174,157,136,136,153,145,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,168,141,148,167,157,136,140,145,151,157,90,69,90,155,153,149,157,64,187,157,142,167,157,136,140,145,151,157,82,88,168,141,148,167,157,136,140,145,151,157,88,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,135,157,142,146,145,158,158,157,148,138,136,147,138,157,136,142,129,90,69,90,135,157,142,146,145,158,158,157,148,138,136,147,138,157,136,142,129,90,147,136,90,135,157,142,163,146,145,158,158,157,148,163,138,136,147,138,157,136,142,129,90,147,136,90,135,157,142,163,146,145,158,158,157,148,163,138,136,147,138,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,182,147,151,153,150,170,150,153,129,157,136,90,69,90,170,150,153,129,157,136,135,84,182,147,151,153,150,170,150,153,129,157,136,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,170,150,153,129,157,136,187,141,145,90,69,90,182,147,151,153,150,170,150,153,129,157,136,64,171,153,145,142,188,147,136,183,146,145,150,158,82,88,170,150,153,129,157,136,187,141,145,88,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,180,157,141,142,136,153,150,183,147,150,147,136,90,69,90,183,147,150,147,136,71,84,156,136,147,149,168,187,184,82,73,78,74,86,73,78,74,86,73,78,74,81,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,85,85,90,187,168,185,170,178,177,183,90,182,179,171,90,167,189,174,174,177,180,187,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,138,151,153,150,150,82,156,141,148,151,142,145,147,148,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,145,156,90,142,129,138,157,147,156,82,135,157,142,142,145,148,155,135,81,90,69,69,90,88,156,141,148,151,142,145,147,148,88,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,168,157,148,158,157,136,167,157,142,142,145,148,155,135,90,69,90,135,157,142,142,145,148,155,135,82,81,64,187,157,142,167,157,136,140,145,151,157,82,88,168,157,148,158,157,136,167,157,142,142,145,148,155,135,88,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,173,135,157,136,187,153,149,157,167,157,142,142,145,148,155,135,90,69,90,173,135,157,136,167,157,142,142,145,148,155,135,82,81,64,187,157,142,167,157,136,140,145,151,157,82,88,173,135,157,136,187,153,149,157,167,157,142,142,145,148,155,135,88,81,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,168,157,148,158,157,136,167,157,142,142,145,148,155,135,84,169,141,153,150,145,142,129,182,157,140,157,150,90,69,90,189,148,141,149,84,169,141,153,150,145,142,129,182,157,140,157,150,84,182,157,140,157,150,74,73,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,168,157,148,158,157,136,167,157,142,142,145,148,155,135,84,181,157,135,146,170,153,136,142,190,157,142,153,145,150,182,157,140,157,150,90,69,90,189,148,141,149,84,181,157,135,146,170,153,136,142,190,157,142,153,145,150,182,157,140,157,150,84,182,157,140,157,150,74,73,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,173,135,157,136,187,153,149,157,167,157,142,142,145,148,155,135,84,167,153,140,157,158,169,141,153,150,145,142,129,182,157,140,157,150,90,69,90,189,148,141,149,84,167,153,140,157,158,169,141,153,150,145,142,129,167,157,142,142,145,148,155,84,169,141,153,150,145,142,129,182,157,140,157,150,73,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,81,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,85,85,90,182,177,187,178,174,177,180,187,90,179,170,174,177,181,177,160,189,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,182,145,155,146,142,145,148,155,84,187,150,147,152,153,150,167,146,153,158,147,139,135,90,69,90,156,153,150,135,157,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,182,145,155,146,142,145,148,155,84,188,147,155,189,148,158,90,69,90,73,157,65,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,182,145,155,146,142,145,148,155,84,184,136,145,155,146,142,148,157,135,135,90,69,90,74,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,138,151,153,150,150,82,156,141,148,151,142,145,147,148,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,145,156,90,135,157,142,146,145,158,158,157,148,138,136,147,138,157,136,142,129,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,135,157,142,146,145,158,158,157,148,138,136,147,138,157,136,142,129,82,182,145,155,146,142,145,148,155,86,90,88,174,157,151,146,148,147,150,147,155,129,88,86,90,189,148,141,149,84,174,157,151,146,148,147,150,147,155,129,84,183,147,149,138,153,142,145,152,145,150,145,142,129,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,81,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,85,85,90,174,189,168,168,185,177,180,90,179,170,174,177,181,177,160,189,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,174,157,136,136,153,145,148,84,171,153,142,157,136,171,153,140,157,167,145,128,157,90,69,90,74,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,174,157,136,136,153,145,148,84,171,153,142,157,136,171,153,140,157,167,138,157,157,158,90,69,90,74,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,174,157,136,136,153,145,148,84,171,153,142,157,136,168,157,156,150,157,151,142,153,148,151,157,90,69,90,74,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,174,157,136,136,153,145,148,84,171,153,142,157,136,174,136,153,148,135,138,153,136,157,148,151,129,90,69,90,74,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,138,151,153,150,150,82,156,141,148,151,142,145,147,148,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,145,156,90,135,157,142,146,145,158,158,157,148,138,136,147,138,157,136,142,129,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,135,157,142,146,145,158,158,157,148,138,136,147,138,157,136,142,129,82,174,157,136,136,153,145,148,86,90,88,190,157,151,147,136,153,142,145,147,148,88,86,90,156,153,150,135,157,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,81,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,85,85,90,178,185,170,173,167,90,167,175,161,90,92,90,185,174,181,179,167,170,178,189,168,189,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,156,147,136,90,163,86,90,140,90,145,148,90,145,138,153,145,136,135,82,182,145,155,146,142,145,148,155,64,187,157,142,183,146,145,150,158,136,157,148,82,81,81,90,158,147,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,145,156,90,140,64,177,135,185,82,88,167,143,129,88,81,90,147,136,90,140,64,177,135,185,82,88,185,142,149,147,135,138,146,157,136,157,88,81,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,140,64,190,157,135,142,136,147,129,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,85,85,90,184,189,168,167,177,178,90,183,178,185,168,185,183,174,189,168,90,82,174,185,180,170,185,90,181,185,174,177,175,185,180,90,185,180,177,181,185,167,177,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,150,147,151,153,150,90,156,141,148,151,142,145,147,148,90,183,150,157,153,148,183,146,153,136,153,151,142,157,136,82,151,146,153,136,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,156,147,136,90,163,86,90,140,90,145,148,90,145,138,153,145,136,135,82,151,146,153,136,64,187,157,142,183,146,145,150,158,136,157,148,82,81,81,90,158,147,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,145,156,90,140,64,177,135,185,82,88,185,151,151,157,135,135,147,136,129,88,81,90,147,136,90,140,64,177,135,185,82,88,178,153,142,88,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,136,90,140,64,177,135,185,82,88,167,146,145,136,142,88,81,90,147,136,90,140,64,177,135,185,82,88,170,153,148,142,135,88,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,136,90,140,64,177,135,185,82,88,184,147,158,129,183,147,150,147,136,135,88,81,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,140,64,190,157,135,142,136,147,129,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,85,85,90,183,179,168,189,90,183,182,189,185,180,90,181,185,170,90,82,174,185,180,170,185,90,183,179,180,174,177,180,173,189,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,156,147,136,90,163,86,90,147,152,144,90,145,148,90,145,138,153,145,136,135,82,155,153,149,157,64,187,157,142,190,157,135,151,157,148,158,153,148,142,135,82,81,81,90,158,147,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,145,156,90,148,147,142,90,147,152,144,64,177,135,190,157,135,151,157,148,158,153,148,142,179,156,82,170,150,153,129,157,136,187,141,145,81,90,142,146,157,148,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,145,156,90,147,152,144,64,177,135,185,82,88,184,153,135,157,170,153,136,142,88,81,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,152,144,84,181,153,142,157,136,145,153,150,90,69,90,189,148,141,149,84,181,153,142,157,136,145,153,150,84,167,149,147,147,142,146,170,150,153,135,142,145,151,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,152,144,84,183,147,150,147,136,90,69,90,180,157,141,142,136,153,150,183,147,150,147,136,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,152,144,84,168,157,156,150,157,151,142,153,148,151,157,90,69,90,74,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,152,144,84,183,153,135,142,167,146,153,158,147,139,90,69,90,156,153,150,135,157,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,152,144,84,183,153,148,169,141,157,136,129,90,69,90,156,153,150,135,157,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,152,144,84,183,153,148,174,147,141,151,146,90,69,90,156,153,150,135,157,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,150,135,157,145,156,90,147,152,144,64,177,135,185,82,88,190,157,151,153,150,88,81,90,147,136,90,147,152,144,64,177,135,185,82,88,174,157,130,142,141,136,157,88,81,90,147,136,90,147,152,144,64,177,135,185,82,88,167,141,136,156,153,151,157,185,138,138,157,153,136,153,148,151,157,88,81,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,152,144,64,190,157,135,142,136,147,129,82,81,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,150,135,157,145,156,90,147,152,144,64,177,135,185,82,88,170,153,136,142,145,151,150,157,189,149,145,142,142,157,136,88,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,136,90,147,152,144,64,177,135,185,82,88,174,136,153,145,150,88,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,136,90,147,152,144,64,177,135,185,82,88,188,145,136,157,88,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,136,90,147,152,144,64,177,135,185,82,88,167,149,147,143,157,88,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,136,90,147,152,144,64,177,135,185,82,88,167,138,153,136,143,150,157,135,88,81,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,152,144,84,189,148,153,152,150,157,158,90,69,90,156,153,150,135,157,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,150,135,157,145,156,90,147,152,144,64,177,135,185,82,88,184,150,147,147,149,189,156,156,157,151,142,88,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,136,90,147,152,144,64,177,135,185,82,88,184,150,141,136,189,156,156,157,151,142,88,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,136,90,147,152,144,64,177,135,185,82,88,190,157,138,142,146,179,156,188,145,157,150,158,189,156,156,157,151,142,88,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,136,90,147,152,144,64,177,135,185,82,88,167,141,148,168,153,129,135,189,156,156,157,151,142,88,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,136,90,147,152,144,64,177,135,185,82,88,183,147,150,147,136,183,147,136,136,157,151,142,145,147,148,189,156,156,157,151,142,88,81,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,152,144,84,189,148,153,152,150,157,158,90,69,90,156,153,150,135,157,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,150,135,157,145,156,90,147,152,144,64,177,135,185,82,88,181,157,135,146,170,153,136,142,88,81,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,152,144,84,174,157,130,142,141,136,157,177,190,90,69,90,88,88,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,150,135,157,145,156,90,147,152,144,64,177,135,185,82,88,167,138,157,151,145,153,150,181,157,135,146,88,81,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,152,144,84,181,157,135,146,177,158,90,69,90,88,88,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,152,144,84,174,157,130,142,141,136,157,177,158,90,69,90,88,88,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,85,85,90,170,182,185,161,189,168,90,92,90,180,170,183,90,183,182,189,185,180,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,145,156,90,182,147,151,153,150,170,150,153,129,157,136,84,183,146,153,136,153,151,142,157,136,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,183,150,157,153,148,183,146,153,136,153,151,142,157,136,82,182,147,151,153,150,170,150,153,129,157,136,84,183,146,153,136,153,151,142,157,136,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,182,147,151,153,150,170,150,153,129,157,136,84,183,146,153,136,153,151,142,157,136,185,158,158,157,158,64,183,147,148,148,157,151,142,82,183,150,157,153,148,183,146,153,136,153,151,142,157,136,81,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,156,147,136,90,163,86,90,149,147,158,157,150,90,145,148,90,145,138,153,145,136,135,82,139,147,136,143,135,138,153,151,157,64,187,157,142,190,157,135,151,157,148,158,153,148,142,135,82,81,81,90,158,147,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,145,156,90,149,147,158,157,150,64,177,135,185,82,88,181,147,158,157,150,88,81,90,153,148,158,90,149,147,158,157,150,64,188,145,148,158,188,145,136,135,142,183,146,145,150,158,82,88,178,141,149,153,148,147,145,158,88,81,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,183,150,157,153,148,183,146,153,136,153,151,142,157,136,82,149,147,158,157,150,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,85,85,90,185,173,174,179,90,183,182,189,185,180,90,179,184,176,189,175,90,184,185,168,173,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,139,147,136,143,135,138,153,151,157,84,190,157,135,151,157,148,158,153,148,142,185,158,158,157,158,64,183,147,148,148,157,151,142,82,156,141,148,151,142,145,147,148,82,147,152,144,81,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,145,156,90,147,152,144,64,177,135,185,82,88,190,157,151,153,150,88,81,90,147,136,90,147,152,144,64,177,135,185,82,88,174,157,130,142,141,136,157,88,81,90,147,136,90,147,152,144,64,177,135,185,82,88,167,141,136,156,153,151,157,185,138,138,157,153,136,153,148,151,157,88,81,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,152,144,64,190,157,135,142,136,147,129,82,81,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,150,135,157,145,156,90,147,152,144,64,177,135,185,82,88,170,153,136,142,145,151,150,157,189,149,145,142,142,157,136,88,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,136,90,147,152,144,64,177,135,185,82,88,174,136,153,145,150,88,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,136,90,147,152,144,64,177,135,185,82,88,188,145,136,157,88,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,136,90,147,152,144,64,177,135,185,82,88,167,149,147,143,157,88,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,136,90,147,152,144,64,177,135,185,82,88,167,138,153,136,143,150,157,135,88,81,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,152,144,84,189,148,153,152,150,157,158,90,69,90,156,153,150,135,157,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,150,135,157,145,156,90,147,152,144,64,177,135,185,82,88,181,157,135,146,170,153,136,142,88,81,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,152,144,84,174,157,130,142,141,136,157,177,190,90,69,90,88,88,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,150,135,157,145,156,90,147,152,144,64,177,135,185,82,88,167,138,157,151,145,153,150,181,157,135,146,88,81,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,152,144,84,181,157,135,146,177,158,90,69,90,88,88,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,147,152,144,84,174,157,130,142,141,136,157,177,158,90,69,90,88,88,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,81,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,138,151,153,150,150,82,156,141,148,151,142,145,147,148,82,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,139,147,136,143,135,138,153,151,157,84,182,157,140,157,150,179,156,190,157,142,153,145,150,90,69,90,189,148,141,149,84,181,147,158,157,150,182,157,140,157,150,179,156,190,157,142,153,145,150,84,190,145,135,153,152,150,157,158,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,81,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,168,141,148,167,157,136,140,145,151,157,64,167,157,142,71,158,168,157,148,158,157,136,145,148,155,189,148,153,152,150,157,158,82,142,136,141,157,81,112,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,81,112,112,90,90,90,90,90,90,90,90,90,90,90,90,157,150,135,157,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,171,145,148,158,173,177,64,180,147,142,145,156,129,82,127,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,174,145,142,150,157,90,69,90,88,188,170,167,90,184,179,179,167,174,88,86,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,183,147,148,142,157,148,142,90,69,90,88,181,147,158,157,90,179,188,188,90,85,90,168,157,144,147,145,148,90,141,148,142,141,143,90,148,147,136,149,153,150,90,140,145,135,141,153,150,88,86,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,190,141,136,153,142,145,147,148,90,69,90,78,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,133,81,112,90,90,90,90,90,90,90,90,90,90,90,90,157,148,158,112,112,90,90,90,90,90,90,90,90,157,148,158,112,90,90,90,90,133,81,112,112,112,90,90,90,90,85,85,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,90,90,90,90,85,85,90,11,227,238,193,90,185,148,142,145,90,185,188,175,112,90,90,90,90,85,85,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,112,90,90,90,90,181,153,145,148,174,153,152,64,174,147,155,155,150,157,82,127,112,90,90,90,90,90,90,90,90,174,145,142,150,157,90,69,90,88,185,148,142,145,90,185,188,175,88,86,112,90,90,90,90,90,90,90,90,177,151,147,148,90,69,90,88,149,147,147,148,88,86,112,90,90,90,90,90,90,90,90,183,153,150,150,152,153,151,143,90,69,90,156,141,148,151,142,145,147,148,82,140,153,150,141,157,81,112,90,90,90,90,90,90,90,90,90,90,90,90,145,156,90,140,153,150,141,157,90,142,146,157,148,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,171,145,148,158,173,177,64,180,147,142,145,156,129,82,127,90,174,145,142,150,157,90,69,90,88,185,148,142,145,90,185,188,175,88,86,90,183,147,148,142,157,148,142,90,69,90,88,185,188,175,90,138,136,147,142,157,151,142,145,147,148,90,157,148,153,152,150,157,158,84,88,90,133,81,112,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,150,147,15 [trimmed]  -  Edit
