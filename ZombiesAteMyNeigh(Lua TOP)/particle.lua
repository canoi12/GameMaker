particles = {}
particle = {}

particle_image = love.graphics.newImage("assets/particle.png")

function createNewParticle(x,y,speed,life)
    return {image = particle_image,x=x,y=y,life=life,alpha = 255,dx=0,dy=0,speed=speed,
    changePos = 0, changePosInit = 1,angle = 0}
end

function particle_load()
    particle.x = 0
    particle.y = 0
    particle.life = 0
    particle.alpha = 255
end

function particle_update(dt)
    math.randomseed(os.time())
    for i,p in ipairs(particles) do
        p.changePos = p.changePos - 0.01
        p.life = p.life - 0.1
        p.alpha = p.alpha - 1
        if p.changePos <= 0 then
            p.changePos = math.random(p.changePosInit+1)
            p.dx = math.random(256)
            p.dy = math.random(256)
            p.angle = math.atan2(p.dy-p.y,p.dx-p.x)
        end
        p.dx = p.speed * math.cos(p.angle)
        p.dy = p.speed * math.sin(p.angle)
        
        p.x = p.x + (p.dx*dt)
        p.y = p.y + (p.dy*dt)
        --[[if p.life <= 0 then
            table.remove(particles,i)
        end]]
        if p.x < 0 or p.x > 256 or p.y < 0 or p.y > 256 then
            table.remove(particles,i)
        end
    end
    while table.getn(particles) < 30 do
        math.randomseed(dt)
            table.insert(particles,createNewParticle(128,128,20,20))
    end
end

function particle_draw()
    for i,p in ipairs(particles) do
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(p.image,p.x,p.y)
    end
    love.graphics.setColor(255,255,255,255)
end