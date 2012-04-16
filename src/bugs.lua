--[[  ____            __                          
     /\  _`\         /\ \                         
     \ \ \/\ \     __\ \ \____  __  __     __     
      \ \ \ \ \  /'__`\ \ '__`\/\ \/\ \  /'_ `\   
       \ \ \_\ \/\  __/\ \ \L\ \ \ \_\ \/\ \L\ \  
        \ \____/\ \____\\ \_,__/\ \____/\ \____ \ 
         \/___/  \/____/ \/___/  \/___/  \/___L\ \
                                           /\____/
                                           \_/__/ --]]

  inspect  = require "lib/inspect/inspect"
	local fntDebug = love.graphics.newFont("gfx/font/debug.ttf", 6)
	
	function debugOverlay(hero, world, col, map)
    love.graphics.setFont(fntDebug)
    love.graphics.print("hero", 100, 95)
    love.graphics.print(inspect(hero), 240, 400)
    love.graphics.print(inspect(col),  340, 400)
    love.graphics.print("ground level: ".. world.gn, 400, 400)

    love.graphics.point(col.forwd.x, col.forwd.y)
    love.graphics.point(col.back.x, col.back.y)
    love.graphics.point(col.top.x, col.top.y)
    love.graphics.point(col.bottom.x, col.bottom.y)
  end
