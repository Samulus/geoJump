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
	local fntDebug = love.graphics.newFont("gfx/font/debug.ttf", 19)
	
	function debugOverlay(hero, world, col, map)
    love.graphics.setFont(fntDebug)
    love.graphics.print(inspect(hero), 300, 200)
    love.graphics.print(inspect(col),  450, 200)

    love.graphics.point(col.forwd.x, col.forwd.y)
    love.graphics.point(col.back.x, col.back.y)
    love.graphics.point(col.top.x, col.top.y)
    love.graphics.point(col.bottom.x, col.bottom.y)
  end
