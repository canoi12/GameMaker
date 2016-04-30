slime = {}
slimes = {}

function slime.load()
  slime.x = 0
  slime.y = 0

  slime.image = love.graphics.newImage("assets/slime.png")

  slime.currentAnimation = "idle"
  slime.flipH = 1

  slime.speed = 10

  slime.changePos = 2
  slime.changeAnim = 0.50

  slime.frameAtual = 0
  slime.frameTime = 0
  slime.frameTimeInit = 0.07
  
  slime.attackDelay = 1
  
  slime.width = 16
  slime.height = 16

  slime.dx = 0
  slime.dy = 0

  slime.vida = 10

  slime.image:setFilter("nearest","nearest")

  slime.anim = {
    ["idle"] = {
      [0] = love.graphics.newQuad(0,0,16,16,48,48),
      [1] = love.graphics.newQuad(16,0,16,16,48,48),
      [2] = love.graphics.newQuad(32,0,16,16,48,48)
    },
    ["walking"] = {
      [0] = love.graphics.newQuad(0,16,16,16,48,48),
      [1] = love.graphics.newQuad(16,16,16,16,48,48),
      [2] = love.graphics.newQuad(32,16,16,16,48,48),
      [3] = love.graphics.newQuad(16,16,16,16,48,48)
    },
    ["attack"] = {
      [0] = love.graphics.newQuad(0,32,16,16,48,48),
      [1] = love.graphics.newQuad(16,32,16,16,48,48),
      [2] = love.graphics.newQuad(32,32,16,16,48,48),
    }
  }
  slime.x = 0
  slime.y = 0

  newSlime = {x=50,y=50,width = slime.width, height = slime.height,anim=slime.anim,frameAtual = 0,frameTime = 0,frameTimeInit = slime.frameTimeInit,currentAnimation = "idle",
changeAnim = slime.changeAnim,changePos = slime.changePos,dx = 0, dy = 0,speed=slime.speed,flipH = 1,attack = false,attackDelay = 0,vida = slime.vida, spawnTime = 1}
  --table.insert(slimes,newSlime)
  angle = 0
end

function slime.update(dt,s,enemiesTb,index)
        if distance(player.x,player.y,s.x,s.y) < 24 and s.attackDelay <= 0 then
            s.currentAnimation = "attack"
            s.frameAtual = 0
            s.attack = true
            s.speed = 40
            s.anglex = math.atan2(player.y-s.y,player.x-s.x)
            s.attackDelay = slime.attackDelay
        elseif distance(player.x,player.y,s.x,s.y) > 24 then
            s.attack = false
            s.speed = 20
        end

        s.x = math.max(12,math.min(s.x,game.roomWidth-8))
        s.y = math.max(12,math.min(s.y,game.roomHeight-8))
end

function slime.draw()
  love.graphics.setColor(255,255,255,255)
end
