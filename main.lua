Player = require('src.entities.player')

function love.load()
    player = Player:new{}
end

function love.update(dt)
    player:update(dt)
end

function love.draw()
    love.graphics.setBackgroundColor(0, 0.5, 0.75)
    player:draw()
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end