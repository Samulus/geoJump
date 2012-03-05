-- main.lua
gs = require "lib/hump/gamestate"
require "title"
require "menu" 
require "make"
function love.load()
	fntA = love.graphics.newFont("gfx/fntA.ttf", 22)
	fntB = love.graphics.newFont("gfx/fntB.ttf", 14)
	gs.registerEvents()
	gs.switch(title)
end
