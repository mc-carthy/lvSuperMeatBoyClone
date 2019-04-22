local Player = require('src.entities.player')
local Map = require('src.map.testMap')
Collision = require('src.util.collision')

function love.load()
    love.keyboard.keysPressed = {}
    player = Player:new{}
    blocks = {
        { 
            x = 00,
            y = 400,
            w = love.graphics.getWidth() / 2,
            h = 32
        },
        { 
            x = love.graphics.getWidth() / 2,
            y = 480,
            w = love.graphics.getWidth() / 2,
            h = 32
        }
    }
end

function love.update(dt)
    player:update(dt)
    love.keyboard.keysPressed = {}
end

function love.draw()
    love.graphics.setBackgroundColor(0, 0.5, 0.75)
    for y = 1, #Map do
        for x = 1, #Map[y] do
            if Map[y][x] == 1 then
                love.graphics.setColor(0, 0, 0)
            else
                love.graphics.setColor(0.5, 0.5, 0.5)
            end
            love.graphics.rectangle('fill', (x - 1) * 40, (y - 1) * 40, 40, 40)
        end
    end
    for _, block in pairs(blocks) do
        love.graphics.setColor(0.5, 0.5, 0.5)
        love.graphics.rectangle('fill', block.x, block.y, block.w, block.h)
        love.graphics.setColor(0, 0, 0)
        love.graphics.rectangle('line', block.x, block.y, block.w, block.h)
    end


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