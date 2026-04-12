local Room = {}

Room.info = require(game:GetService("ReplicatedStorage").Shared.Services.GenerateRoomsService.RoomInfo)
Room.random = Random.new()

function Room.RandomRoom(prevRoom)
	local totalWeight = 0

	for i, info in pairs(Room.info) do
		totalWeight += info.Weight
	end

	local randomWeight = Room.random:NextInteger(1, totalWeight)
	local CurrentWeight = 0
	local randomRoom = nil

	for i, info in pairs(Room.info) do
		CurrentWeight += info.Weight
		if randomWeight <= CurrentWeight then
			randomRoom = game.ReplicatedStorage.Rooms[i]
			break
		end
	end

	return randomRoom
end

function Room.Generate(prevRoom)
	local RandomRoom = Room.RandomRoom(prevRoom)
	local newRoom = RandomRoom:Clone()

	newRoom.PrimaryPart = newRoom.Entrance
	newRoom:PivotTo(prevRoom.Exit.CFrame)

	newRoom.Parent = workspace.GeneratedRooms

	return newRoom
end

return Room
