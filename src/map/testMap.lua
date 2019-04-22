local TestMap = {}

GRID_SIZE = 40
local xSize = love.graphics.getWidth() / GRID_SIZE
local ySize = love.graphics.getHeight() / GRID_SIZE

for y = 1, ySize do
    TestMap[y] = {}
    for x = 1, xSize do
        if x == 1 or x == xSize or y == 1 or y == ySize then
            TestMap[y][x] = 1
        else
            TestMap[y][x] = 0
        end
    end 
end

function TestMap:isSolid(x, y)
    return self[y][x] == 1
end

return TestMap