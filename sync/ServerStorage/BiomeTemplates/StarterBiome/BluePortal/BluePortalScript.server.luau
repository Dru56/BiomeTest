
local BiomeService = require(
	game.ServerScriptService.Services.BiomeService
)

local prompt = script.Parent.ProximityPrompt

prompt.Triggered:Connect(function(player)
	BiomeService.LoadBiome(player, "BlueBiome")
end)