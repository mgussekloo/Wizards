local Screen = require('lib.Screen')
local Event = require 'knife.event'

local cam = require 'lib.cam'
local entities = require 'lib.entities'

local GameScreen = {}

function GameScreen:new()
    local self = Screen:new()
	-- local w, h = love.graphics.getDimensions()

	local drag = {
		active = false,
		x = 0,
		y = 0
	}

	function self:mousepressed(x, y, button)
		-- cam:setPosition(cam:toWorld(x, y))
		-- local x, y = cam:toWorld(x, y)
		-- Event.dispatch('mousepressed', x, y, button)

		drag.active = true
		local cX, cY = cam:getPosition()
		drag.x = x - cX
		drag.y = y - cY
		print(drag.x, drag.y)

		_x, _y = cam:toWorld(x, y)
		for _, entity in ipairs(entities) do

			if (button == 1
				and _x >= entity.x and _x <= entity.x + entity.w
				and _y >= entity.y and _y <= entity.y + entity.h
			) then

				drag.active = false;
    	    	entity:touch()
    	    	break

    	    end
    	end
	end

	function self:mousereleased(x, y, button)
		drag.active = false
	end

    function self:draw()
    	-- print(cam)
	    cam:draw(function(l,t,w,h)
	  		-- draw camera stuff here
	  		for _, entity in ipairs(entities) do
	    	    entity:draw()
	    	end
		end)
    end

    function self:update(dt)
    	if drag.active then
    		local diffX = love.mouse:getX() - drag.x
    		local diffY = love.mouse:getY() - drag.y
    		print(diffX, diffY)
    		cam:setPosition(diffX, diffY)
    	end
    end

    return self
end

return GameScreen