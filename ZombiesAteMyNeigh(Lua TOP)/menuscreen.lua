menuscreen = {}

function menuscreen:load()
  menuscreen.title = love.graphics.newImage("assets/titletext.png")
  menuscreen.bg = love.graphics.newImage("assets/titlescreen2.png")
  i = 0

  menuscreen.title:setFilter("nearest","nearest")
  menuscreen.bg:setFilter("nearest","nearest")

  --[[local font = love.graphics.newImageFont("assets/lowfontC.png",
  " abcdefghijklmnopqrstuvwxyz" ..
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ" ..
  "0123456789.,!?-+/():;%&`'*#=[]\"")]]
  local font = love.graphics.newImageFont("assets/font-2-love.png",
  " ABCDEFGHIJKLMNOPQRSTUVWXYZ" ..
  "abcdefghijklmnopqrstuvwxyz" ..
  "0123456789.,;:?!-_~#\"'&()[]|`\\/@º+=*$£¢<>%áéíóú")
  font:setFilter("nearest","nearest")

  love.graphics.setFont(font)
end

function menuscreen:update(dt)
  i = i + 0.1
  if i % (2*math.pi) == 0 then
    i = 0
  end

  if love.keyboard.isDown("z","Z") then
    game.currentScreen = "game"
  end
  if love.keyboard.isDown("x","X") then
    game.currentScreen = "editor"
  end
end

function menuscreen:draw()
  love.graphics.draw(menuscreen.bg,0,0)
  love.graphics.draw(menuscreen.title,0,math.sin(i)*2)

  love.graphics.print("PRESS Z TO START", 0, 50)
end
