function initHero()
	hero = {x=0, y=0, direction="left"}
	return hero
end

function initFont()
	local font = {
	 xxl = love.graphics.newFont("gfx/fnt/infinity.ttf", 80),
	 normal = love.graphics.newFont("gfx/fnt/pixo.ttf", 15)
 	}
	return font
end

function initMap()
end
