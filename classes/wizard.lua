local Event = require 'knife.event'
-- local Class = require 'lib.middleclass'

-- local pop = require 'lib.pop'

local ScreenManager = require('lib.ScreenManager')


local Wizard = {}

function Wizard:new()
	local self = {}

	self.image = love.graphics.newImage("wizard.png")
	self.x = 300
	self.y = 300
	self.w = 20
	self.h = 21

	-- Event.on('mousepressed', function (x, y, button)
	-- 	if (button == 1
	-- 		and x >= self.x and x <= self.x + self.w
	-- 		and y >= self.y and y <= self.y + self.h
	-- 	) then
	-- 		print('YELP')
	-- 		ScreenManager.push('contextmenu')
	-- 	end
	-- end)

	function self:draw()
		love.graphics.push()
		love.graphics.draw(self.image, self.x, self.y)
		love.graphics.pop()
	end

	function self:touch()
		print('YELP')
		ScreenManager.push('contextmenu', self)
	end

	-- function self:getPosition()
	-- 	return self.x, self.y
	-- end

	return self
end

return Wizard