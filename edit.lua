edit = gs.new()

function edit:init()
	shape = {m = "rectangle", x = 400, y = 300}
	verts = {
		rect = {x={},y={}},
		tri  = {x={},y={},r={}} -- r == rotation
	}
	grid  = {x = 0, y = 0}
	slide = {value = 100, min = 0, max = 100}
end

function edit:update(dt)
	local x,y = love.mouse.getPosition()
	grid.x = math.floor(x/32) * 32
	grid.y = math.floor(y/32) * 32
	if gui.Slider(slide,90,540,100,20) then 
		if slide.value < 50 then 
			shape.m = "rectangle" 
		else 
			shape.m = "triangle" 
		end
	end
	
	if shape.m == "triangle"  then
		if gui.Button("Flip",200, 540, 100, 20) then end
	end
	
	if gui.Button("save",680,560,100,20) then 
		gs.switch(save)
	end
end

function edit:draw()
	-- HUD --	
	love.graphics.print("create a map", 50, 50)
	love.graphics.print(shape.m, 90, 510)
	gui.core.draw()
	
	-- Draw Map --
	for i=1, #verts.rect.x do
		love.graphics.rectangle("fill",verts.rect.x[i],verts.rect.y[i],32,32)
 	end

	for i=1, #verts.tri.x do
		love.graphics.triangle("fill",
		verts.tri.x[i],   verts.tri.y[i],  -- Point 1
		verts.tri.x[i],   verts.tri.y[i]+32, -- Point 2
		verts.tri.x[i]+32, verts.tri.y[i]+32) -- Point 2
	end

end

-- DRY?
function edit:mousepressed(x,y,button)
	if button == "l" then
		if grid.y > 60 and grid.y < 500 then 
			if shape.m == "rectangle" then
					table.insert(verts.rect.x, grid.x)
					table.insert(verts.rect.y, grid.y)
				end
			
			if shape.m == "triangle" then
			  table.insert(verts.tri.x, grid.x)
			  table.insert(verts.tri.y, grid.y)
			end
		end
	end

	if button == "r" then
		if shape.m == "rectangle"  then
			for i=1, #verts.rect.x do 
				if verts.rect.x[i] == grid.x and
					 verts.rect.y[i] == grid.y then
					table.remove(verts.rect.x, i)
					table.remove(verts.rect.y, i) 
				end
			end
		end
		
		if shape.m == "triangle" then
			for i=1, #verts.tri.x do 
				if verts.tri.x[i] == grid.x and
					 verts.tri.y[i] == grid.y then 
					table.remove(verts.tri.x, i)
					table.remove(verts.tri.y, i) 
				end
			end
		end
	end

end

function edit:keypressed(button)
	if button == "escape" 
		then gs.switch(main) 
	end
end

function edit:leave()
	print(inspect(verts)) -- ?
end
