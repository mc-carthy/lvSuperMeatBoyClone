Player = require('src.entities.player')

function love.load()
    love.keyboard.keysPressed = {}
    player = Player:new{}
end

function love.update(dt)
    love.keyboard.keysPressed = {}
    player:update(dt)
end

function love.draw()
    love.graphics.setBackgroundColor(0, 0.5, 0.75)
    player:draw()
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
    if key == 'escape' then
        love.event.quit()
    end
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end