edit = gs.new()
local sU=30  -- snap every 30 px / units
local sX=1   -- x snap axis
local sY=1   -- y snap axis
local vX={}  -- x vertices array
local vY={}  -- x vertices array
love.graphics.setPoint(6, "smooth")

function edit:update(dt)
	local x,y = love.mouse.getPosition()
	sX = math.floor(x/sU)
	sY = math.floor(y/sU)
end

function edit:draw()
	love.graphics.print("create a map", 50, 50)
	-- border check
	if sX*sU > 60 and sX*sU < 720 and
	 	 sY*sU > 60 and sY*sU < 510
		then love.graphics.point(sX*sU, sY*sU)
	end 
	
	for i=1, #vX
			do love.graphics.point(vX[i], vY[i])
	end
	
	gui.core.draw()
end

function edit:mousepressed(x,y,button)
	if button == "l"
		then table.insert(vX, sX*sU)
				 table.insert(vY, sY*sU)
	 else if button == "r"
		then for i=1, #vX do
				if vX[i] == sX*sU and vY[i] == sY*sU
					then table.remove(vX, i)
							 table.remove(vY, i)
				end
			end
		end
	end
end

function edit:keypressed(button)
	if button == "escape" 
		then gs.switch(menu) 
	end
end
