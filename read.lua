read = gs.new()
function writeMap(filename)
	local mapTable  = getMap()
	local mapString = TSerial.pack(mapTable)
	love.filesystem.write("lvls/"..filename, "mapTable = [["..mapString.."]]", all)
end

function read:update() 
	local i,j = 1,180
	local list = love.filesystem.enumerate("lvls/")
	for i=1, #list do j=j+20
		if gui.Button(list[i],550,j+20,120,20) then
			path = "lvls/"..list[i]; 
			buildMap(path)
	end
end
end

function read:draw() 
	love.graphics.print("LOAD", 100, 120)
	gui.core.draw()
end

function read:keypressed(key)
	if key == "escape" then 
		gs.switch(main) 
	end
end
