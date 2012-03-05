local gui = require("/lib/quickie")
menu = gs.new()

local opt = {"Exit","Load","Make"}
local y   = {300,280,260}

function menu:update(dt)
	for i=1, #opt do 
		if gui.Button(opt[i],300,y[i],130,20)  then
			if opt[i] == "Exit" then love.quit() end
	--  if opt[i] == "Load" then gs.switch(load) end
			if opt[i] == "Make" then gs.switch(make) end
		end
	end
end

function menu:draw()
	gui.core.draw()
end
