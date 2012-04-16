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
		entry = {x=45,  y=59},
		exit  = {x=194, y=508}
	}

	local stairs = {
		vis = love.graphics.newImage("lvl/stairs/vis.png"),
		col = love.image.newImageData("lvl/stairs/col.png"),
		entry = {x=45, y=59},
		exit  = {x=75, y=96}
	}

	local gap = {
		vis = love.graphics.newImage("lvl/gap/vis.png"),
		col = love.image.newImageData("lvl/gap/col.png"),
		entry = {x=45, y=500},
		exit  = {x=194, y=508}
	}

	local style = {
		vis = love.graphics.newImage("lvl/style/vis.png"),
		col = love.image.newImageData("lvl/style/col.png"),
		entry = {x=569,y=436},
		exit  = {x=575, y=485}
	}
	
	--[[
	local canvas = {
		vis = love.graphics.newImage("lvl/canvas/vis.png"),
		col = love.image.newImageData("lvl/canvas/col.png")
	}
	]]--

	local rb = ringbuffer(title, stairs, gap, style)
	
	function mapGet() return rb end
