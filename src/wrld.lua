local hero, wrld, col

   hero  = { 
		 x   = 100,     -- x position
     y   = 100,     -- y position
     w   = 64,      -- width      
     h   = 64,      -- height   
     r   = 5,       -- rate    
     v   = 250,     -- velocity    
     s   = 250,     -- jumpspeed
     kp  = false,   -- directional key pressed
     js  = false,   -- jumpstate
     cd  = "forwd", -- current direction
     pd  = "back",  -- previous direction
		 col = {x = 0,y = 0}
	}
	 
	 wrld = {
     gnd = 800, -- current ground level
     grv = 450, -- current gravity level
     jmp = 500, -- current jumpspeed
   }

	 col = {
		  forwd  = {x = hero.x + 66, y = hero.y + 32},
		  back   = {x = hero.x - 2,  y = hero.y + 32},
		  bottom = {x = hero.x + 32, y = hero.y + 66},
		  top    = {x = hero.x + 32, y = hero.y -  2},

			fWall  = false, -- forward facing wall
			bWall  = false, -- backward facing wall
			roof   = false, -- object above player
			plt    = false, -- standing on platform
			gnd    = false, -- ground level
	 }
  
	function heroGet() return hero end
  function wrldGet() return wrld end
	function colGet()  return col  end
