--[[                    _____                                
                       /\___ \                               
     __      __    ___ \/__/\ \  __  __    ___ ___   _____   
   /'_ `\  /'__`\ / __`\  _\ \ \/\ \/\ \ /' __` __`\/\ '__`\ 
  /\ \L\ \/\  __//\ \L\ \/\ \_\ \ \ \_\ \/\ \/\ \/\ \ \ \L\ \
  \ \____ \ \____\ \____/\ \____/\ \____/\ \_\ \_\ \_\ \ ,__/
   \/___L\ \/____/\/___/  \/___/  \/___/  \/_/\/_/\/_/\ \ \/ 
     /\____/                                           \ \_\ 
     \_/__/         by Ashley, Cody, Emilo & Sam        \/_/ --]]

  local hero, world, col, map
  
  inspect = require "lib/inspect/inspect"
  
  require "src/draw"
  require "src/anim"
  require "src/move"
  require "src/maps"
  require "src/coll"
  require "src/world"

  function love.load()
    hero  = heroGet()
    world = worldGet()
    col   = colGet()
    map   = mapLoad("lvl/intro/vis.png", "lvl/intro/col.png")
  end

  function love.update(dt)
    -- read and update the positon of collision detection pixels --
    colDetect(hero, world, map, col)
    colUpdate(hero, col)
    
    -- cardinal movement & wall collison / idling animation / jumping animation --
    if not col.fWall and love.keyboard.isDown("right") then 
      moveForwd(hero, dt)
    else if not col.bWall and love.keyboard.isDown("left") then 
      moveBack(hero, dt) 
    else hero.cd = "idle" end
      end
    
    if hero.jm then
      if hero.pd == "back"  then hero.cd = "bJump" end
      if hero.pd == "forwd" then hero.cd = "fJump" end
    end
    
    if not hero.jm and love.keyboard.isDown(" ") then
      hero.v  = -hero.js; hero.jm = true;
    end
    
    --------------------------------------
    --         GROUND COLLISION         --
    --------------------------------------
    if col.gn then 
      world.gn = col.bottom.y; hero.jm = false 
    else if not col.gn and not hero.jm then
      hero.y = hero.y + (dt*150); world.gn = 800 end
    end
    
    --------------------------------------
    --         ROOF  COLLISION          --
    --------------------------------------
    if col.roof then hero.v = hero.y end
    
    moveParabola(hero, world, dt)
    animUpdate(hero, dt)
  end

  function love.draw()
    drawWorld(map)
    animDrawHero(hero)
    debugOverlay(hero, world, col, map)
  end
