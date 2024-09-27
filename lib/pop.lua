local Event = require 'knife.event'
local Class = require 'lib.middleclass'

local hex2col = require 'lib.hex2col'
---

local PopManager = Class('PopManager')

function PopManager:initialize()
	self.children = {}
end

function PopManager:draw()
	if (not self.visible) then
		return
	end

	for _, child in ipairs(self.children) do
	    child:draw()
	end
end

function PopManager:addWindow()
	-- find out if there are any children
	-- if so, we should not add another

	local _win = PopWindow:new()
	table.insert(self.children, _win)
	return _win
end

local _pop = PopManager:new()

---

local PopWindow = Class('PopWindow')

function PopWindow:initialize()
	self.visible = false
	self.z = 0
	self.x = 300
	self.y = 300
	self.w = 20
	self.h = 21

	Event.on('mousepressed', function (x, y, button)
		if (button == 1
			and x >= self.x and x <= self.x + self.w
			and y >= self.y and y <= self.y + self.h
		) then
			-- pop:showMenu()
		end
	end)
end

function PopWindow:draw()
	love.graphics.push()
	love.graphics.setColor(hex2col('#FF0000'))
	love.graphics.rectangle('fill', self.x, self.y, self.w, self.h )
	love.graphics.pop()
end

---

return _pop



