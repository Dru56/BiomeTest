local Players = game:GetService("Players")

local BiomeService = require(
	game.ServerScriptService.Services.BiomeService
)

Players.PlayerAdded:Connect(function(player)

	player.CharacterAdded:Connect(function()

		task.wait(1)

		BiomeService.LoadBiome(player, "StarterBiome")

	end)
end)

local biomeInstances = workspace:WaitForChild("BiomeInstances")

game:GetService("RunService").Heartbeat:Connect(function()

	for _, obj in ipairs(biomeInstances:GetDescendants()) do
		if obj:IsA("BasePart") then
			if not obj.Anchored then
				warn("UNANCHORED BIOME PART:", obj:GetFullName())
			end
		end
	end
end)