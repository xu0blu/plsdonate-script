
local popup = require(game.ReplicatedStorage.popup)
local event = Instance.new("Script")
event.Enabled = false
event.Parent = game.StarterGui
event.Name = "PLS-DONATE"
event.Source = [[game.ReplicatedStorage.VFXObjects.CreateVfx:FireAllClients("GiveCurrency", game.workspace.ExclusiveBoothsPart, game.Players.LocalPlayer, 10000)]]

-- MAIN --
popup("donation","HAZEM DONATED 10,000 TO YOU!")
game.Players.LocalPlayer.leaderstats.Raised.Value += 10000
game.Players.LocalPlayer.leaderstats.Donated.Value += 10000000
game.Players.LocalPlayer:SetAttribute("Raised",10000)
game.Players.LocalPlayer:SetAttribute("Donated",10000000)

-- VFX --
event.Enabled = true

print("launched script PLS DONATE")

game.StarterGui:SetCore("ChatMakeSystemMessage", {
		Text = "[GLOBAL] Global donations have been temporarily disabled, we will try to get them enabled ASAP.";
		Color = Color3.fromRGB(255, 111, 8);
		Font = Enum.Font.GothamBold;
	})
