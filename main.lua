gs  = require "lib/hump/gamestate"
hc  = require "lib/HardonCollider"
gui = require "lib/quickie"
require "lib/debug/debug"
require "edit"
require "save"
require "tile"

main = gs.new()
gs.registerEvents()
gs.switch(main)
love.graphics.setFont("gfx/fnt.ttf", 17)

function main:update(dt)
	if gui.Button("New", 340, 310, 100, 20) then 
		gs.switch(edit)
	end
	
	if gui.Button("Load", 340, 340, 100, 20) then 
		gs.switch(save) 
	end
	
	if gui.Button("Quit", 340, 370, 100, 20) then 
		love.event.push("q") 
	end
end

function main:draw()
	love.graphics.print("geoJump", 500, 500)
	gui.core.draw()
end
