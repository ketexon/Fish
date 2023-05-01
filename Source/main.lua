local scene_manager = import "scene_manager"

scene_manager:change_scene(scene_manager.scenes.title)

function playdate.cranked(change, acceleratedChange)
    if scene_manager.current_scene.cranked then
        scene_manager.current_scene:cranked(change, acceleratedChange)
    end
end

function playdate.update()
    scene_manager.current_scene:update()
end
