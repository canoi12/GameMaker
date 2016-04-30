bau = {
    options = {
        [0] = love.graphics.newQuad(0,0,9,9,27,27),
        [1] = love.graphics.newQuad(9,0,9,9,27,27),
        [2] = love.graphics.newQuad(18,0,9,9,27,27),
        [3] = love.graphics.newQuad(0,9,9,9,27,27),
        [4] = love.graphics.newQuad(9,9,9,9,27,27),
        [5] = love.graphics.newQuad(18,9,9,9,27,27),
        [6] = love.graphics.newQuad(0,18,9,9,27,27),
        [7] = love.graphics.newQuad(9,18,9,9,27,27),
        [8] = love.graphics.newQuad(18,18,9,9,27,27)
    }
}
bauImage = love.graphics.newImage("assets/bau1 spritesheet.png")
bauQuad1 = love.graphics.newQuad(0,0,16,16,16,32)
bauQuad2 = love.graphics.newQuad(0,16,16,16,16,32)

local balaoImage = love.graphics.newImage("assets/balao.png")
bau.iconImage = love.graphics.newImage("assets/icones/icones.png")


function createNewBau(x,y,type,opt)
    math.randomseed(os.time())
    local option = math.random(8)
    while option == opt do
        option = math.random(8)
    end
    return {iconQuad = bau.options[option],balaoImage = balaoImage, image = bauImage,object = "bau",x=x,y=y,width = 16,height=16,anim = {[""] = {[0] = bauQuad1, [1] = bauQuad2}},ox = 8,oy=8,flipH=1,currentAnimation="",frameAtual=0,option=option
    ,type=type,bbox = {left = 0, right = 16, up = 8, down = 14},angle=0}
end

function bau.load()
  
  bauImage:setFilter("nearest","nearest")
  balaoImage:setFilter("nearest","nearest")
  bau.iconImage:setFilter("nearest","nearest")
  
  --[[objects.baus[1].image = bauImage
  objects.baus[2].image = bauImage
  
  objects.baus[1].ox = 8
  objects.baus[1].oy = 8
  
  objects.baus[2].ox = 8
  objects.baus[2].oy = 8
  
  objects.baus[1].anim = {
      [""]= {
        [0] = bauQuad1,
        [1] = bauQuad2
      }
  }
  objects.baus[2].anim = {
      [""] = {
        [0] = bauQuad1,
        [1] = bauQuad2
      }
  }
  
   objects.baus[1].currentAnimation = ""
   objects.baus[2].currentAnimation = ""
   
   objects.baus[1].frameAtual = 0
   objects.baus[2].frameAtual = 0
   
   objects.baus[1].x = 112
   objects.baus[1].y = 128
   
   objects.baus[2].x = 144
   objects.baus[2].y = 126
   
   objects.baus[1].object = "bau"
   objects.baus[2].object = "bau"
   
   objects.baus[1].option = math.random(8)
   local odds = objects.baus[1].option
   while odds == objects.baus[1].option do
    odds = math.random(8)
   end
   
   objects.baus[2].option = odds
   
   objects.baus[1].iconQuad = bau.options[objects.baus[1].option]
   objects.baus[2].iconQuad = bau.options[objects.baus[2].option]
   
   objects.baus[1].balaoImage = balaoImage
   objects.baus[2].balaoImage = balaoImage]]
   baus = {}
   
   bau1 = createNewBau(116,128,"bau1")
   table.insert(baus,bau1)
   table.insert(baus,createNewBau(148,128,"bau2",bau1.option))
   
   bau.i = 0

end

function bau.update(dt)
    if endWave then
        for i,b in ipairs(baus) do
            if b.object == "bau" then
                --for j,c in ipairs(objects) do
                    --if c.object == "player" then
                        if distance(b.x,b.y,player.x,player.y) < 8 then
                            if love.keyboard.isDown("z","Z") then
                                endWave = false
                                showMessage = true
                                messagex = 64
                                b.frameAtual = 0
                                if b.option == 8 then
                                    player.armaAtual = "shotgun"
                                elseif b.option == 7 then
                                    player.armaAtual = "revolver"
                                end
                                break
                            end
                            b.frameAtual = 1
                        else
                            b.frameAtual = 0
                        end
                    --end
                --end
            end
        end
    end
    
    bau.i = bau.i + 0.1
    if bau.i % (math.pi*2) == 0 then
        bau.i = 0
    end
end

function bau.draw()

end