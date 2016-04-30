gamescreen = {}

gamescreen.wave = 1

objects = {
    
}
objects.baus = {
    [1] = {},
    [2] = {}
}

baus = {}


function sortTable(a,b)
    return a.y < b.y
end

function criarBaus()
    
end

function degreestoradian(angle)
    return angle * math.pi / 180
end

function collision(table)
    if table.object ~= "bau" then
      --[[for i,ob in ipairs(objects) do
          if table.x + table.bbox.left < ob.x + ob.bbox.left + ob.bbox.right and
            table.x + table.bbox.left + table.bbox.right > ob.x + ob.bbox.left and
            table.y + table.bbox.up < ob.y+ob.bbox.up+ob.bbox.down and
            table.y+table.bbox.up+table.bbox.down > ob.y + ob.bbox.up and
            table.object ~= ob.object then
            
            if table.x + table.bbox.left  < ob.x + ob.bbox.left  and
                table.y + table.bbox.up + table.bbox.down > ob.y + ob.bbox.up + 3 
                and table.y + table.bbox.up < ob.y + ob.bbox.up + 3 then
                  table.x = ob.x + ob.bbox.left -(table.bbox.left+table.bbox.right)
                  return true
            end
            if table.x + table.bbox.left + table.bbox.right > ob.x + ob.bbox.left + ob.bbox.right 
            and table.y + table.bbox.up + table.bbox.down > ob.y + ob.bbox.up + 3 
            and table.y + table.bbox.up < ob.y + ob.bbox.up + 3 then
                  table.x = ob.x + ob.bbox.left + ob.bbox.right - (table.bbox.left)
                  return true
            end
            if table.y + table.bbox.down + table.bbox.up  > ob.y + ob.bbox.up
              and table.y + table.bbox.up < ob.y + ob.bbox.up then
                  table.y = ob.y + ob.bbox.up -(table.bbox.up+table.bbox.down)
                  return true
            end
            if table.y + table.bbox.up  < ob.y + ob.bbox.down + ob.bbox.up and
              table.y + table.bbox.up + table.bbox.down > ob.y + ob.bbox.down + ob.bbox.up then
                  table.y = ob.y + ob.bbox.up + ob.bbox.down - table.bbox.up
                  return true
            end
            return true
          end
      end]]
      local width = 0.5 * (obj1.bbox.right + obj2.bbox.right - obj1.bbox.left - obj2.bbox.left)
      local height = 0.5 * (obj1.bbox.down + obj2.bbox.down - obj1.bbox.up - obj2.bbox.up)
      local dx = obj1.x - obj2.x
      local dy = obj1.y - obj2.y
      
      if math.abs(dx) <= width and math.abs(dy) <= height then
        wy = width * dy
        hx = height * dx
        
        if wy > hx then
          if wy > -hx then
            obj1.y = (obj2.y-obj2.oy+obj2.bbox.down) - (obj1.bbox.up-obj1.oy)
            return true
          else
            obj1.x = (obj2.x-obj2.ox+obj2.bbox.left) - (obj1.bbox.right-obj1.ox)
            return true
          end
        else
          if wy > -hx then
            obj1.x = (obj2.x-obj2.ox+obj2.bbox.right)+(obj1.ox-obj1.bbox.left)
            return true
          else
            obj1.y = (obj2.y-obj2.oy+obj2.bbox.up) - (obj1.bbox.down-obj1.oy)
            return true
          end
        end
        return true
      end
    end
    return false
end

function collision2obj(obj1,obj2)
        --[[if obj1.x + obj1.bbox.left < obj2.x + obj2.bbox.left + obj2.bbox.right and
           obj1.x + obj1.bbox.left + obj1.bbox.right > obj2.x + obj2.bbox.left and
           obj1.y + obj1.bbox.up < obj2.y+obj2.bbox.up+obj2.bbox.down and
           obj1.y+obj1.bbox.up+obj1.bbox.down > obj2.y + obj2.bbox.up and
           obj1.object ~= obj2.object then
           
           if obj1.x + obj1.bbox.left  < obj2.x + obj2.bbox.left  and
              obj1.y + obj1.bbox.up + obj1.bbox.down > obj2.y + obj2.bbox.up + 2 
              and obj1.y + obj1.bbox.up < obj2.y + obj2.bbox.up + obj2.bbox.down + 2 then
                obj1.x = obj2.x + obj2.bbox.left -(obj1.bbox.left+obj1.bbox.right)
                return true
           end
           if obj1.x + obj1.bbox.left + obj1.bbox.right > obj2.x + obj2.bbox.left + obj2.bbox.right 
           and obj1.y + obj1.bbox.up + obj1.bbox.down > obj2.y + obj2.bbox.up + 2 
           and obj1.y + obj1.bbox.up < obj2.y + obj2.bbox.up + obj2.bbox.down + 2 then
                obj1.x = obj2.x + obj2.bbox.left + obj2.bbox.right - (obj1.bbox.left)
                return true
           end
           if obj1.y + obj1.bbox.down + obj1.bbox.up  > obj2.y + obj2.bbox.up
            and obj1.y + obj1.bbox.up < obj2.y + obj2.bbox.up then
                obj1.y = obj2.y + obj2.bbox.up -(obj1.bbox.up+obj1.bbox.down)
                return true
           end
           if obj1.y + obj1.bbox.up  < obj2.y + obj2.bbox.down + obj2.bbox.up and
            obj1.y + obj1.bbox.up + obj1.bbox.down > obj2.y + obj2.bbox.down + obj2.bbox.up then
                obj1.y = obj2.y + obj2.bbox.up + obj2.bbox.down - obj1.bbox.up
                return true
           end
           return true
        end
    return false]]
    
    local width = 0.5 * (obj1.bbox.right + obj2.bbox.right - obj1.bbox.left - obj2.bbox.left)
    local height = 0.5 * (obj1.bbox.down + obj2.bbox.down - obj1.bbox.up - obj2.bbox.up)
    local x1 = obj1.x-obj1.ox
    local x2 = obj2.x-obj2.ox
    local y1 = obj1.y-obj1.oy
    local y2 = obj2.y-obj2.oy
    local dx = (x1+((obj1.bbox.left+obj1.bbox.right)/2)) - (x2+((obj2.bbox.left+obj2.bbox.right)/2))
    local dy = (y1+((obj1.bbox.up+obj1.bbox.down)/2)) - (y2+((obj2.bbox.up+obj2.bbox.down)/2))
    
    if math.abs(dx) <= width and math.abs(dy) <= height then
      wy = width * dy
      hx = height * dx
      
      if wy > hx then
        if wy > -hx then
          obj1.y = (obj2.y-obj2.oy+obj2.bbox.down) + math.abs(obj1.oy-obj1.bbox.up)
        else
          obj1.x = (obj2.x-obj2.ox+obj2.bbox.left) - math.abs(obj1.bbox.right-obj1.ox)
        end
      else
        if wy > -hx then
          obj1.x = (obj2.x-obj2.ox+obj2.bbox.right)+math.abs(obj1.ox-obj1.bbox.left)
        else
          obj1.y = (obj2.y-obj2.oy+obj2.bbox.up) - math.abs(obj1.bbox.down-obj1.oy)
        end
      end
      return true
    end
    return false
end


function gamescreen:load()
  gamescreen.bg = love.graphics.newImage("assets/bggame.png")
  gamescreen.bg:setWrap("repeat","repeat")

  gamescreen.bg:setFilter("nearest","nearest")

  gamescreen.bgquad = love.graphics.newQuad(0,0,game.roomWidth,game.roomHeight,gamescreen.bg:getDimensions())
  
  gamescreen.testbg = love.graphics.newImage("assets/mapa.png")
  gamescreen.bgimage = love.graphics.newImage("assets/map.png")
  gamescreen.bgimage:setFilter("nearest","nearest")
  
  gamescreen.testbg:setFilter("nearest","nearest")
  
  local mymap = love.filesystem.load("assets/teste mapa.lua")()
  
  local tileset1 = love.graphics.newImage(mymap.tilesets[1].image)
  
  tiles = {}
  
  
  local qtdTilesH = game.roomWidth/8
  local qtdTilesV = game.roomHeight/8
  k = 0
  
  for i=0,7 do
    for j=0,7 do
        tiles[k] = love.graphics.newQuad(j*8,i*8,8,8,64,64)
        k = k+1
    end
  end
  
  gamescreen.tilesBatch = love.graphics.newSpriteBatch(gamescreen.testbg,qtdTilesH*qtdTilesV)
  
  local cont = 0
  
  for i,aux in  ipairs(mymap.layers[1].data) do
    i = i - 1
    if i%32 == 0 and i > 0 then
      cont = cont + 1
    end
    --print((i%32)*8 .. " " .. cont*8)
    local x = i%32*8
    local y = cont*8
    local quad = tiles[aux-1]
    gamescreen.tilesBatch:add(quad,x,y)
  end
  
  
  --[[for i=0,qtdTilesH-1 do
    for j=0,qtdTilesV-1 do
        local x = j*8
        local y = i*8
        
        local auxi = i*32
        local quad = tiles[map[i][j]]
        --[[gamescreen.tilesBatch:add(quad,x,y)
    end
  end]]
  gamescreen.tilesBatch:flush()
  
  --[[for i=0,qtdTilesH do
    table.insert(map,{})
    for j=0,qtdTilesV do
        local x = j*8
        local y = i*8
        local quad = love.graphics.newQuad(math.random(8)*8,math.random(3)*8,8,8,64,64)
        table.insert(map[i],{x = x,y=y,quad = quad})
        gamescreen.tilesBatch:add(quad,x,y)
    end
    gamescreen.tilesBatch:flush();
  end

  for i,yy in ipairs(map) do
    for j,xx in ipairs(yy) do
        local x = j * 8
        local y = i * 8
        local quad = love.graphics.newQuad(32,0,8,8,64,64)
        gamescreen.tilesBatch.add(quad,x,y)
    end
    gamescreen.tilesBatch:flush();
  end]]

  player.load()
  bullet.load()
  slime.load()
  enemy.load()
  wave.load()
  bau.load()
  weapon_load()
  arvore_load();
  
  table.insert(objects,player)
  showMessage = true
  
  local part = love.graphics.newImage("assets/particle.png")
  
  particle_load()
end

function gamescreen:update(dt)

table.sort(objects,function(a,b) return a.y<b.y end)

  camerax = player.x - 32 --+ (16*player.dx)
  cameray = player.y - 32 --+ (16*player.dy)
  camera.x = math.max(0,math.min(camerax,game.roomWidth-64))
  camera.y = math.max(0,math.min(cameray,game.roomHeight-64))
  player.update(dt)
  bullet.update(dt)
  wave.update(dt)
  enemy.update(dt)
  bau.update(dt)
  
  for i,b in ipairs(objects) do
    objects[i] = nil
  end
  table.insert(objects,player)
  for i,b in ipairs(bullets) do
    table.insert(objects,b)
  end
  for i,b in ipairs(enemies) do
    table.insert(objects,b)
  end
  for i,b in ipairs(baus) do
    table.insert(objects,b)
  end
  for i,b in ipairs(arvores) do
    table.insert(objects,b)
  end
  
  --weapon[player.armaAtual].flipH = player.flipH
  --table.insert(objects, weapon[player.armaAtual])
  --[[for i,ob in ipairs(objects) do
    collision(ob)
  end]]
    
    table.sort(objects,function(a,b) return a.y<b.y end)
    
    particle_update(dt)
end

function gamescreen:draw()
  --love.graphics.draw(gamescreen.bg,gamescreen.bgquad,0,0)
  --love.graphics.print(table.getn(map[0]),50,50)
  love.graphics.draw(gamescreen.tilesBatch)
  --love.graphics.draw(gamescreen.bgimage,0,0)
  for i,ob in ipairs(objects) do
        love.graphics.draw(ob.image,ob.anim[ob.currentAnimation][ob.frameAtual],ob.x,ob.y,0,ob.flipH,1,ob.ox,ob.oy)
        --love.graphics.rectangle("line",ob.x-ob.ox+ob.bbox.left,ob.y-ob.oy+ob.bbox.up,ob.bbox.right-ob.bbox.left,ob.bbox.down-ob.bbox.up)
        if endWave then
            if ob.object == "bau" then
                love.graphics.draw(ob.balaoImage,ob.x,ob.y-10-math.sin(bau.i)*3,0,1,1,8,8)
                love.graphics.draw(bau.iconImage,ob.iconQuad,ob.x,ob.y-11-math.sin(bau.i)*3,0,1,1,4,4)
                --love.graphics.print(ob.option,ob.x,ob.y)
            end
        end
  end
  --love.graphics.draw(bau.iconImage,weapon[player.armaAtual].quad,weapon[player.armaAtual].x,weapon[player.armaAtual].y,degreestoradian(weapon[player.armaAtual].angle),player.flipH,1,0,2)
  --[[love.graphics.draw(particle,game.roomWidth/2,game.roomHeight/2)
  love.graphics.draw(particle,game.roomWidth/2,0)
  love.graphics.draw(particle,0,game.roomHeight/2)]]
  --player.draw()
  --bullet.draw()
  enemy.draw()
  wave.draw()
  particle_draw()
  playerteste:draw()
end

function gamescreen.keypressed(btn)
  player.keypressed(btn)
end
