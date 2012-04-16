--[[  __      __                 ___       __     
     /\ \  __/\ \               /\_ \     /\ \    
     \ \ \/\ \ \ \    ___   _ __\//\ \    \_\ \   
      \ \ \ \ \ \ \  / __`\/\`'__\\ \ \   /'_` \  
       \ \ \_/ \_\ \/\ \L\ \ \ \/  \_\ \_/\ \L\ \ 
        \ `\___x___/\ \____/\ \_\  /\____\ \___,_\
         '\/__//__/  \/___/  \/_/  \/____/\/__,_ / --]]
   
   local hero, world, col

   hero  = { 
     x   = 100,     -- x position
     y   = 100,     -- y position
     w   = 64,      -- width      
     h   = 64,      -- height   
     r   = 5,       -- rate    
     v   = 250,     -- velocity    
     mv  = 400,     -- movement speed
     js  = 250,     -- jumpseed
     jm  = false,   -- boolean true or false jumped state
     cd  = "forwd", -- current direction
     pd  = "back",  -- previous direction
     dead = false   -- gets triggered if player collides with red square
  }
   
   world = {
     gn = 480, -- current ground level
     gv = 500, -- current gravity level
     jm = 300, -- current jumpspeed
   }

   col = {
      forwd  = {x = hero.x + 66, y = hero.y + 32},
      back   = {x = hero.x     , y = hero.y + 32},
      top    = {x = hero.x + 32, y = hero.y -  2},
      bottom = {x = hero.x + 32, y = hero.y + 66},

      fWall  = false, -- forward facing wall
      bWall  = false, -- backward facing wall
      roof   = false, -- object above player
      gn     = false, -- ground level
      pDoor  = false, -- previous / entry door (yellow)
      nDoor  = false  -- exit / next door (green)
   }
  
  function heroGet()  return hero  end
  function worldGet() return world end
  function colGet()   return col   end
