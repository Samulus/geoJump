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
  end
