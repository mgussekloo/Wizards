local Screen = require('lib.Screen')
local ScreenManager = require('lib.ScreenManager')

local ContextMenu = {}

local hex2col = require 'lib.hex2col'

function ContextMenu.new()
    local self = Screen.new()

    local x, y = 0, 0
	local w, h = 40, 40

    function self:draw()
    	love.graphics.push("all")
		love.graphics.setColor(hex2col('#FF0000'))
		love.graphics.rectangle('fill', x, y, w, h )
		love.graphics.pop()
    end

    function self:mousepressed(_x, _y, button)
		if (button == 1
			and _x >= x and _x <= x + w
			and _y >= y and _y <= y + h
		) then
			print('ACK')
			ScreenManager.switch('game')
		end
		-- cam:setPosition(cam:toWorld(x, y))
		-- local x, y = cam:toWorld(x, y)
		-- Event.dispatch('mousepressed', x, y, button)
	end

    return self
end

return ContextMenu