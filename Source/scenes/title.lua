import "CoreLibs/timer"
import "CoreLibs/crank"
import "CoreLibs/ui"

local math = import "utility/math"

local title = {}

local WIDTH <const> = 400
local HEIGHT <const> = 240

function title:init()
	self.font = playdate.graphics.getSystemFont("bold")

	self.text = "If the fish isn't hooked, you can't reel it in"

	self.text_width = self.font:getTextWidth(self.text)
	self.text_height = self.font:getHeight()

	self.text_position_y = HEIGHT
	self.text_target_position_y = HEIGHT/2 - self.text_height/2
	self.text_start_position_y = self.text_position_y


	self.reel_speed  = 60

	self.hook = playdate.graphics.image.new("Hook.pdi")

	self.playing_crank_animation = false

	self.crank_timer = playdate.timer.new(
		2000,
		function()
			self.playing_crank_animation = true
			playdate.ui.crankIndicator:start()
		end
	)
end

function title:cranked(change, acceleratedChange)
    self.playing_crank_animation = false
	self.crank_timer:pause()
end

function title:update()
    playdate.graphics.clear()

    self.text_position_y += playdate.getCrankTicks(self.reel_speed)
    self.text_position_y = math.min(self.text_position_y, self.text_start_position_y)

    if self.text_position_y + self.text_height < 0 then
        print("Hello")
    end

    -- CRANK ALERT
    if self.playing_crank_animation then
        playdate.ui.crankIndicator:update()
    end


    playdate.graphics.drawText(
        "If the fish isn't hooked, you can't reel it in",
        WIDTH/2 - self.text_width/2,
        self.text_position_y
    )

    playdate.graphics.drawLine( WIDTH/2, 0,WIDTH/2, self.text_position_y )
    self.hook:draw(WIDTH/2, self.text_position_y )

    playdate.timer.updateTimers()
end

return title