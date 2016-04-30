local func = {}

function func:coll4side(ob1,obj2)
	-- body
end

function func:addAnimation(nam,x,y,width,height,imgW,imgH)
	local name = {}
	v = imgW/width+x
	for i=0,v-1 do
		name[i] = love.graphics.newQuad(i*width,y,width,height,imgW,imgH)
	end
	name[v] = love.graphics.newQuad(1*width,y,width,height,imgW,imgH)
	return name
end

function func:addScreen(name,screen)
	screen:load()
	game.screens[name] ={
		load = screen.load,
		update = screen.update,
		draw = screen.draw
	}
end

function func:setScreen(name)
	game.currentScreen = name
end

return func