local Event = require 'knife.event'
-- local Class = require 'lib.middleclass'

-- local pop = require 'lib.pop'

local ScreenManager = require('lib.ScreenManager')

-- local Wizard = Class('Wizard')

local Wizard = {}

function Wizard:new()
	local self = {}

	local image = love.graphics.newImage("wizard.png")
	local x = 300
	local y = 300
	local w = 20
	local h = 21

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
		love.graphics.draw(image, x, y)
		love.graphics.pop()
	end

	function self:mousepressed(_x, _y, button)
		if (button == 1
			and _x >= x and _x <= x + w
			and _y >= y and _y <= y + h
		) then
			print('YELP')
			ScreenManager.push('contextmenu')
		end
		-- cam:setPosition(cam:toWorld(x, y))
		-- local x, y = cam:toWorld(x, y)
		-- Event.dispatch('mousepressed', x, y, button)
	end

	return self
end

return Wizard