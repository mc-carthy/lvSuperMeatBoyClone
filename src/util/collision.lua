local Collision = {}

function Collision.minkowskiRect(rect1, rect2)
    local minkRect = {}
    minkRect.x = rect1.x - rect2.x - rect2.w
    minkRect.y = rect1.y - rect2.y - rect2.h
    minkRect.w = rect1.w + rect2.w
    minkRect.h = rect1.h + rect2.h
    return minkRect
end

function Collision.pointInRect(point, rect)
    return (
        point.x > rect.x and point.x < rect.x + rect.w and
        point.y > rect.y and point.y < rect.y + rect.h
    )
end

function Collision.resolveStatic(kinematicRect, staticRect)
    local minkRect = Collision.minkowskiRect(kinematicRect, staticRect)
    if Collision.pointInRect({ x = 0, y = 0}, minkRect) then
        local smallestX = math.abs(minkRect.x) < math.abs(minkRect.x + minkRect.w) and minkRect.x or (minkRect.x + minkRect.w)
        local smallestY = math.abs(minkRect.y) < math.abs(minkRect.y + minkRect.h) and minkRect.y or (minkRect.y + minkRect.h)
        local returnVector = { x = 0, y = -smallestY }
        if math.abs(returnVector.x) > math.abs(returnVector.y) then
            returnVector.y = 0
        elseif math.abs(returnVector.x) < math.abs(returnVector.y) then
            returnVector.x = 0
        end
        return returnVector
    end
    return nil
end

return Collision