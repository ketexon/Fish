---@class Scene
---@field update fun(self: Scene)
---@field init? fun(self: Scene, scene_manager: SceneManager)
---@field deinit? fun(self: Scene)

return {
    title = import "scenes/title",
    game = import "scenes/game",
}
