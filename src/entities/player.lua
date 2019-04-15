local Player = {}

Player.__index = Player

function Player:new(params)
    local inst = setmetatable({}, self)

    inst.x = params.x or 40
    inst.y = params.y or 40
    inst.w = 32
    inst.h = 32
    inst.colour = { 0.75, 0, 0, 1 }
    inst.speed = 500
    inst.gravity = 2000
    inst.terminalVelocity = 1000
    inst.dy = 0
    inst.jumpSpeed = -1000

    return inst
end

function Player:update(dt)
    self:move(dt)
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

function Player:move(dt)
    local dx = 0
    if love.keyboard.isDown('d') or love.keyboard.isDown('right') then
        dx = dx + self.speed
    end
    if love.keyboard.isDown('a') or love.keyboard.isDown('left') then
        dx = dx - self.speed
    end
    if self:isGrounded() then
        -- TODO: Temp fix to prevent player falling through 'floor'
        self.y = love.graphics.getHeight() - self.h
        if love.keyboard.wasPressed('space') then
            self.dy = -1000
        else
            self.dy = 0
        end
    else
        if self.dy < self.terminalVelocity then
            self.dy = self.dy + self.gravity * dt
        end
    end
    self.x, self.y = (self.x + dx * dt) % love.graphics.getWidth(), self.y + self.dy * dt
end

function Player:isGrounded()
    return (self.y + self.h) >= love.graphics.getHeight()
end

return Player