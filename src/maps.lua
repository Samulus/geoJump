--[[  /'\_/`\                             
     /\      \     __     _____     ____  
     \ \ \__\ \  /'__`\  /\ '__`\  /',__\ 
      \ \ \_/\ \/\ \L\.\_\ \ \L\ \/\__, `\
       \ \_\\ \_\ \__/.\_\\ \ ,__/\/\____/
        \/_/ \/_/\/__/\/_/ \ \ \/  \/___/ 
                        \ \_\         
                         \/_/             --]]

	local ringbuffer = require "lib/hump/ringbuffer"

	local title = {
		vis = love.graphics.newImage("lvl/title/vis.png"),
		col = love.image.newImageData("lvl/title/col.png"),
		entry = {x=188, y=493},
		exit  = {x=695, y=502}
	}

	local stairs = {
		vis = love.graphics.newImage("lvl/stairs/vis.png"),
		col = love.image.newImageData("lvl/stairs/col.png"),
		entry = {x=45,   y=59},
		exit  = {x=742, y=368}
	}

	local gap = {
		vis = love.graphics.newImage("lvl/gap/vis.png"),
		col = love.image.newImageData("lvl/gap/col.png"),
		entry = {x=45, y=500},
		exit  = {x=50, y=237}
	}

	local style = {
		vis = love.graphics.newImage("lvl/style/vis.png"),
		col = love.image.newImageData("lvl/style/col.png"),
		entry = {x=574,y=408},
		exit  = {x=27, y=435}
	}
	
	local rb = ringbuffer(title, stairs, gap, style)
	
	function mapGet() return rb end
