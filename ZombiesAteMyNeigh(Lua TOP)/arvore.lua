arvores = {}
arvore = {}

arvore.image = love.graphics.newImage("assets/arvore1.png");

arvore.image:setFilter("nearest","nearest")
arvore.quad = love.graphics.newQuad(0,0,32,32,32,32);

function createNewArvore(x,y)
    return {image = arvore.image,object = "arvore",x=x,y=y,width = 32,height=32,anim = {[""] = {[0] = arvore.quad}},ox = 16,oy=16,flipH=1,currentAnimation=""
    ,frameAtual=0,type=0,bbox = {left = 8, right = 24, up = 16, down = 32},angle=0}
end

function arvore_load()
    table.insert(arvores,createNewArvore(40,40))
    table.insert(arvores,createNewArvore(56,48))
    table.insert(arvores,createNewArvore(216,16))
    table.insert(arvores,createNewArvore(152,72))
    table.insert(arvores,createNewArvore(32,120))
    table.insert(arvores,createNewArvore(132,112)) -- Arvore do centro
    table.insert(arvores,createNewArvore(232,104))
    table.insert(arvores,createNewArvore(168,160))
    table.insert(arvores,createNewArvore(40,208))
    table.insert(arvores,createNewArvore(48,224))
    table.insert(arvores,createNewArvore(192,208))
end

function arvore_update(dt)

end

function arvore_draw()

end