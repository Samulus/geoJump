--[[  /'\_/`\                                                  /\ \__   
     /\      \    ___   __  __     __    ___ ___      __    ___\ \ ,_\  
     \ \ \__\ \  / __`\/\ \/\ \  /'__`\/' __` __`\  /'__`\/' _ `\ \ \/  
      \ \ \_/\ \/\ \L\ \ \ \_/ |/\  __//\ \/\ \/\ \/\  __//\ \/\ \ \ \_ 
       \ \_\\ \_\ \____/\ \___/ \ \____\ \_\ \_\ \_\ \____\ \_\ \_\ \__\
        \/_/ \/_/\/___/  \/__/   \/____/\/_/\/_/\/_/\/____/\/_/\/_/\/__/ --]]
  
  function moveForwd(hero, dt)
    hero.x = hero.x + (dt*hero.mv)
    hero.cd = "forwd"
    hero.pd = "forwd"
  end

  function moveBack(hero, dt)
    hero.x = hero.x - (dt*hero.mv)
    hero.cd = "back"
    hero.pd = "back"
  end

  function moveJump(hero, world, dt)
   if hero.jm then
     if hero.pd == "back"  then hero.cd = "bJump" end
     if hero.pd == "forwd" then hero.cd = "fJump" end
   end
    
   if hero.v ~= 0 then
     hero.v = hero.v + (dt*world.gv)
     hero.y = hero.y + (dt*hero.v)
   end
 
   if hero.y > world.gn - hero.h then
      hero.y = world.gn - hero.h
      hero.v = 0; hero.jm = false
    end
  end
