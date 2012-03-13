-- draw.lua, drawing related functions
local sheet, sprites, legend, mapVisual, mapTable;
function initTile()
	sheet = love.graphics.newImage("gfx/tile.png")
	sprites = {}
	legend = {
			{'#', 0,   0}, -- rectangle
			{'>', 32,  0}, -- triangle
			{'O', 64,  0}, -- circle
			{' ', 32, 32}  -- transparent
		}
	
	for _, info in ipairs(legend) do
		sprites[info[1]] = love.graphics.newQuad(info[2], info[3],32,32,64,64)
	end
end

function buildMap(path)
	mapVisual, mapTable = love.filesystem.load(path)()
	local row, col = 1,1
	for x=1, 20, 1 do mapTable[x] = {} end
	
	for block in mapVisual:gmatch("[^\n]+") do col=1
    for char in block:gmatch(".") do
      mapTable[col][row] = char; col=col+1
    end row=row+1
  end
end

function editMap(mode, x, y)
	local i,j = 1,1
	while x ~= 64 do x=x-32 i=i+1 end
	while y ~= 96 do y=y-32 j=j+1 end
	
	if mode == "insert" then 
		mapTable[i][j] = '#' 
	end
	
	if mode == "remove" then 
		mapTable[i][j] = ' ' 
	end
end

function drawMap()
 for columnIndex,column in ipairs(mapTable) do
    for rowIndex,char in ipairs(column) do
      local x,y = (columnIndex-1)*32, (rowIndex-1)*32
      love.graphics.drawq(sheet,sprites[char],x,y,0,1,1,-64,-96)
    end
  end
end

function mapExists()
	if mapVisual == nil or mapTable == nil then 
		return false
	
	else 
		return true
	end
end
