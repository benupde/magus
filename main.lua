local dungeonGenerator = require("scripts.dungeon-generation.dungeonGen")
function love.load(arg)
    dungeonGenerator.load(17, 17)
end

function love.update(dt)
    handleInput(dt)
end

function love.draw(dt)
    d = dungeonGenerator.getDungeon()
    for xind,xval in ipairs(d) do
        for yind,yval in ipairs(xval) do
            love.graphics.draw(dungeonGenerator.getTileset(), dungeonGenerator.getPassableQuad(yval.passable), xind*32, yind*32)
        end
    end
end

function handleInput(dt)
    if love.keyboard.isDown('escape') then
        love.event.push('quit')
    end
    if love.keyboard.isDown('left') then
    end
    if love.keyboard.isDown('right') then
    end
    if love.keyboard.isDown('p') then
        if(not love.window.getFullscreen()) then
            love.window.setMode(800, 600, {fullscreen=true, fullscreentype='exclusive'})
        else
            love.window.setMode(800, 600, {fullscreen=false, fullscreentype='exclusive'})
        end
    end
    if love.keyboard.isDown('g') then
        dungeonGenerator.gen(17, 17)
    end
end

function updateProjectiles(dt)

end

function updateEnemies(dt)

end
