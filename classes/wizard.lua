local Event = require 'knife.event'
local Class = require 'lib.middleclass'

local Wizard = Class('Wizard')

function Wizard:initialize()
	self.image = love.graphics.newImage("wizard.png")
	self.x = 300
	self.y = 300
	self.w = 20
	self.h = 21

	Event.on('mousepressed', function (x, y, button)
		if (button == 1
			and x >= self.x and x <= self.x + self.w
			and y >= self.y and y <= self.y + self.h
		) then
			print("YELK")
		end
	end)
end

function Wizard:draw()
	love.graphics.draw(self.image, self.x, self.y)
end

return Wizard