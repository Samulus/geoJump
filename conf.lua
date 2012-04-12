--[[                      ___                 
                        /'___\ __             
    ___    ___     ___ /\ \__//\_\     __     
   /'___\ / __`\ /' _ `\ \ ,__\/\ \  /'_ `\   
  /\ \__//\ \L\ \/\ \/\ \ \ \_/\ \ \/\ \L\ \  
  \ \____\ \____/\ \_\ \_\ \_\  \ \_\ \____ \ 
   \/____/\/___/  \/_/\/_/\/_/   \/_/\/___L\ \
                                       /\____/
                                       \_/__/  --]]
  
  function love.conf(t)
    t.title = "geoJump"
    t.author = "Sam, Ashley, Emilo, Cody"
    t.identify = "geoJump"
    t.screen.vsync = true
    t.modules.joystick = false
    t.modules.physics = false
  end
