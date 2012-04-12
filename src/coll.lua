--[[  ____            ___    ___                                              
     /\  _`\         /\_ \  /\_ \    __          __                           
     \ \ \/\_\    ___\//\ \ \//\ \  /\_\    ____/\_\    ___     ___     ____  
      \ \ \/_/_  / __`\\ \ \  \ \ \ \/\ \  /',__\/\ \  / __`\ /' _ `\  /',__\ 
       \ \ \L\ \/\ \L\ \\_\ \_ \_\ \_\ \ \/\__, `\ \ \/\ \L\ \/\ \/\ \/\__, `\
        \ \____/\ \____//\____\/\____\\ \_\/\____/\ \_\ \____/\ \_\ \_\/\____/
         \/___/  \/___/ \/____/\/____/ \/_/\/___/  \/_/\/___/  \/_/\/_/\/___/  --]]
  
  function colUpdate(hero, col)
    col.forwd.x  = hero.x + 66; col.forwd.y  = hero.y + 32
    col.back.x   = hero.x - 2 ; col.back.y   = hero.y + 32
    col.top.x    = hero.x + 32; col.top.y    = hero.y
    col.bottom.x = hero.x + 32; col.bottom.y = hero.y + 64
  end
  
  function colDetect(hero, wrld, map, col)
    local  forwd = getColor(col.forwd.x, col.forwd.y, map)
    local   back = getColor(col.back.x, col.back.y, map)
    local    top = getColor(col.top.x, col.top.y, map)
    local bottom = getColor(col.bottom.x, col.bottom.y, map)
    
    if  forwd == "black" then col.fWall = true  end
    if   back == "black" then col.bWall = true  end
    if    top == "black" then col.roof  = true  end
    if bottom == "black" then col.gn    = true  end
    
    if  forwd == "white" then col.fWall = false end
    if   back == "white" then col.bWall = false end
    if    top == "white" then col.roof  = false end
    if bottom == "white" then col.gn    = false end
  end
  
  function getColor(x, y, map)
    local r,g,b,a = map.geo:getPixel(x,y)
    if r == 0   and g == 0   and b == 0   then return "black"  end
    if r == 255 and g == 255 and b == 255 then return "white"  end
    if r == 255 and g == 0   and b == 0   then return "red"    end
    if r == 0   and g == 255 and b == 0   then return "green"  end
    if r == 0   and g == 0   and b == 255 then return "blue"   end
    if r == 255 and g == 255 and b == 0   then return "yellow" end
    if b == 255 then return "blue"  end
  end
