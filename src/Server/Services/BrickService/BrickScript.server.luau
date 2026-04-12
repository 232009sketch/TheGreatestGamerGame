-- Silly Script for the Brick
local objBrick = game:GetService("Workspace").Brick
local CanRun = true

objBrick.Touched:Connect(function(hit)
	local usrHumanoid = hit.Parent:FindFirstChild("Humanoid")
	if usrHumanoid and CanRun then
		CanRun = false
		print("Brick has found a humanoid!")
		task.wait(1)
		CanRun = true
	end
end)
