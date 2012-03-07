edit = gs.new()
function edit:init()
	love.graphics.setPoint(6, "smooth")
	shape = {m = "rect", x = 400, y = 300}
	mouse = {x = 0, y = 0}
	verts = {x = {400}, y = {300}}
	grid  = {u = 25, x = 0, y = 0}
	slide = {value = 100, min = 0, max = 100}
end

function edit:update(dt)
	local x,y = love.mouse.getPosition()
	grid.x = math.floor(x/grid.u) * grid.u
	grid.y = math.floor(y/grid.u) * grid.u
	
	if gui.Slider(slide,90,540,100,20) then end
	if gui.Button("save",680,560,100,20) then 
		gs.switch(save)
	end
end

function edit:draw()
	love.graphics.print("create a map", 50, 50)
	for i=1, #verts.x do
		love.graphics.rectangle("fill",verts.x[i],verts.y[i],grid.u,grid.u)
 end
	gui.core.draw()
	love.graphics.print("Tri", 195, 540)
	love.graphics.print("Rect", 45, 540)
end

function edit:mousepressed(x,y,button)
	if button == "l" then
		if grid.y > 60 and grid.y < 500 then 
			table.insert(verts.x, grid.x)
			table.insert(verts.y, grid.y)
		end
	end
	
	if button == "r" then
		for i=1, #verts.x do 
			if verts.x[i] == grid.x and
				 verts.y[i] == grid.y then
			table.remove(verts.x, i)
			table.remove(verts.y, i) end
		end
	end
end

function edit:keypressed(button)
	if button == "escape" 
		then gs.switch(title) 
	end
end
