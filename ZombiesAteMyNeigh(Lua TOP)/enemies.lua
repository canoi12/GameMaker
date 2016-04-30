enemy = {}

enemies = {}

function createNewEnemy(x,y,type,spawnTime,ox,oy,vida)
    
    if type == "slime" then
    ox = ox or slime.width/2
    oy = oy or slime.height/2
   return {angle = 0,object = "enemy",image = slime.image,x=x,y=y,width = slime.width, height = slime.height,anim=slime.anim,frameAtual = 0,frameTime = 0,frameTimeInit = slime.frameTimeInit,
            currentAnimation = "idle",changeAnim = slime.changeAnim,changePos = slime.changePos,dx = 0, dy = 0,
            speed=slime.speed,flipH = 1,anglex = 0,attack = false,attackDelay = 0,vida = vida or slime.vida,spawnTime = spawnTime,type = type
            ,ox = ox, oy = oy,
            bbox = {
            left = 2,
            right = 14,
            up = 8,
            down = 14}}
   end
   return {}
end

function walkoridle()
  math.randomseed(os.time())
  local odds = math.random(0,10)
  if odds < 2 then
    return "idle"
  end
  return "walking"
end

function randompos(x,y,area)
  math.randomseed(os.time())
  local dx
  local dy
  dx = x + math.random(-area, area)
  dy = y + math.random(-area, area)
  return dx,dy
end

function enemy.load()
    newSlime = {x=50,y=50,anim=slime.anim,frameAtual = 0,frameTime = 0,frameTimeInit = slime.frameTimeInit,
    currentAnimation = "idle", changeAnim = slime.changeAnim,changePos = slime.changePos,dx = 0, dy = 0,
    speed=slime.speed,flipH = 1,attack = false,attackDelay = 0,vida = slime.vida, spawnTime = 1,type = "slime"}
    --table.insert(enemies,newSlime)
end

function enemy.update(dt)
    if not(addWave) then
        for i, e in ipairs(enemies) do
            math.randomseed(os.time())
            if e.object == "enemy" then
                if e.vida <= 0 then
                    table.remove(enemies,i)
                end
            end
            -- Colisões --
            for i,b in ipairs(baus) do
                collision2obj(e,b);
            end
            
            for i,b in ipairs(arvores) do
                collision2obj(e,b);
            end
            
            
            --------
            e.spawnTime = e.spawnTime - 0.01
            if e.spawnTime <= 0 then
                e.frameTime = e.frameTime - 0.01
                e.changeAnim = e.changeAnim - 0.01
                e.changePos = e.changePos - 0.01
                e.attackDelay = e.attackDelay - 0.01
                if e.frameAtual < table.getn(e.anim[e.currentAnimation]) and e.frameTime <= 0 then
                    e.frameAtual = e.frameAtual + 1
                    e.frameTime = e.frameTimeInit
                elseif e.frameAtual >= table.getn(e.anim[e.currentAnimation]) and e.frameTime <= 0 then
                    e.frameAtual = 0
                    e.frameTime = e.frameTimeInit
                end
                if e.changeAnim <= 0 and e.attack == false then
                    e.frameAtual = 0
                    e.currentAnimation = walkoridle()
                    e.changeAnim = math.random(slime.changeAnim)
                end
                if e.changePos <= 0 and e.attack == false then
                    
                    e.dx,e.dy = randompos(e.x,e.y,64)
                    e.anglex = math.atan2(e.y-e.dy,e.x-e.dx)
                    e.changePos = math.random(slime.changePos)
                end
                if e.currentAnimation == "walking" or e.attack then
                    e.dx = e.speed * math.cos(e.anglex)
                    e.dy = e.speed * math.sin(e.anglex)
                    if e.x + (e.dx*dt) > e.x then
                        e.flipH = -1
                    else
                        e.flipH = 1
                    end
                    e.x = e.x + (e.dx*dt)
                    e.y = e.y + (e.dy*dt)
                end
                if e.type == "slime" then
                    slime.update(dt,e,enemies,i)
                end
                e.angle = 0
            end
        end
    end
end

function enemy.draw()
  love.graphics.setColor(255,255,255,255)
end