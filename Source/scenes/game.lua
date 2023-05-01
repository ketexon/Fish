local game = {}

function game:init(scene_manager)

end

function game:update()
	playdate.graphics.drawText(
		"New Scene!",
		200, 200
	)
end

return game
