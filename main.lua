local ScreenManager = require('lib.ScreenManager')

local System = require 'knife.system'

local entities = require 'lib.entities'
local systems = require 'lib.systems'

local Wizard = require 'classes.wizard'

function love.load()
	love.graphics.setDefaultFilter( 'nearest', 'nearest' )

  	local screens = {
        game = require('screens.game'),
        contextmenu = require('screens.contextmenu')
    }

	ScreenManager.init(screens, 'game')

	local wiz = Wizard:new()
	table.insert(entities, wiz)
end

function love.draw()
	ScreenManager:draw()
end

function love.update(dt)
	ScreenManager:update(dt)

end

function love.mousepressed(x, y, button)
	ScreenManager.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
	ScreenManager.mousereleased(x, y, button)
end