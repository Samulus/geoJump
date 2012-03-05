title = gs.new()
function title:draw()
	love.graphics.setFont(fntA)
	love.graphics.print("geoMan", 400, 500)
	love.graphics.setFont(fntB)
	love.graphics.print("hit enter to begin", 430, 535)
end

function title:keypressed(button)
	if button == "return" then
		gs.switch(menu)
	end
end
