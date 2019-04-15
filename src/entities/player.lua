local Player = {}

Player.__index = Player

function Player:new(params)
    local inst = setmetatable({}, self)

    inst.x = params.x or 40
    inst.y = params.y or 40
    inst.w = 32
    inst.h = 32
    inst.colour = { 0.75, 0, 0, 1 }

    return inst
end

function Player:update(dt)

end

function Player:draw()
    love.graphics.setColor(self.colour)
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
    love.graphics.setColor(0, 0, 0)
    love.graphics.setLineWidth(2)
    love.graphics.rectangle('line', self.x, self.y, self.w, self.h)
    love.graphics.setColor(1, 1, 1)
    love.graphics.setLineWidth(1)
end

return Player