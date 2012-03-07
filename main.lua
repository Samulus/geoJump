gs  = require ("lib/hump/gamestate")
gui = require ("lib/quickie")

require "title"
require "edit"

function love.load()
	fntA = love.graphics.newFont("gfx/fntA.ttf", 22)
	fntB = love.graphics.newFont("gfx/fntB.ttf", 14)
	gs.registerEvents()
	gs.switch(title)
end
