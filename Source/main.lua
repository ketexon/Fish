import "CoreLibs/timer"
import "CoreLibs/crank"

local math = import "utility/math"

local WIDTH <const> = 400
local HEIGHT <const> = 240

local font = playdate.graphics.getSystemFont("bold")

local text ="If the fish isn't hooked, you can't reel it in"

local text_width = font:getTextWidth(text)
local text_height = font:getHeight()

local text_position_y = HEIGHT
local text_target_position_y = HEIGHT/2 - text_height/2
local text_start_position_y = text_position_y


local reel_speed <const> = 60

local hook = playdate.graphics.image.new("Hook.pdi")



function playdate.update()
    playdate.graphics.clear()

    text_position_y += playdate.getCrankTicks(reel_speed)
    text_position_y = math.min(text_position_y, text_start_position_y)

if text_position_y <0 then
    print("Hello")
end

    playdate.graphics.drawText(
        "If the fish isn't hooked, you can't reel it in",
        WIDTH/2 - text_width/2,
        text_position_y
    )

    playdate.graphics.drawLine( WIDTH/2, 0,WIDTH/2, text_position_y )
    hook:draw(WIDTH/2, text_position_y )

    playdate.timer.updateTimers()
end
