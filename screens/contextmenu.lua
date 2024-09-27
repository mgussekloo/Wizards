local Screen = require('lib.Screen')

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

    return self
end

return ContextMenu