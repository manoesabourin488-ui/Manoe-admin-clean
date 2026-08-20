--==================================================
-- ⚡ MANOË ADMIN GUI
-- VERSION PROPRE SANS GUNS
-- Mobile + PC
--==================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--==================================================
-- CHARACTER
--==================================================

local function getCharacter()
	return player.Character or player.CharacterAdded:Wait()
end

local function getHumanoid()
	local character = getCharacter()
	return character:FindFirstChildOfClass("Humanoid")
end

local function getRoot()
	local character = getCharacter()
	return character:FindFirstChild("HumanoidRootPart")
end

--==================================================
-- REMOVE OLD GUI
--==================================================

local oldGui = playerGui:FindFirstChild("ManoeAdminOneScript")

if oldGui then
	oldGui:Destroy()
end

--==================================================
-- GUI
--==================================================

local gui = Instance.new("ScreenGui")
gui.Name = "ManoeAdminOneScript"
gui.ResetOnSpawn = false
gui.Parent = playerGui

--------------------------------------------------
-- OPEN BUTTON
--------------------------------------------------

local openButton = Instance.new("TextButton")
openButton.Size = UDim2.fromOffset(55,55)
openButton.Position = UDim2.new(0,15,0.5,-27)
openButton.BackgroundColor3 = Color3.fromRGB(20,20,25)
openButton.Text = "⚡"
openButton.TextSize = 28
openButton.TextColor3 = Color3.new(1,1,1)
openButton.Font = Enum.Font.GothamBold
openButton.Parent = gui

Instance.new("UICorner",openButton).CornerRadius =
	UDim.new(1,0)

--------------------------------------------------
-- MAIN PANEL
--------------------------------------------------

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(390,500)
main.Position = UDim2.new(0.5,-195,0.5,-250)
main.BackgroundColor3 = Color3.fromRGB(18,18,22)
main.BorderSizePixel = 0
main.Visible = false
main.Active = true
main.Draggable = true
main.Parent = gui

Instance.new("UICorner",main).CornerRadius =
	UDim.new(0,15)

--------------------------------------------------
-- TITLE
--------------------------------------------------

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,-60,0,48)
title.Position = UDim2.fromOffset(15,0)
title.BackgroundTransparency = 1
title.Text = "⚡ MANOË ADMIN"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

--------------------------------------------------
-- CLOSE
--------------------------------------------------

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(38,38)
close.Position = UDim2.new(1,-45,0,5)
close.BackgroundColor3 = Color3.fromRGB(170,45,45)
close.Text = "×"
close.TextColor3 = Color3.new(1,1,1)
close.TextSize = 26
close.Font = Enum.Font.GothamBold
close.Parent = main

Instance.new("UICorner",close).CornerRadius =
	UDim.new(0,9)

--------------------------------------------------
-- TARGET PLAYER
--------------------------------------------------

local targetBox = Instance.new("TextBox")
targetBox.Size = UDim2.new(1,-30,0,42)
targetBox.Position = UDim2.fromOffset(15,52)
targetBox.BackgroundColor3 = Color3.fromRGB(32,32,38)
targetBox.Text = ""
targetBox.PlaceholderText = "Nom du joueur pour TP..."
targetBox.TextColor3 = Color3.new(1,1,1)
targetBox.PlaceholderColor3 = Color3.fromRGB(150,150,150)
targetBox.Font = Enum.Font.Gotham
targetBox.TextSize = 15
targetBox.ClearTextOnFocus = false
targetBox.Parent = main

Instance.new("UICorner",targetBox).CornerRadius =
	UDim.new(0,9)

--------------------------------------------------
-- VALUE
--------------------------------------------------

local valueBox = Instance.new("TextBox")
valueBox.Size = UDim2.new(1,-30,0,40)
valueBox.Position = UDim2.fromOffset(15,101)
valueBox.BackgroundColor3 = Color3.fromRGB(32,32,38)
valueBox.Text = ""
valueBox.PlaceholderText = "Valeur Speed / Jump"
valueBox.TextColor3 = Color3.new(1,1,1)
valueBox.PlaceholderColor3 = Color3.fromRGB(150,150,150)
valueBox.Font = Enum.Font.Gotham
valueBox.TextSize = 15
valueBox.ClearTextOnFocus = false
valueBox.Parent = main

Instance.new("UICorner",valueBox).CornerRadius =
	UDim.new(0,9)

--------------------------------------------------
-- STATUS
--------------------------------------------------

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1,-30,0,25)
status.Position = UDim2.fromOffset(15,145)
status.BackgroundTransparency = 1
status.Text = "✅ Prêt"
status.TextColor3 = Color3.fromRGB(180,180,185)
status.Font = Enum.Font.Gotham
status.TextSize = 13
status.TextXAlignment = Enum.TextXAlignment.Left
status.Parent = main

--------------------------------------------------
-- SCROLL
--------------------------------------------------

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1,-30,1,-185)
scroll.Position = UDim2.fromOffset(15,175)
scroll.BackgroundTransparency = 1
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 4
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.CanvasSize = UDim2.new()
scroll.Parent = main

local grid = Instance.new("UIGridLayout")
grid.CellSize = UDim2.new(0.5,-5,0,46)
grid.CellPadding = UDim2.fromOffset(8,8)
grid.Parent = scroll

--------------------------------------------------
-- BUTTON CREATOR
--------------------------------------------------

local function button(text,callback)

	local b = Instance.new("TextButton")

	b.BackgroundColor3 = Color3.fromRGB(42,42,50)
	b.TextColor3 = Color3.new(1,1,1)
	b.Text = text
	b.TextSize = 14
	b.Font = Enum.Font.GothamSemibold
	b.Parent = scroll

	Instance.new("UICorner",b).CornerRadius =
		UDim.new(0,9)

	b.MouseButton1Click:Connect(callback)

	return b
end

--==================================================
-- ⚡ SPEED
--==================================================

button("⚡ Speed",function()

	local amount = tonumber(valueBox.Text) or 50
	amount = math.clamp(amount,0,300)

	local humanoid = getHumanoid()

	if humanoid then
		humanoid.WalkSpeed = amount
		status.Text = "⚡ Speed = "..amount
	end

end)

button("🚶 Normal Speed",function()

	local humanoid = getHumanoid()

	if humanoid then
		humanoid.WalkSpeed = 16
	end

	status.Text = "✅ Speed normal"

end)

--==================================================
-- 🚀 JUMP
--==================================================

button("🚀 Jump",function()

	local amount = tonumber(valueBox.Text) or 100
	amount = math.clamp(amount,0,500)

	local humanoid = getHumanoid()

	if humanoid then

		humanoid.UseJumpPower = true
		humanoid.JumpPower = amount

		status.Text =
			"🚀 Jump = "..amount

	end

end)

button("⬇ Normal Jump",function()

	local humanoid = getHumanoid()

	if humanoid then

		humanoid.UseJumpPower = true
		humanoid.JumpPower = 50

	end

	status.Text = "✅ Jump normal"

end)

--==================================================
-- 🛡 GOD / AUTO HEAL
--==================================================

local godMode = false
local godHealthConnection
local godHeartbeatConnection
local godButton

local GOD_HEALTH = 1000000000

local function disconnectGod()

	if godHealthConnection then
		godHealthConnection:Disconnect()
		godHealthConnection = nil
	end

	if godHeartbeatConnection then
		godHeartbeatConnection:Disconnect()
		godHeartbeatConnection = nil
	end

end

local function applyGod(character)

	disconnectGod()

	local humanoid =
		character:FindFirstChildOfClass("Humanoid")

	if not humanoid then
		return
	end

	if humanoid:GetAttribute("ManoeOriginalHealth") == nil then

		humanoid:SetAttribute(
			"ManoeOriginalHealth",
			humanoid.MaxHealth
		)

	end

	pcall(function()

		humanoid:SetStateEnabled(
			Enum.HumanoidStateType.Dead,
			false
		)

	end)

	humanoid.BreakJointsOnDeath = false
	humanoid.MaxHealth = GOD_HEALTH
	humanoid.Health = GOD_HEALTH

	godHealthConnection =
		humanoid.HealthChanged:Connect(function(health)

			if godMode and health < GOD_HEALTH then
				humanoid.Health = GOD_HEALTH
			end

		end)

	godHeartbeatConnection =
		RunService.Heartbeat:Connect(function()

			if not godMode then
				return
			end

			if not humanoid.Parent then
				return
			end

			if humanoid.MaxHealth ~= GOD_HEALTH then
				humanoid.MaxHealth = GOD_HEALTH
			end

			if humanoid.Health < GOD_HEALTH then
				humanoid.Health = GOD_HEALTH
			end

		end)

end

local function disableGod()

	godMode = false
	disconnectGod()

	local humanoid = getHumanoid()

	if humanoid then

		pcall(function()

			humanoid:SetStateEnabled(
				Enum.HumanoidStateType.Dead,
				true
			)

		end)

		humanoid.BreakJointsOnDeath = true

		local original =
			humanoid:GetAttribute(
				"ManoeOriginalHealth"
			) or 100

		humanoid.MaxHealth = original
		humanoid.Health = original

	end

end

godButton =
	button("🛡 God: OFF",function()

		godMode = not godMode

		if godMode then

			godButton.Text = "🛡 God: ON"
			status.Text = "🛡 God + Auto Heal ON"

			applyGod(getCharacter())

		else

			godButton.Text = "🛡 God: OFF"
			status.Text = "🛡 God OFF"

			disableGod()

		end

	end)

--------------------------------------------------
-- ❤️ HEAL
--------------------------------------------------

button("❤️ Heal",function()

	local humanoid = getHumanoid()

	if humanoid then
		humanoid.Health = humanoid.MaxHealth
	end

	status.Text = "❤️ Heal"

end)

--==================================================
-- 🧱 PHASE
--==================================================

local phase = false
local phaseButton

local DETECT_DISTANCE = 5
local MAX_WALL_DEPTH = 150
local EXIT_CLEARANCE = 5
local PHASE_COOLDOWN = 0.25

local lastPhase = 0

local function createRayParams(character)

	local params = RaycastParams.new()

	params.FilterType =
		Enum.RaycastFilterType.Exclude

	params.FilterDescendantsInstances =
		{character}

	params.IgnoreWater = false
	params.RespectCanCollide = true

	return params

end

local function findWall(
	character,
	root,
	direction
)

	local params =
		createRayParams(character)

	local heights =
		{-2,-1,0,1,2}

	for _,height in ipairs(heights) do

		local origin =
			root.Position
			+
			Vector3.new(0,height,0)

		local hit =
			workspace:Raycast(
				origin,
				direction * DETECT_DISTANCE,
				params
			)

		if hit then
			return hit,origin
		end

	end

	return nil,nil

end

local function findWallExit(
	frontHit,
	origin,
	direction
)

	local wall = frontHit.Instance

	if not wall then
		return nil
	end

	local params =
		RaycastParams.new()

	params.FilterType =
		Enum.RaycastFilterType.Include

	params.FilterDescendantsInstances =
		{wall}

	params.IgnoreWater = false

	local farPosition =
		origin
		+
		direction * MAX_WALL_DEPTH

	local reverseHit =
		workspace:Raycast(
			farPosition,
			-direction * MAX_WALL_DEPTH,
			params
		)

	if reverseHit then

		return
			reverseHit.Position
			+
			direction * EXIT_CLEARANCE

	end

	if wall:IsA("BasePart") then

		local localDirection =
			wall.CFrame:
			VectorToObjectSpace(direction)

		local halfThickness =
			math.abs(localDirection.X)
				* wall.Size.X / 2
			+
			math.abs(localDirection.Y)
				* wall.Size.Y / 2
			+
			math.abs(localDirection.Z)
				* wall.Size.Z / 2

		local centerDistance =
			(wall.Position - origin):
			Dot(direction)

		local distance =
			centerDistance
			+
			halfThickness
			+
			EXIT_CLEARANCE

		if distance > 0
			and distance < MAX_WALL_DEPTH
		then

			return
				origin
				+
				direction * distance

		end

	end

	return nil

end

phaseButton =
	button("🧱 Phase: OFF",function()

		phase = not phase

		if phase then

			phaseButton.Text =
				"🧱 Phase: ON"

			status.Text =
				"🧱 Marche contre un mur"

		else

			phaseButton.Text =
				"🧱 Phase: OFF"

			status.Text =
				"✅ Phase OFF"

		end

	end)

RunService.Heartbeat:Connect(function()

	if not phase then
		return
	end

	if os.clock() - lastPhase < PHASE_COOLDOWN then
		return
	end

	local character = player.Character

	if not character then
		return
	end

	local humanoid =
		character:FindFirstChildOfClass("Humanoid")

	local root =
		character:FindFirstChild("HumanoidRootPart")

	if not humanoid or not root then
		return
	end

	local direction =
		humanoid.MoveDirection

	direction =
		Vector3.new(
			direction.X,
			0,
			direction.Z
		)

	if direction.Magnitude < 0.05 then
		return
	end

	direction = direction.Unit

	local hit,origin =
		findWall(
			character,
			root,
			direction
		)

	if not hit then
		return
	end

	local model =
		hit.Instance:
		FindFirstAncestorOfClass("Model")

	if model
		and model:
		FindFirstChildOfClass("Humanoid")
	then
		return
	end

	local exit =
		findWallExit(
			hit,
			origin,
			direction
		)

	if not exit then

		status.Text =
			"⚠️ Sortie introuvable"

		return

	end

	lastPhase = os.clock()

	character:PivotTo(
		character:GetPivot()
		+
		(exit - root.Position)
	)

	root =
		character:
		FindFirstChild("HumanoidRootPart")

	if root then

		root.AssemblyLinearVelocity =
			Vector3.zero

		root.AssemblyAngularVelocity =
			Vector3.zero

	end

	status.Text =
		"🧱 Mur traversé"

end)

--==================================================
-- 🫥 INVISIBLE / VISIBLE
--==================================================

button("🫥 Invisible",function()

	local character = getCharacter()

	for _,object in ipairs(
		character:GetDescendants()
	) do

		if object:IsA("BasePart")
			or object:IsA("Decal")
		then

			if object:GetAttribute(
				"ManoeOldTransparency"
			) == nil
			then

				object:SetAttribute(
					"ManoeOldTransparency",
					object.Transparency
				)

			end

			object.Transparency = 1

		end

	end

	status.Text = "🫥 Invisible"

end)

button("👁 Visible",function()

	local character = getCharacter()

	for _,object in ipairs(
		character:GetDescendants()
	) do

		if object:IsA("BasePart")
			or object:IsA("Decal")
		then

			local old =
				object:GetAttribute(
					"ManoeOldTransparency"
				)

			if old ~= nil then
				object.Transparency = old
			end

		end

	end

	status.Text = "👁 Visible"

end)

--==================================================
-- 🕊 FLY MOBILE + PC
--==================================================

local flying = false

local FLY_SPEED = 70
local VERTICAL_SPEED = 55

local flyUp = false
local flyDown = false

local flyConnection
local flyButton

--------------------------------------------------
-- ⬆ MONTER
--------------------------------------------------

local flyUpButton =
	Instance.new("TextButton")

flyUpButton.Size =
	UDim2.fromOffset(58,58)

flyUpButton.Position =
	UDim2.new(0,20,0,110)

flyUpButton.BackgroundColor3 =
	Color3.fromRGB(25,25,32)

flyUpButton.Text = "⬆"
flyUpButton.TextSize = 29
flyUpButton.TextColor3 =
	Color3.new(1,1,1)

flyUpButton.Visible = false
flyUpButton.ZIndex = 50
flyUpButton.Parent = gui

Instance.new(
	"UICorner",
	flyUpButton
).CornerRadius =
	UDim.new(1,0)

--------------------------------------------------
-- ⬇ DESCENDRE
--------------------------------------------------

local flyDownButton =
	Instance.new("TextButton")

flyDownButton.Size =
	UDim2.fromOffset(58,58)

flyDownButton.Position =
	UDim2.new(0,90,0,110)

flyDownButton.BackgroundColor3 =
	Color3.fromRGB(25,25,32)

flyDownButton.Text = "⬇"
flyDownButton.TextSize = 29
flyDownButton.TextColor3 =
	Color3.new(1,1,1)

flyDownButton.Visible = false
flyDownButton.ZIndex = 50
flyDownButton.Parent = gui

Instance.new(
	"UICorner",
	flyDownButton
).CornerRadius =
	UDim.new(1,0)

--------------------------------------------------
-- MOBILE INPUT
--------------------------------------------------

flyUpButton.MouseButton1Down:
Connect(function()
	flyUp = true
end)

flyUpButton.MouseButton1Up:
Connect(function()
	flyUp = false
end)

flyUpButton.MouseLeave:
Connect(function()
	flyUp = false
end)

flyDownButton.MouseButton1Down:
Connect(function()
	flyDown = true
end)

flyDownButton.MouseButton1Up:
Connect(function()
	flyDown = false
end)

flyDownButton.MouseLeave:
Connect(function()
	flyDown = false
end)

--------------------------------------------------
-- STOP FLY
--------------------------------------------------

local function stopFly()

	flying = false

	flyUp = false
	flyDown = false

	flyUpButton.Visible = false
	flyDownButton.Visible = false

	if flyButton then
		flyButton.Text = "🕊 Fly: OFF"
	end

	if flyConnection then

		flyConnection:Disconnect()
		flyConnection = nil

	end

	local root = getRoot()

	if root then

		root.AssemblyLinearVelocity =
			Vector3.zero

		root.AssemblyAngularVelocity =
			Vector3.zero

	end

end

--------------------------------------------------
-- FLY BUTTON
--------------------------------------------------

flyButton =
	button("🕊 Fly: OFF",function()

		if flying then

			stopFly()

			status.Text =
				"🕊 Fly OFF"

			return

		end

		flying = true

		flyButton.Text =
			"🕊 Fly: ON"

		status.Text =
			"🕊 Fly ON"

		flyUpButton.Visible = true
		flyDownButton.Visible = true

		flyConnection =
			RunService.Heartbeat:
			Connect(function()

				if not flying then
					return
				end

				local character =
					player.Character

				if not character then
					return
				end

				local humanoid =
					character:
					FindFirstChildOfClass(
						"Humanoid"
					)

				local root =
					character:
					FindFirstChild(
						"HumanoidRootPart"
					)

				if not humanoid
					or not root
				then
					return
				end

				local move =
					humanoid.MoveDirection

				local horizontal =
					Vector3.new(
						move.X,
						0,
						move.Z
					)

				local vertical = 0

				if flyUp then
					vertical += VERTICAL_SPEED
				end

				if flyDown then
					vertical -= VERTICAL_SPEED
				end

				if UIS:IsKeyDown(
					Enum.KeyCode.Space
				) then

					vertical += VERTICAL_SPEED

				end

				if UIS:IsKeyDown(
					Enum.KeyCode.LeftShift
				)
					or
					UIS:IsKeyDown(
						Enum.KeyCode.LeftControl
					)
				then

					vertical -= VERTICAL_SPEED

				end

				root.AssemblyLinearVelocity =
					Vector3.new(
						horizontal.X * FLY_SPEED,
						vertical,
						horizontal.Z * FLY_SPEED
					)

				root.AssemblyAngularVelocity =
					Vector3.zero

			end)

	end)

--==================================================
-- 📍 TP PLAYER
--==================================================

local function findPlayer(text)

	if not text
		or text == ""
	then
		return nil
	end

	text = string.lower(text)

	for _,target in ipairs(
		Players:GetPlayers()
	) do

		if string.sub(
			string.lower(target.Name),
			1,
			#text
		) == text
		then

			return target

		end

		if string.sub(
			string.lower(target.DisplayName),
			1,
			#text
		) == text
		then

			return target

		end

	end

	return nil
end

button("📍 TP Player",function()

	local target =
		findPlayer(
			targetBox.Text
		)

	if not target
		or not target.Character
	then

		status.Text =
			"❌ Joueur introuvable"

		return

	end

	local targetRoot =
		target.Character:
		FindFirstChild(
			"HumanoidRootPart"
		)

	if not targetRoot then

		status.Text =
			"❌ Position introuvable"

		return

	end

	getCharacter():PivotTo(
		targetRoot.CFrame
		*
		CFrame.new(
			3,
			0,
			0
		)
	)

	status.Text =
		"📍 TP → "..target.Name

end)

--==================================================
-- 💀 RESET
--==================================================

button("💀 Reset",function()

	if godMode then

		disableGod()

		if godButton then
			godButton.Text =
				"🛡 God: OFF"
		end

	end

	local humanoid =
		getHumanoid()

	if humanoid then
		humanoid.Health = 0
	end

end)

--==================================================
-- 🪑 SIT
--==================================================

button("🪑 Sit",function()

	local humanoid =
		getHumanoid()

	if humanoid then
		humanoid.Sit = true
	end

end)

--==================================================
-- OPEN / CLOSE
--==================================================

openButton.MouseButton1Click:
Connect(function()

	main.Visible =
		not main.Visible

end)

close.MouseButton1Click:
Connect(function()

	main.Visible = false

end)

--==================================================
-- RESPAWN
--==================================================

player.CharacterAdded:
Connect(function(character)

	if flying then
		stopFly()
	end

	if godMode then

		task.wait(0.1)
		applyGod(character)

	end

end)

print("⚡ MANOË ADMIN chargé")
print("✅ Version sans guns")
print("🧱 Phase chargé")
print("🕊 Fly mobile/PC chargé")
print("🛡 God Auto-Heal chargé")
