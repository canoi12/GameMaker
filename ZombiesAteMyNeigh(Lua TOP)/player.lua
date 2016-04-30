player = gameobject:new()


function animControl(dt)
    if love.keyboard.isDown("up") and player.dx == 0 then
    player.flipH = 1
    player.currentAnimation = "walkingUp"
    player.dy = -1
    weapon[player.armaAtual].currentAnimation = "Up"
    --weapon[player.armaAtual].angle = 270
    weapon[player.armaAtual].x = player.x
    weapon[player.armaAtual].y = player.y - 3
    
    weapon[player.armaAtual].cy = -9
    weapon[player.armaAtual].cx = 0
  elseif love.keyboard.isDown("down") and player.dx == 0 then
    player.flipH = 1
    player.currentAnimation = "walkingDown"
    player.dy = 1
    weapon[player.armaAtual].currentAnimation = "Down"
    --weapon[player.armaAtual].angle = 90
    weapon[player.armaAtual].x = player.x
    weapon[player.armaAtual].y = player.y + 3
    
    weapon[player.armaAtual].cy = 9
    weapon[player.armaAtual].cx = 0
  elseif love.keyboard.isDown("left") and player.dy == 0 then
    player.currentAnimation = "walkingSide"
    player.flipH = -1
    player.dx = -1
    weapon[player.armaAtual].currentAnimation = "Side"
    --weapon[player.armaAtual].angle = 0
    weapon[player.armaAtual].x = player.x - 4
    weapon[player.armaAtual].y = player.y + 2
    
    weapon[player.armaAtual].cy = 0
    weapon[player.armaAtual].cx = -9
  elseif love.keyboard.isDown("right") and player.dy == 0 then
    player.currentAnimation = "walkingSide"
    player.flipH = 1
    player.dx = 1
    --weapon[player.armaAtual].angle = 0
    weapon[player.armaAtual].currentAnimation = "Side"
    weapon[player.armaAtual].x = player.x + 4
    weapon[player.armaAtual].y = player.y + 2
    
    weapon[player.armaAtual].cy = 0
    weapon[player.armaAtual].cx = 9
  else
    player.frameAtual = 1
    player.dx = 0
    player.dy = 0
    --player.currentAnimation = "idle"
  end
  
  
  if weapon[player.armaAtual].currentAnimation == "Up" then
    weapon[player.armaAtual].x = player.x
    weapon[player.armaAtual].y = player.y - 3
  elseif weapon[player.armaAtual].currentAnimation == "Down" then
    weapon[player.armaAtual].x = player.x
    weapon[player.armaAtual].y = player.y + 3
  elseif weapon[player.armaAtual].currentAnimation == "Side" then
    weapon[player.armaAtual].x = player.x + (player.flipH * 4)
    weapon[player.armaAtual].y = player.y
  end
end

function bulletShot(dt)
    player.recuo = player.recuo - 0.1
  
  if love.keyboard.isDown("z","Z") and player.recuo <= 0 then
    player.recuo = player.recuoArma
    if player.currentAnimation == "walkingUp" then
      newBullet = createNewBullet(0,-100)
      newBullet1 = createNewBullet(-50,-100)
      newBullet2 = createNewBullet(50,-100)
    elseif player.currentAnimation == "walkingDown" then
      newBullet = createNewBullet(0,100)
      newBullet1 = createNewBullet(-50,100)
      newBullet2 = createNewBullet(50,100)
    elseif player.currentAnimation == "walkingSide" then
      if player.flipH == 1 then
        newBullet = createNewBullet(100,0)
        newBullet1 = createNewBullet(100,50)
        newBullet2 = createNewBullet(100,-50)
      else
        newBullet = createNewBullet(-100,0)
        newBullet1 = createNewBullet(-100,50)
        newBullet2 = createNewBullet(-100,-50)
      end
    end
    if player.armaAtual == "revolver" then
            table.insert(bullets,newBullet)
    elseif player.armaAtual == "shotgun" then
            table.insert(bullets,newBullet)
            table.insert(bullets,newBullet1)
            table.insert(bullets,newBullet2)
    end
  end
    
end

function player.load()
  player.image = love.graphics.newImage("assets/player3.png")

  player.currentAnimation = "walkingUp"
  player.flipH = 1

  player.speed = 50
  
  player.object = "player"

  player.width = 11
  player.height = 11
  
  player.frameAtual = 0
  player.frameTime = 0
  player.frameTimeInit = 0.07
  
  player.vida = 10;
  player.dano = true;
  
  player.recuoArma = 1
  player.recuo = 1
  
  player.armaAtual = "shotgun"

  player.image:setFilter("nearest","nearest")
  
  local quadsize = player.image:getWidth()
  local qtdFrameH = 3
  local tilesize = quadsize/qtdFrameH

  player.anim = {
    --[["idle"] = {
      [0] = love.graphics.newQuad(16,32,tilesize,tilesize,quadsize,quadsize)
    },
    ["walkingUp"] = {
      [0] = love.graphics.newQuad(0,0,tilesize,tilesize,quadsize,quadsize),
      [1] = love.graphics.newQuad(tilesize,0,tilesize,tilesize,quadsize,quadsize),
      [2] = love.graphics.newQuad(tilesize*2,0,tilesize,tilesize,quadsize,quadsize),
      [3] = love.graphics.newQuad(tilesize,0,tilesize,tilesize,quadsize,quadsize)
    },
    ["walkingDown"] = {
      [0] = love.graphics.newQuad(0,tilesize*2,tilesize,tilesize,quadsize,quadsize),
      [1] = love.graphics.newQuad(tilesize,tilesize*2,tilesize,tilesize,quadsize,quadsize),
      [2] = love.graphics.newQuad(tilesize*2,tilesize*2,tilesize,tilesize,quadsize,quadsize),
      [3] = love.graphics.newQuad(tilesize,tilesize*2,tilesize,tilesize,quadsize,quadsize)
    },
    ["walkingSide"] = {
      [0] = love.graphics.newQuad(0,tilesize,tilesize,tilesize,quadsize,quadsize),
      [1] = love.graphics.newQuad(tilesize,tilesize,tilesize,tilesize,quadsize,quadsize),
      [2] = love.graphics.newQuad(tilesize*2,tilesize,tilesize,tilesize,quadsize,quadsize),
      [3] = love.graphics.newQuad(tilesize,tilesize,tilesize,tilesize,quadsize,quadsize)
    }]]
  }
  player.anim["walkingUp"] = funcs:addAnimation("walkingUp",0,0,16,16,48,48)
  player.anim["walkingSide"] = funcs:addAnimation("walkingSide",0,16,16,16,48,48)
  player.anim["walkingDown"] = funcs:addAnimation("walkingDown",0,32,16,16,48,48)
  print(table.getn(player.anim))
  
  player.angle = 0
  
  player.bbox = {
      left = 4,
      right = 11,
      up = 8,
      down = 14
  }
end

function player.update(dt)
  player.frameTime = player.frameTime - 0.01
  if player.frameAtual < table.getn(player.anim[player.currentAnimation]) and player.frameTime <= 0 then
    player.frameAtual = player.frameAtual + 1
    player.frameTime = player.frameTimeInit
  elseif player.frameAtual >= table.getn(player.anim[player.currentAnimation]) and player.frameTime <= 0 then
    player.frameAtual = 0
    player.frameTime = player.frameTimeInit
  end
  
  player.recuoArma = weapon[player.armaAtual].recuo

  keyUp = love.keyboard.isDown("up")
  keyDown = love.keyboard.isDown("down")
  keyLeft = love.keyboard.isDown("left")
  keyRight = love.keyboard.isDown("right")

  player.y = player.y + ((bool2int(keyDown)-bool2int(keyUp))*(player.speed*dt))
  player.x = player.x + ((bool2int(keyRight)-bool2int(keyLeft))*(player.speed*dt))
  
   for i,e in ipairs(enemies) do
    if collision2obj(player,e) then
    
    end
  end
  for i,b in ipairs(arvores) do
    collision2obj(player,b)
  end
  for i,b in ipairs(baus) do
    collision2obj(player,b)
  end

  animControl(dt)
  
  
  player.x = math.max(10,math.min(player.x,game.roomWidth-10))
  player.y = math.max(10,math.min(player.y,game.roomHeight-10))
  
  bulletShot(dt)
  
end

function player.draw()
  --love.graphics.draw(player.image,player.anim[player.currentAnimation][player.frameAtual],player.x,player.y,0,player.flipH,1,8,8)
end

function player.keypressed(btn)
  if btn == "z" or btn == "Z" then
  end
end
