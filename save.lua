save = gs.new()
function save:enter()
	if love.filesystem.isDirectory("lvls") == false then
		love.filesystem.mkdir("lvls")
	end
	files = love.filesystem.enumerate("/")
end

function save:init() 
	input = {text = "", cursor = 0}
end

function save:update() 
	gui.Input(input, 110, 220, 140,20)
	if gui.Button("OK", 280, 215, 40, 30) then 
		level = love.filesystem.newFile("lvls/"..input.text)
		level:open("w")
	end
	
	j = 220
	for i=1, #files do 
		if gui.Button(files[i],550,j, 120, 20) then
			love.filesystem.load(files[i])
		end
		j = j + 20
	end
end

function save:draw() 
	love.graphics.print("SAVE", 150, 180)
	love.graphics.print("LOAD", 550, 180)

	gui.core.draw()
end

function save:keypressed(key, code)
	if key == "escape" then
		gs.switch(main)
	end
	gui.core.keyboard.pressed(key, code)
end
