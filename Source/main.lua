local scenes = import "scenes"

local current_scene = scenes.title
current_scene:init()

function playdate.cranked(change, acceleratedChange)
    if current_scene.cranked then
        current_scene:cranked(change, acceleratedChange)
    end
end

function playdate.update()
    current_scene:update()
end
