debug = true
player = {x = 200, y = 710, img = nil, speed = 150}

function love.load(arg)
    player.img = love.graphics.newImage('assets/plane.png')
end

function love.update(dt)
    handleInput(dt)
end

function love.draw(dt)
    love.graphics.draw(player.img, player.x, player.y)
end

function handleInput(dt)
    if love.keyboard.isDown('escape') then
        love.event.push('quit')
    end

    if love.keyboard.isDown('left') then
        if player.x > 0 then
            player.x = player.x - (player.speed * dt)
        end
    elseif love.keyboard.isDown('right') then
        if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
            player.x = player.x + (player.speed * dt)
        end
    end
end
