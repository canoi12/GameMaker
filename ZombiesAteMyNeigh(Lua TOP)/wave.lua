wave = {}
waves = {}

wave.size = 0
wave.actualSize = 0

waveAtual = 1
addWave = false
criaBaus = false
endWave = false
showMessage = false
local message = "Wave " .. waveAtual
messagex = 64
local messagey = 28

function showMessageF()
    
end

function countByType(table,type)
    size = 0
    for i,b in ipairs(table) do
        if b.object == type then
            size = size + 1
        end
    end
    return size
end

function wave.load()
    waves = {
        [1] = {
            [1] = createNewEnemy(50,128,"slime",0),
            [2] = createNewEnemy(128,50,"slime",0),
            [3] = createNewEnemy(90,200,"slime",0)
            --[[[3] = {x=90,y=200,width = slime.width, height = slime.height,anim=slime.anim,frameAtual = 0,frameTime = 0,frameTimeInit = slime.frameTimeInit,
            currentAnimation = "idle",changeAnim = slime.changeAnim,changePos = slime.changePos,dx = 0, dy = 0,
            speed=slime.speed,flipH = 1,attack = false,attackDelay = 0,vida = slime.vida,spawnTime = 3,type = "slime"}--]]
        },
        [2] = {
            [1] = createNewEnemy(50,128,"slime",1),
            [2] = createNewEnemy(128,50,"slime",1),
            [3] = createNewEnemy(90,200,"slime",1),
            [4] = createNewEnemy(150,64,"slime",1),
            [5] = createNewEnemy(128,200,"slime",1)
        }
    }
end

function wave.update(dt)
    if addWave then
        for i,e in ipairs(waves[waveAtual]) do
            table.insert(enemies,e)
        end
        --wave.size = countByType(enemies,"enemy")
        wave.size = table.getn(enemies)
        addWave = false
    end
    --wave.actualSize = countByType(objects,"enemy")
    wave.actualSize = table.getn(enemies)
    if wave.actualSize <= 0 and wave.size ~= 0 and endWave == false and showMessage == false then
        bau1 = createNewBau(116,128,"bau1")
        for i,e in ipairs(baus) do
            if e.object == "bau" and e.type == "bau1" then
                table.remove(baus,i)
                table.insert(baus,bau1)
            elseif e.object == "bau" and e.type == "bau2" then
                table.remove(baus,i)
                table.insert(baus,createNewBau(148,128,"bau2",bau1.option))
            end
        end
        endWave = true
        if waveAtual < table.getn(waves) then waveAtual = waveAtual + 1 end
        message = "Wave " .. waveAtual
    end 
    if showMessage then
        messagex = messagex - 0.5
        if messagex < -32 then
            showMessage = false
            addWave = true
        end
    end
end

function wave.draw()
    --hideMessage = hideMessage - 0.01
    if wave.actualSize > 0 then love.graphics.printf(wave.actualSize.."/"..wave.size,camera.x+26,camera.y,100,"left") end
    if showMessage then
        endWave = false
        love.graphics.print(message,camera.x+messagex,camera.y+messagey)
    end
end