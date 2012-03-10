edit = gs.new()
local tool = {m = "rec", x=0, y=0 }
local grid = {x=0, y=0,  u=32}
local flip = {value=50, min=0, max=50}

function edit:enter()
	require "map/sam"
end

function edit:update(dt)
	local x,y = love.mouse.getPosition()
	grid.x = math.floor(x/grid.u) * grid.u
	grid.y = math.floor(y/grid.u) * grid.u
	
	if gui.Slider(flip,90,540,100,20) then 
		if flip.value > 25 then tool.m = "rec" end 
		if flip.value < 25 then tool.m = "tri" end
	end
	
	if tool.m == "tri" then
		gui.Button("Flip",200, 540, 100, 20)
	end
	
	if gui.Button("save",680,560,100,20) then 
		gs.switch(save)
	end
end

function edit:draw()
	love.graphics.print("create a map", 50, 50)
	love.graphics.print("grid.x = " ..grid.x, 300, 540)
	love.graphics.print("grid.y = " ..grid.y, 500, 540)
	drawMap()
	gui.core.draw()
end

function edit:mousepressed(x,y,button)
	if grid.y < 96 or grid.y > 480 or
		 grid.x < 64 or grid.x > 704 then
		 return
	end
	
	if button == "l" then
		editMap("insert", grid.x, grid.y)
	end
	
	if button == "r" then
		editMap("remove", grid.x, grid.y)
	end
end

function edit:keypressed(key)
	if key == "escape" then
		gs.switch(main)
	end
end
