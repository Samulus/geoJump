--[[  ____                                                       
     /\  _`\                              __                     
     \ \ \/\ \  _ __    __     __  __  __/\_\    ___      __     
      \ \ \ \ \/\`'__\/'__`\  /\ \/\ \/\ \/\ \ /' _ `\  /'_ `\   
       \ \ \_\ \ \ \//\ \L\.\_\ \ \_/ \_/ \ \ \/\ \/\ \/\ \L\ \  
        \ \____/\ \_\\ \__/.\_\\ \___x___/'\ \_\ \_\ \_\ \____ \ 
         \/___/  \/_/ \/__/\/_/ \/__//__/   \/_/\/_/\/_/\/___L\ \
                                                          /\____/
                                                           \_/__/ --]]

  local camera, vector, fnt
  
  love.graphics.setBackgroundColor(255,255,255)
  love.graphics.setPointSize(5)
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

  function debugOverlay(hero, world, col, map)
    love.graphics.setFont(fnt.nrml)
    love.graphics.print("hero", 100, 95)
    love.graphics.print(inspect(hero), 100, 115)
    love.graphics.print(inspect(col),  400, 115)
    love.graphics.print("ground level: ".. world.gn, 400, 400)

    -- draw collision detection points --
    love.graphics.point(col.forwd.x, col.forwd.y)
    love.graphics.point(col.back.x, col.back.y)
    love.graphics.point(col.top.x, col.top.y)
    love.graphics.point(col.bottom.x, col.bottom.y)
  end
