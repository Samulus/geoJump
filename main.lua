--[[                    _____                                
                       /\___ \                               
     __      __    ___ \/__/\ \  __  __    ___ ___   _____   
   /'_ `\  /'__`\ / __`\  _\ \ \/\ \/\ \ /' __` __`\/\ '__`\ 
  /\ \L\ \/\  __//\ \L\ \/\ \_\ \ \ \_\ \/\ \/\ \/\ \ \ \L\ \
  \ \____ \ \____\ \____/\ \____/\ \____/\ \_\ \_\ \_\ \ ,__/
   \/___L\ \/____/\/___/  \/___/  \/___/  \/_/\/_/\/_/\ \ \/ 
     /\____/                                           \ \_\ 
     \_/__/         by Sam                              \/_/ --]]

  local hero, world, debugMode, col, mapRing, map
  
  require "src/draw"
  require "src/anim"
  require "src/maps"
  require "src/move"
  require "src/coll"
  require "src/bugs"
  require "src/world"

  function love.load()
    hero    = heroGet()
    world   = worldGet()
    col     = colGet()
    mapRing = mapGet()
    map     = mapRing:get()

		debugMode = false
  end
  
  function love.update(dt)
    ------------------------
    --     MOVEMENT       --
    ------------------------
    if not col.fWall and love.keyboard.isDown("right") then
      moveForwd(hero, dt)
    else if not col.bWall and love.keyboard.isDown("left") then
      moveBack(hero, dt)
    else 
      hero.cd = "idle" 
      end
     end
    
    ------------------------
    --      JUMPING       --
    ------------------------
    if not hero.jm and love.keyboard.isDown(" ") then
      hero.v  = -hero.js; hero.jm = true
    end
    
    moveJump(hero, world, dt)
    
    -------------------------
    -- COLLISION DETECTION --
    -------------------------
    colUpdate(hero, col)
    colDetect(hero, world, map, col)
    
    if col.gn then -- if colliding with ground
      world.gn = col.bottom.y
      hero.jm = false 

    else if not col.gn and not hero.jm then -- if not colliding with ground and hero not jumping
      hero.y = hero.y + (dt*600)
      world.gn = 800

    else if hero.jm and hero.v == 0 then
      hero.v = hero.js/2
      end
     end
   end
    
    if col.roof then 
			hero.v = hero.y 
		end
    
    if hero.dead then
      hero.x = map.entry.x 
      hero.y = map.entry.y
      hero.dead = false
    end
    
    animUpdate(hero, dt)
   end
  
  function love.draw()
    drawWorld(map)
    animDrawHero(hero)
		
		if debugMode then
			debugOverlay(hero, world, col, map)
		end
  end

  function love.keypressed(key)
    if key == "return" and col.nDoor then
      mapRing:next(); 
      map = mapRing:get()
      hero.x = map.entry.x; hero.y = map.entry.y
		end

		if key == "return" and col.pDoor then
			mapRing:prev()
			map = mapRing:get()
      hero.x = map.exit.x; hero.y = map.exit.y
		end

		if key == "1" and not debugMode then
			debugMode = true 
			return end
		
		if key == "1" and debugMode then
			debugMode = false
			return end
	end
