  
  function movePlayer(hero,wrld, dt) 
    if love.keyboard.isDown("right") then
      hero.x = hero.x + (dt*400); 
      hero.cd = "forwd"; hero.pd = "forwd"; hero.kp = true
     end
   
     if love.keyboard.isDown("left") then
      hero.x = hero.x - (dt*400)
      hero.cd = "back"; hero.pd = "back"; hero.kp = true
    end

    if love.keyboard.isDown(" ") and hero.v == 0 then
      hero.v = -hero.s; hero.j = true; hero.kp = true
    end

    if hero.kp == false then hero.cd = "idle"
    else hero.kp = false end

    ------------------------
    --  PARABOLIC JUMPING --
		--  OH SHIT LOL       --
    ------------------------
    if hero.v ~= 0 then
      hero.v = hero.v + (dt*wrld.grv)
      hero.y = hero.y + (dt*hero.v)
      
      if hero.pd == "back"  then hero.cd = "bJump" end
      if hero.pd == "forwd" then hero.cd = "fJump" end
    
    else hero.j = false; return end

    if hero.y > wrld.gnd - hero.r then
     hero.y = wrld.gnd - hero.r
     hero.v = 0
   end
  end
