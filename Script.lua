
local popup = require(game.ReplicatedStorage.popup)
local event = Instance.new("Script")
event.Enabled = false
event.Parent = game.StarterGui
event.Name = "PLS-DONATE"
event.Source = [[game.ReplicatedStorage.VFXObjects.CreateVfx:FireAllClients("GiveCurrency", game.workspace.ExclusiveBoothsPart, game.Players.LocalPlayer, 10000)]]

-- MAIN --
popup("donation","HAZEM DONATED 10,000 TO YOU!")
game.Players.LocalPlayer.leaderstats.Raised.Value += 10000
game.Players.LocalPlayer:SetAttribute("Raised",10000)

-- VFX --
event.Enabled = true

print("launched script PLS DONATE")
