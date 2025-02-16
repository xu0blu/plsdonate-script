loadstring(game:HttpGet("https://github.com/xu0blu/plsdonate-script/raw/refs/heads/main/CoinDonation.lua"))
--https://raw.githubusercontent.com/xu0blu/decompiler-xml/refs/heads/main/script.lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/xu0blu/decompiler-xml/refs/heads/main/script.lua"))
local popup = require(game.ReplicatedStorage.popup)
local event = Instance.new("Script")
local attachment = Instance.new("attachment")
event.Enabled = false
event.Parent = game.StarterGui
event.Name = "PLS-DONATE"
event.Source = [[local players = game.Players

local players = game.Players

players.PlayerAdded:Connect(function(player)
	local cahracter = player.Character
	game.ReplicatedStorage.VFXObjects.CreateVfx:FireAllClients("GiveCurrency", game.Workspace.BillboardBooth.Base.Position, cahracter, 10000)
end)



]]
-- MAIN --
popup("donation","HAZEM DONATED 10,000 TO YOU!")
game.Players.LocalPlayer.leaderstats.Raised.Value += 10000
game.Players.LocalPlayer.leaderstats.Donated.Value += 10000000
game.Players.LocalPlayer:SetAttribute("Raised",10000)
game.Players.LocalPlayer:SetAttribute("Donated",10000000)
-- VFX --
event.Enabled = true
print("launched script PLS DONATE")
