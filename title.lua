title = gs.new()
function title:draw()
	love.graphics.setFont(fntA)
	love.graphics.print("geoJump", 500, 500)
	love.graphics.setFont(fntB)
	love.graphics.print("hit enter to begin", 550, 550)
end

function title:keypressed(button)
	if button == "return" then
		gs.switch(menu)
	end
end
