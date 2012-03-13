-- main.lua, the whole shebang
gs  = require "lib/hump/gamestate"
hc  = require "lib/HardonCollider"
gui = require "lib/quickie"
require "lib/TSerial/TSerial.lua"
require "read"
require "edit"
require "draw"

main = gs.new()
gs.registerEvents()
gs.switch(main)

function love.load()
	love.graphics.setFont("gfx/fnt.ttf", 17)
	initTile()
end

function main:update(dt)
	if gui.Button("New", 340, 310, 100, 20) then 
		if mapExists() == false then 
			buildMap("lvl/empty.lua") end
		gs.switch(edit)
	end
	
	if gui.Button("Load", 340, 340, 100, 20) then 
		gs.switch(read) 
	end
	
	if gui.Button("Quit", 340, 370, 100, 20) then 
		love.event.push("q") 
	end
end

function main:draw()
	love.graphics.print("geoJump", 500, 500)
	gui.core.draw()
end
