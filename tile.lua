local size, quadset, map, legend, quads, mapTable

function newMap(size, tileimage, map, legend)
	quadset = love.graphics.newImage(tileimage)
	quads = {}
	mapTable = {}
	
	for _, info in ipairs(legend) do
		quads[info[1]] = love.graphics.newQuad(info[2],info[3],32,32,64,64)
	end
	
	local row, col = 1,1
	for x=1, 20, 1 do 
		mapTable[x] = {} 
	end
	
	for block in map:gmatch("[^\n]+") do col=1
    for char in block:gmatch(".") do
      mapTable[col][row] = char; col=col+1
    end row=row+1
  end
end

function editMap(mode, x, y)
	local i,j = 1,1
	while x ~= 32 do x=x-32 i=i+1 end
	while y ~= 32 do y=y-32 j=j+1 end
	mapTable[i][j] = "#"
end

function drawMap()
 for columnIndex,column in ipairs(mapTable) do
    for rowIndex,char in ipairs(column) do
      local x,y = (columnIndex-1)*32, (rowIndex-1)*32
      love.graphics.drawq(quadset,quads[char],x,y,0,1,1,-64,-96)
    end
  end
end
