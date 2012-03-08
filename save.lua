save = gs.new()
function save:enter()
	if love.filesystem.isDirectory("lvls") == false then
		love.filesystem.mkdir("lvls")
	end
	files = love.filesystem.enumerate("geoJump")
end

function save:init() 
	input = {text = "", cursor = 0}
end

function save:update() 
	gui.Input(input, 110, 320, 140,20)
	if gui.Button("OK", 270, 315, 40, 30) then 
		level = love.filesystem.newFile("lvls/"..input.text)
		level:open("w")
	end
end

function save:draw() 
	love.graphics.print("SAVE", 150, 280)
	love.graphics.print("LOAD", 550, 280)
	gui.core.draw()
end

function save:keypressed(key, code)
	if key == "escape" then
		gs.switch(main)
	end
	gui.core.keyboard.pressed(key, code)
end
