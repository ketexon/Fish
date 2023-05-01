local scene_manager = {}

scene_manager.scenes = import "scenes"

scene_manager.current_scene = nil

function scene_manager:change_scene(new_scene)
	if self.current_scene and self.current_scene.deinit then
		self.current_scene:deinit()
	end
	self.current_scene = new_scene
	if self.current_scene.init or true then
		self.current_scene:init(self)
	end
end

return scene_manager
