local Roomgeneration = require(game:GetService("ReplicatedStorage").Shared.Services.GenerateRoomsService.RoomGeneration)

local prevRoom = workspace.Spawn

for i = 1, 10 do -- The 10 is the total rooms generated
	prevRoom = Roomgeneration.Generate(prevRoom)
end
