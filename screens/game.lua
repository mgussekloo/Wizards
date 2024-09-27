local Screen = require('lib.Screen')
local Event = require 'knife.event'

local cam = require 'lib.cam'
local entities = require 'lib.entities'

local GameScreen = {}

function GameScreen.new()
    local self = Screen.new()

    local x, y = 0, 0
	local w, h = love.graphics.getDimensions()

	function self:mousepressed(x, y, button)
		print("asd")
		-- cam:setPosition(cam:toWorld(x, y))
		local x, y = cam:toWorld(x, y)
		Event.dispatch('mousepressed', x, y, button)
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

    return self
end

return GameScreen