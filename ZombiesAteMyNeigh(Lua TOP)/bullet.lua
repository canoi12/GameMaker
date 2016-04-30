bullets = {}

bullet = {}

function createNewBullet(vx,vy)
    local newBullet = {angle = 0,object = "bullet",image = bullet.image,x = weapon[player.armaAtual].x, y = weapon[player.armaAtual].y, vx = vx, vy = vy, i = 0,width=8,height = 8,flipH = 1,frameAtual = 0,currentAnimation = "",anim = {[""] = {[0] = love.graphics.newQuad(0,0,8,8,8,8)}},ox=4,oy=4}
    newBullet.bbox = {
            left = 0,
            right = 8,
            up = 0,
            down = 8
    }
    return newBullet
end

function bullet.load()
  bullet.x = 0
  bullet.y = 0
  bullet.speed = 100
  bullet.image = love.graphics.newImage("assets/bubble.png")
  
  bullet.width = 8
  bullet.height = 8

  bullet.image:setFilter("nearest","nearest")

  bullet.vx = 0
  bullet.vy = 0
  
  bullet.anim = {
      [""] = {
          [0] = love.graphics.newQuad(0,0,8,8,8,8)
      }
  }

  bullet.i = 0
end

function bullet.update(dt)
  for i,b in ipairs(bullets) do
    if b.object == "bullet" then
        b.x = b.x + (b.vx*dt)
        b.y = b.y + (b.vy*dt)
        b.i = b.i + 0.5
        if b.vx == 0 then
        b.x = b.x + math.sin(b.i)
        else
        b.y = b.y + math.cos(b.i)
        end
        if b.i % (math.pi*2) == 0 then
        b.i = 0
        end
        if b.x < 0 or b.x > camera.x + 64 or b.y < 0 or b.y > camera.y + 64 then
        table.remove(bullets,i)
        end
    end
    for j,e in ipairs(enemies) do
        if collision2obj(b,e) then
            e.vida = e.vida - 1
            table.remove(bullets,i)
            break
        end
    end
  end
end

function bullet.draw()
  --[[for i,b in ipairs(bullets) do
    love.graphics.draw(bullet.image,b.x,b.y)
  end--]]

end
