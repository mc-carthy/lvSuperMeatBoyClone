local Player = require('src.entities.player')
local Collision = require('src.util.collision')

function love.load()
    love.keyboard.keysPressed = {}
    player = Player:new{}
    blocks = {
        { 
            x = 400,
            y = 400,
            w = 32,
            h = 32
        }
    }
end

function love.update(dt)
    player:update(dt)
    local resolveVector = Collision.resolveStatic(player, blocks[1])
    player.x, player.y = player.x + resolveVector.x, player.y + resolveVector.y

    love.keyboard.keysPressed = {}
end

function love.draw()
    love.graphics.setBackgroundColor(0, 0.5, 0.75)
    love.graphics.setColor(0.5, 0.5, 0.5)
    -- for _, block in pairs(blocks) do
    local block = blocks[1]
        love.graphics.rectangle('fill', block.x, block.y, block.w, block.h)
        love.graphics.setColor(0, 0, 0)
        love.graphics.rectangle('line', block.x, block.y, block.w, block.h)
    -- end
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