local Players = game:GetService("Players")
local player = Players.LocalPlayer

if player then

    local message = "Join our Discord for new scripts!\nhttps://discord.gg/NsT3RVZeEv"
    
    player:Kick("⚠️ " .. message)
    

    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "RuinzHub Discord",
            Text = "Join our Discord for new scripts!",
            Duration = 5
        })
    end)
end
