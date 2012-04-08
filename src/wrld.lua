local hero, wrld

   hero  = {
     x  = 100,     -- x position
     y  = 100,     -- y position
     w  = 64,      -- width      
     h  = 64,      -- height   
     r  = 5,       -- rate    
     v  = 250,     -- velocity    
     s  = 250,     -- jumpspeed
     kp = false,   -- directional key pressed
     js = false,   -- jumpstate
     cd = "forwd", -- current direction
     pd = "back",  -- previous direction
   }
   
   wrld = {
     gnd = 500, -- current ground level
     grv = 450, -- current gravity level
     jmp = 500, -- current jumpspeed
   }
  
  function heroGet()
    return hero
  end

  function wrldGet()
    return wrld
  end
