-- edit.lua, level editor
local mode = "rec" 
local grid = {x=0,y=0,u=32}
local save = {text = "", cursor=0}
edit = gs.new()	

function edit:update(dt)
	local x,y = love.mouse.getPosition()
	grid.x = math.floor(x/grid.u) * grid.u
	grid.y = math.floor(y/grid.u) * grid.u
	gui.Button("OK", 600, 560, 35, 20)
	gui.Input(save, 650, 560, 120, 20)
end

function edit:draw()
	love.graphics.print("create a map", 50, 50)
	gui.core.draw()
	drawMap()
end

function edit:mousepressed(x,y,button)
	if grid.y < 96 or grid.y > 480 or
		 grid.x < 64 or grid.x > 704 then 
		 return "Out of Bounds" end
	
	if button == "l" then
		editMap("insert", grid.x, grid.y) 
	end
	
	if button == "r" then
		editMap("remove", grid.x, grid.y)
	end
end

function edit:keypressed(key, code)
	if key == "escape" then
		gs.switch(main)
	end

	gui.core.keyboard.pressed(key, code)
end

function edit:leave()
	save.text = ""
end
