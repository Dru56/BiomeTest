local ServerStorage = game:GetService("ServerStorage")

local BiomeService = {}

local biomeTemplates = ServerStorage:WaitForChild("BiomeTemplates")
local biomeInstances = workspace:WaitForChild("BiomeInstances")

local instanceCounter = 0
local biomeSpacing = 5000

local sharedBiomes = {}

local function GetOrCreateSharedBiome(biomeName)

	-- Already exists
	if sharedBiomes[biomeName] then
		return sharedBiomes[biomeName]
	end

	local template = biomeTemplates:FindFirstChild(biomeName)

	if not template then
		warn("Biome not found:", biomeName)
		return
	end

	local biome = template:Clone()

	biome.Name = biomeName
	biome.Parent = biomeInstances

	sharedBiomes[biomeName] = biome

	return biome
end


function BiomeService.LoadBiome(player, biomeName)

	local biome = GetOrCreateSharedBiome(biomeName);

	-- Teleport player
	local spawn = biome:FindFirstChild("Spawn")

	if spawn and player.Character then
		player.Character:PivotTo(
			spawn.CFrame + Vector3.new(0, 5, 0)
		)
	end

	return biome
end


return BiomeService