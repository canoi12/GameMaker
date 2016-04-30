weapon = {}

revolverImage = love.graphics.newImage("assets/revolver.png")
revolverImage:setFilter("nearest","nearest")

shotgunImage = love.graphics.newImage("assets/shotgun.png")
shotgunImage:setFilter("nearest","nearest")

function weapon_load()
    weapon = {
        ["revolver"] = {
            image = revolverImage,
            anim = {
              ["Up"] = {
                    [0]  = love.graphics.newQuad(0,0,16,16,48,48),
                    [1] = love.graphics.newQuad(16,0,16,16,48,48),
                    [2] = love.graphics.newQuad(32,0,16,16,48,48)
                },
              ["Down"] = {
                    [0]  = love.graphics.newQuad(0,32,16,16,48,48),
                    [1] = love.graphics.newQuad(16,32,16,16,48,48),
                    [2] = love.graphics.newQuad(32,32,16,16,48,48)
              },
              ["Side"] = {
                    [0]  = love.graphics.newQuad(0,16,16,16,48,48),
                    [1] = love.graphics.newQuad(16,16,16,16,48,48),
                    [2] = love.graphics.newQuad(32,16,16,16,48,48) 
              }
            },
            currentAnimation = "Down",
            frameAtual = 0,
            nivel = 0,
            flipH = -1,
            recuo = 2,
            angle = 0,
            x = player.x,
            y = player.y,
            ox = 8,
            oy = 8,
            cx = 18,
            cy = 22,
            bbox = {
                left = 0,
                right = 0,
                up = 0,
                down = 0
            }
        },
        ["shotgun"] = {
            image = shotgunImage,
            anim = {
             ["Up"] = {
                    [0]  = love.graphics.newQuad(0,0,16,16,48,48),
                    [1] = love.graphics.newQuad(16,0,16,16,48,48),
                    [2] = love.graphics.newQuad(32,0,16,16,48,48)
                },
             ["Down"] = {
                    [0]  = love.graphics.newQuad(0,32,16,16,48,48),
                    [1] = love.graphics.newQuad(16,32,16,16,48,48),
                    [2] = love.graphics.newQuad(32,32,16,16,48,48)
              },
             ["Side"] = {
                    [0]  = love.graphics.newQuad(0,16,16,16,48,48),
                    [1] = love.graphics.newQuad(16,16,16,16,48,48),
                    [2] = love.graphics.newQuad(32,16,16,16,48,48) 
              }
            },
            currentAnimation = "Down",
            frameAtual = 0,
            nivel = 0,
            flipH = 1,
            recuo = 3,
            angle = 0,
            x = player.x,
            y = player.y,
            ox = 8,
            oy = 8,
            cx = 18,
            cy = 22,
            bbox = {
                left = 0,
                right = 0,
                up = 0,
                down = 0
            }
        },
        ["metralhadora"] = {
            image = bau.iconImage,
            anim = {[""] = {
              [0]  = love.graphics.newQuad(18,18,9,9,27,27)
            }},
            currentAnimation = "",
            frameAtual = 0,
            nivel = 0,
            flipH = 1,
            recuo = 1,
            angle = 0,
            x = 0,
            y = 4,
            ox = 0,
            oy = 4,
            cx = 18,
            cy = 22,
            bbox = {
                left = 0,
                right = 0,
                up = 0,
                down = 0
            }
        },
        ["sword"] = {
            image = bau.iconImage,
            anim = {[""] = {
              [0]  = love.graphics.newQuad(9,9,9,9,27,27)
            }},
            currentAnimation = "",
            frameAtual = 0,
            nivel = 0,
            flipH = 1,
            recuo = 2,
            angle = 0,
            x = 0,
            y = 0,
            ox = 0,
            oy = 4,
            cx = 18,
            cy = 22,
            bbox = {
                left = 0,
                right = 0,
                up = 0,
                down = 0
            }
        }
    }
end

function weapon_update(dt)

end

function weapon_draw()

end