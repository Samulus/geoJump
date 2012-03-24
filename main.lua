local state, hero, anim, font, map
tl = require "lib/ATL/Loader"
be = require "lib/beholder/beholder"
hc = require "lib/HC"

require "src/animations"
require "src/draw"
require "src/init"
require "src/maps"

function love.load()
	state = "intro"
	hero  = initHero()
	anim  = initAnim() 
	font  = initFont()
	
	map = tl.load("lvl/intro.tmx")
	love.graphics.setBackgroundColor(226,226,226)
	love.graphics.setColor(38,38,38)
end

function love.draw()
	if state == "intro" then
		drawIntro(font)
		return
	end
end
