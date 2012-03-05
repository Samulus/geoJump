local gui = require "lib/quickie"
make = gs.new()

function make:init()
 block_u = 50
 block_x = 1
 block_y = 1
end

function make:update(dt)
	local x,y = love.mouse.getPosition()
	block_x = math.floor(x/block_u)
	block_y = math.floor(y/block_u)
end

function make:draw()
	gui.core.draw()
	love.graphics.print(".", block_x*block_u, block_y*block_u) -- ghetto
end

function make:mousepressed(x,y,button)
	if button == "l" then 
		-- add vertex
	end
	if button == "r" then
		-- remove vortex
	end
end

function make:keypressed(button)
	if button == "escape" then
		gs.switch(menu)
	end
end
