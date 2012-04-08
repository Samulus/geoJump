local hero, wrld, map, state
  
  inspect = require "lib/inspect/inspect"
  
  require "src/draw"
  require "src/anim"
  require "src/move"
  require "src/wrld"
  require "src/maps"

  function love.load()
    hero = heroGet()
    wrld = wrldGet()
    map  = mapLoad("lvl/intro/vis.png", "lvl/title/col.png")
  end

  function love.update(dt)
    movePlayer(hero, wrld, dt)
    animUpdate(hero, dt)
  end

  function love.draw()
    drawWorld(map)
    animDrawHero(hero)
  end

  function love.keypressed(key)
  end
