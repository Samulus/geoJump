  
  function movePlayer(hero,col,wrld, dt) 
    if love.keyboard.isDown("right") and not col.fWall then
      hero.x  = hero.x + (dt*400); 
      hero.cd = "forwd"; 
      hero.pd = "forwd"; 
      hero.kp = true
    end
   
     if love.keyboard.isDown("left") and not col.bWall then
       hero.x = hero.x - (dt*400)
       hero.cd = "back"; 
       hero.pd = "back"; 
       hero.kp = true
    end

    if love.keyboard.isDown(" ") and hero.v == 0 then
      hero.v = -hero.s; 
      hero.j = true; 
      hero.kp = true
      love.timer.sleep(0.01)
    end

    if hero.kp == false then 
      hero.cd = "idle"
    else 
      hero.kp = false 
    end
    
    if col.roof then hero.v = col.top.y end
    -- ^ cancel the players jump / velocity whenever player collides with roof
    
    if col.gnd  then wrld.gnd = col.bottom.y - 64 end
    if not col.gnd then 
      wrld.gnd = 800 
      --hero.v = -hero.s 
      hero.j = true
    end
    -- ^ set the ground level to col.bottom.y whenever player on ground
    
    if hero.v ~= 0 then
      hero.v = hero.v + (dt*wrld.grv)
      hero.y = hero.y + (dt*hero.v)
      hero.j = true
       
      if hero.pd == "back"  then 
        hero.cd = "bJump" 
      end
       
      if hero.pd == "forwd" then 
        hero.cd = "fJump" 
      end
    
    else hero.j = false 
      return 
    end

    if hero.y > wrld.gnd - hero.r then
       hero.y = wrld.gnd - hero.r
       hero.v = 0
    end
  end
