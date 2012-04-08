local map
  
	function mapLoad(visPath, geoPath)
		map = {
    	vis = love.graphics.newImage(visPath),
			geo = love.image.newImageData(geoPath)
		} return map
  end
