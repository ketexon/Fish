import "CoreLibs/graphics"

local dialogue_system = {}

local TABLE_PADDING = 4
local TEXT_PADDING = 2
local MAX_TEXT_WIDTH = 240 - 2 * TABLE_PADDING - 2 * TEXT_PADDING

dialogue_system.States = {
	DISABLED = 0,
	PRESENTING = 1,
	END_OF_LINE = 2,
	END_OF_DIALOGUE = 3,
}

---@type string[]
dialogue_system.lines = {}
dialogue_system.current_line = 1
dialogue_system.current_character = 1

dialogue_system.state = dialogue_system.States.DISABLED

function dialogue_system:start_dialogue()
	self.current_line = 1
	self.current_character = 1
	self.state = self.States.PRESENTING
end

function dialogue_system:update()
	if self.state == self.States.PRESENTING then
		if self.current_line > #self.lines then
			self.state = self.States.END_OF_DIALOGUE
		else
			self.current_character += 1
			if self.current_character > #self.lines[self.current_line] then
				self.state = self.States.END_OF_LINE
			end
		end
	end
	
	if self.state ~= self.States.DISABLED then
		-- draw
		for i = 1, self.current_line do
			local line = self.lines[i]
			local text_width, text_height = playdate.graphics.getTextSizeForMaxWidth(line, MAX_TEXT_WIDTH)
			-- top right 240 - TEXT_PADDING
			-- origin_x + text_width + 2 * TEXT_PADDING = 240 - TEXT_PADDING
			-- origin_x = 240 - TEXT_PADDING - text_width - 2 * TEXT_PADDING
			playdate.graphics.drawRect(
				240 - TABLE_PADDING - text_width - 2 * TEXT_PADDING, 
				140 + TABLE_PADDING,
				text_width + 2 * TEXT_PADDING,
				text_height + 2 * TEXT_PADDING
			)

			playdate.graphics.drawTextInRect(
				line,
				240 - TABLE_PADDING - text_width + TEXT_PADDING, 140 + TABLE_PADDING  + TEXT_PADDING,
				text_width, text_height
			)
		end
	end
end

return dialogue_system