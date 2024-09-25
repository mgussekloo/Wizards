local System = require 'knife.system'
local Event = require 'knife.event'
local gamera = require 'lib.gamera'

local entities = require 'lib.entities'
local systems = require 'lib.systems'

local Wizard = require 'classes.wizard'

local cam = gamera.new(0,0,2000,2000)
-- cam:setScale(2.0)


function love.load()
	love.graphics.setDefaultFilter( 'nearest', 'nearest' )

	local wiz = Wizard:new()
	table.insert(entities, wiz)


end

function love.draw()
	cam:draw(function(l,t,w,h)
  		-- draw camera stuff here
  		for _, entity in ipairs(entities) do
    	    entity:draw()
    	end
	end)
end

-- function love.update(dt)
-- 	for _, entity in ipairs(entities) do
--         updateMotion(entity, dt)
--     end
-- end

function love.mousepressed(x, y, button)
	cam:setPosition(x, y)
	Event.dispatch('mousepressed', x, y, button)
end