local grdIdle, grdBack, grdNext
local anim8 = require "lib/anim8/anim8"

function initAnim()
	grdIdle = anim8.newGrid(64,64, 64,64)
	grdBack = anim8.newGrid(64,64, 320,64)
	grdNext = anim8.newGrid(64,64, 320,64)
	
	local anim =  {
		idle = { 
			img = love.graphics.newImage("gfx/hero/idle.png"),
			vis = anim8.newAnimation("once", grdIdle('1-1,1'), 0.1)
		},
	
		back = {
			img = love.graphics.newImage("gfx/hero/backward.png"),
			vis = anim8.newAnimation("loop", grdBack('1-5,1'), 0.1),
		},
	
		forward = {
			img = love.graphics.newImage("gfx/hero/forward.png"),
			vis = anim8.newAnimation("loop", grdNext('1-5,1'), 0.1)
		},
	}

	return anim
end
