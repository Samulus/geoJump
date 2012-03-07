local gui = require "/lib/quickie"
title = gs.new()

function title:update(dt)
	if gui.Button("Edit", 340, 310, 100, 20) then gs.switch(edit) end
	if gui.Button("Load", 340, 340, 100, 20) then gs.switch(load) end
	if gui.Button("Quit", 340, 370, 100, 20) then love.event.push("q") end
end

function title:draw()
	love.graphics.setFont(fntA)
	love.graphics.print("geoJump", 500, 500)
	love.graphics.setFont(fntB)
	love.graphics.print("hit enter to begin", 550, 550)
	gui.core.draw()
end
