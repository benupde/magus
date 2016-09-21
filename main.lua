debug = true
player = {x = 200, y = 710, img = nil, speed = 150}

canShoot = true
canShootTimerMax = 0.2
canShootTimer = canShootTimerMax
bulletImg = nil

bullets = {}

function love.load(arg)
    player.img = love.graphics.newImage('assets/plane.png')
    bulletImg = love.graphics.newImage('assets/bullet.png')
end

function love.update(dt)
    handleInput(dt)
    updateBullets(dt)
end

function love.draw(dt)
    love.graphics.draw(player.img, player.x, player.y)
    for i, bullet in ipairs(bullets) do
        love.graphics.draw(bullet.img, bullet.x, bullet.y)
    end
end

function handleInput(dt)
    if love.keyboard.isDown('escape') then
        love.event.push('quit')
    end

    if love.keyboard.isDown('left') then
        if player.x > 0 then
            player.x = player.x - (player.speed * dt)
        end
    end
    if love.keyboard.isDown('right') then
        if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
            player.x = player.x + (player.speed * dt)
        end
    end

    if love.keyboard.isDown('space', 'rctrl', 'lctrl', 'ctrl') and canShoot then
    	newBullet = { x = player.x + (player.img:getWidth()/2) - 3, y = player.y, img = bulletImg, speed = 250 }
    	table.insert(bullets, newBullet)
        newBullet = { x = player.x + (player.img:getWidth()/2) - 25, y = player.y, img = bulletImg, speed = 250 }
    	table.insert(bullets, newBullet)
    	canShoot = false
    	canShootTimer = canShootTimerMax
    end
end

function updateBullets(dt)
    canShootTimer = canShootTimer - (1 * dt)
    if canShootTimer < 0 then
      canShoot = true
    end
    for i, bullet in ipairs(bullets) do
        bullet.y = bullet.y - (bullet.speed * dt)
        if bullet.y < 0 then
            table.remove(bullets, i)
        end
    end
end
