local hero, wrld, col, map
  
  inspect = require "lib/inspect/inspect"
  
  require "src/draw"
  require "src/anim"
  require "src/move"
  require "src/wrld"
  require "src/maps"
  require "src/coll"

  function love.load()
    hero = heroGet()
    wrld = wrldGet()
    col  =  colGet()
    map  = mapLoad("lvl/intro/col.png", "lvl/intro/col.png")
  end

  function love.update(dt)
    movePlayer(hero, col, wrld, dt)
    animUpdate(hero, dt)
    colUpdate(hero, col)
    colDetect(hero, wrld, map, col)
  end

  function love.draw()
    drawWorld(map)
    animDrawHero(hero)
    debugOverlay(hero, col, map)
  end
