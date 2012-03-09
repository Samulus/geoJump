gs  = require "lib/hump/gamestate"
hc  = require "lib/HardonCollider"
gui = require "lib/quickie"
inspect = require "lib/inspect/inspect"
require "edit"
require "save"

fnt  = love.graphics.setFont("gfx/fnt.ttf", 17)
love.graphics.setPoint(6, "smooth")
gs.registerEvents()
main = gs.new()
gs.switch(main)

function main:update(dt)
	if gui.Button("Edit", 340, 310, 100, 20) then 
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
