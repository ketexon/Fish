import "CoreLibs/timer"
import "CoreLibs/easing"

local WIDTH <const> = 400
local HEIGHT <const> = 240

local font = playdate.graphics.getSystemFont("bold")

local text ="If the fish isn't hooked, you can't reel it in"

local text_width =font:getTextWidth(text)
local text_height =font:getHeight()

local text_position_y = HEIGHT
local text_target_position_y = HEIGHT/2 - text_height/2

local reeling_em_in = playdate.timer.new(
    1000,
    HEIGHT,
    HEIGHT/2 - text_height/2,
    playdate.easingFunctions.inExpo
)

local hook = playdate.graphics.image.new("Hook.pdi")

function playdate.update()
    playdate.graphics.clear()

    playdate.graphics.drawText(
        "If the fish isn't hooked, you can't reel it in",
         WIDTH/2 - text_width/2,
         reeling_em_in.value
    )

    playdate.graphics.drawLine( WIDTH/2, 0,WIDTH/2, reeling_em_in.value )
    hook:draw( WIDTH/2, reeling_em_in.value )

    playdate.timer.updateTimers()
end
