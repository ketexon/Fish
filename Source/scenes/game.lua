local game = {}

local dialogue_system = import "dialogue/dialogue_system"

function game:init(scene_manager)
	dialogue_system.lines = {
		"Bonjour mon ami(e)!",
		"Je suis Finley ze French Man",
	}
	dialogue_system:start_dialogue()
end

function game:update()
	playdate.graphics.setLineWidth(1)
	playdate.graphics.drawLine(240, 0, 240, 400)

	playdate.graphics.setLineWidth(2)
	playdate.graphics.drawLine(0, 140, 240, 140)

	dialogue_system:update()
end

return game
