funcs = require "essential"
require "gameobject"
require "camera"
require "menuscreen"
require "gamescreen"
require "player"
require "bullet"
require "slime"
require "enemies"
require "wave"
require "bau"
require "particle"
require "weapon"
require "arvore"
require "editor"
require "assets/teste mapa"
require "playerteste"

--[[ 
    Adaptar a classe de armas para adicioná-las na tabela de objetos
]]

local FPS = 60
local nextTime = love.timer.getTime() + 1/FPS

game = {}
game.currentScreen = "menu"
game.screens = {}

game.roomWidth = 256
game.roomHeight = 256

game.scaleX = 10
game.scaleY = 10

function table.shallow_copy(t)
   local c = {}
  for k,v in ipairs(t) do
    c[k] = v
  end
  return c
end

function distance(x1,y1,x2,y2)
    local dx = x1-x2
    local dy = y1 - y2
    return math.sqrt((dx*dx)+(dy*dy))
end

function bool2int(val)
  if val then
    return 1
  end
  return 0
end

function lerp(v1,v2,t)
    return v1 + t*(v2-v1)
end

function love.load()
  love.window.setMode(game.scaleX*64, game.scaleY*64,{resizable = true})
  --gamescreen.load()
  --menuscreen.load()
  funcs:addScreen("menu",menuscreen)
  funcs:addScreen("game",gamescreen)
  canvas = love.graphics.newCanvas(64,64)
  
  canvas:setFilter("nearest","nearest")
  
  myShader = love.graphics.newShader[[
      extern number index;
      vec4 effect(vec4 color,Image texture, vec2 texture_coords, vec2 screen_coords){
          texture_coords.x = texture_coords.x+ (sin(texture_coords.y*1+index))/30.0;
          texture_coords.y = texture_coords.y+ (cos(texture_coords.x*1+index))/30.0;
          vec4 pixel = Texel(texture,texture_coords);
          float cmax = max(pixel.r,max(pixel.g,pixel.b));
          
          return color*pixel;
      }
  ]]
  
  j = 0
end

function love.update(dt)
  --[[if game.currentScreen == "menu" then
    menuscreen.update(dt);
  elseif game.currentScreen == "game" then
    gamescreen.update(dt)
  elseif game.currentScreen == "editor" then
    editor_update(dt)
  end]]

    local timedif = nextTime - love.timer.getTime()
    if timedif > 0 then love.timer.sleep(timedif) end
    nextTime = nextTime + 1/FPS    

  game.screens[game.currentScreen]:update(dt)

  if love.graphics.getWidth() < love.graphics.getHeight() then
    game.scaleX = love.graphics.getWidth()/64
    game.scaleY = love.graphics.getWidth()/64
  else
    game.scaleX = love.graphics.getHeight()/64
    game.scaleY = love.graphics.getHeight()/64
  end

  j = j + 0.1
  if j %(math.pi*2) == 0 then
    j = 0
  end 
  --myShader:send("index",j)
end

function love.draw()
  --love.graphics.setShader(myShader)
  love.graphics.setCanvas(canvas)
  love.graphics.clear()
  camera:set()
  game.screens[game.currentScreen]:draw()
  love.graphics.print(love.timer.getFPS(),camera.x,camera.y)
  camera:unset()
  love.graphics.setCanvas()
  love.graphics.draw(canvas,0,0,0,game.scaleX,game.scaleY)
  --love.graphics.setShader()
end

function love.keypressed(btn)
  gamescreen.keypressed(btn)
  editor_keypressed(btn)
end
