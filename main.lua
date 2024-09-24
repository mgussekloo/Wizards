local System = require 'knife.system'

local entities = require 'entities'
local Wizard = require 'wizard'

function love.load()
	local wiz = Wizard:new()
	table.insert(entities, wiz)

	-- wiz = love.graphics.newImage("wizard.png")

	-- create a new menu
	-- add labels
	-- each label


	-- create a new object
	-- the object has an image, and a number of tags
	-- when i click anywhere

	-- local doDraw = System({ '_entity', 'image' },
    -- function (entity, image)
	-- 	love.graphics.draw(person, character[1] - person:getWidth()/2, character[2] - person:getHeight())
    -- end)
end

function love.draw()
	 for i,entity in ipairs(entities) do
	 	entity.draw()
	 end


end

 function love.mousepressed(x, y, button)
   if button == 1 and x>200 and x<230 and y>280 and y<320 then
   StartGame = true
end