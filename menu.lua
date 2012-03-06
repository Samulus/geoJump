local gui = require("/lib/quickie")
menu = gs.new()

function menu:update(dt)
	if gui.Button("Edit", 350, 310, 100, 20) then gs.switch(edit) end
	if gui.Button("Load", 350, 330, 100, 20) then --[[TODO]] end
	if gui.Button("Quit", 350, 350, 100, 20) then love.quit() end
end

function menu:draw()
	gui.core.draw()
end
