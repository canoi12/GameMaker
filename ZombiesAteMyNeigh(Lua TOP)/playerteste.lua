playerteste = gameobject:new()

function playerteste:load()
	-- body
end

function playerteste:update(dt)
	-- body
end

function playerteste:draw()
	love.graphics.rectangle("line",self.x,self.y,self.width,self.height)
end