local camera, vector, fnt
  
  love.graphics.setBackgroundColor(255,255,255)
  love.graphics.setColor(36,36,36)
	
	fnt = {
  	fncy = love.graphics.newFont("gfx/font/infinity.ttf", 80),
  	nrml = love.graphics.newFont("gfx/font/pixo.ttf", 15)
	}
  
  function drawWorld(level)
    love.graphics.draw(level.vis)
    love.graphics.setFont(fnt.fncy)
    love.graphics.print("geoJump", 150, 100)
  end

  --[[function debugOverlay(hero, map)
    love.graphics.setFont(fnt.nrml)
    love.graphics.print("hero", 100, 95)
    love.graphics.print(inspect(hero), 100, 115)

		local r, g, b, a = map.geo:getPixel(hero.x, hero.y)
		
		if g == 255 then
    	love.graphics.setFont(fnt.nrml)
			love.graphics.print("door", hero.x, 450)
		end
  end
	--]]
