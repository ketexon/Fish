---@class SceneManager
---@field current_scene? Scene
---@field transitioning boolean
---@field next_scene? Scene

---@type SceneManager
local scene_manager = {}

local width <const>, height <const> = playdate.display.getSize()

scene_manager.scenes = import "scenes"

scene_manager.current_scene = nil

---@param new_scene Scene
function scene_manager:transition_scene(new_scene)
	self.next_scene = new_scene
	self.transitioning = true
end

function scene_manager:change_scene(new_scene)
	if self.current_scene and self.current_scene.deinit then
		self.current_scene:deinit()
	end
	self.current_scene = new_scene
	if self.current_scene.init or true then
		self.current_scene:init(self)
	end
end

function scene_manager:update()
	playdate.graphics.clear()

	if self.current_scene then
		self.current_scene:update()
	end

	if self.transitioning then
		if self.transition_timer == nil then
			self.transition_timer = playdate.timer.new(2000, 0, 1, playdate.easingFunctions.inOutQuad)
		end
		
		playdate.graphics.setColor(playdate.graphics.kColorBlack)
		playdate.graphics.fillRect(
			0, self.transition_timer.value * 2 * -height + height,
			width, height
		)
		
		if self.transition_timer.value > 0.5 and self.next_scene ~= nil then
			self:change_scene(self.next_scene)
			self.next_scene = nil
		end

		if self.transition_timer.value >= 1 then
			self.transitioning = false
			self.transition_timer:remove()
			self.transition_timer = nil
		end

		playdate.timer.updateTimers()
	end
end

return scene_manager
