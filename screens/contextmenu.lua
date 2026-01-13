local Screen = require('lib.Screen')
local ScreenManager = require('lib.ScreenManager')

local cam = require 'lib.cam'

local ContextMenu = {}

local hex2col = require 'lib.hex2col'

local Text = require 'lib.slog-text'

function ContextMenu:new(self)
    local self = Screen.new()

    self.x = 0
    self.y = 0
	self.w = 300
	self.h = 100

	self.options = {}

	self.my_cool_textbox = Text.new("left",
	{
	    color = {1,1,1,1},
	    -- shadow_color = {0.5,0.5,1,0.4},
	    -- font = Fonts.golden_apple,
	    -- character_sound = false,
	    -- print_speed = 0.02,
	    -- adjust_line_height = -3
    })

	function self:init(entity, options)
		local sW, sH = love.graphics.getDimensions()
		-- local _x, _y = cam:toScreen(entity.x, entity.y)
		self.w = sW - 40
		self.x = (sW / 2) - (self.w / 2)
		self.y = (sH - (self.h + 20))
		self.options = options;

		self.my_cool_textbox:send("Oh, gee, I hope this print out one by one!")

	end

    function self:draw()
    	love.graphics.push("all")
		love.graphics.setColor(hex2col('#2E2A2E'))
		love.graphics.rectangle('fill', self.x, self.y, self.w, self.h )

		self.my_cool_textbox:draw(self.x, self.y)

		love.graphics.pop()
    end

    function self:update(dt)
    	print(dt)
		self.my_cool_textbox:update(dt)
    end

    function self:mousepressed(x, y, button)
		if (button == 1
			and x >= self.x and x <= self.x + self.w
			and y >= self.y and y <= self.y + self.h
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