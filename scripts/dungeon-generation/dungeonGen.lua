local dungeon = nil
local passableQuad = nil
local impasssableQuad = nil
local tileset = nil
local function gen(xmax, ymax)
    dungeon = {}
    for i=1, xmax do
        dungeon[i] = {}
        for j=1, ymax do
            -- over each cell
            passableTile = love.math.random(0, 100);
            local passableBool = false
            if(passableTile >= 35) then
                if((not (i == 1 or i == xmax)) and not(j == 1 or j == ymax)) then
                    -- randomly choose non-edge cells to be passable
                    passableBool = true
                end
            end
            -- salt map with chosen passable tiles
            dungeon[i][j] = {passable=passableBool}
        end
    end
    cellAutomata(xmax, ymax, r1, r2, loops)
end

function cellAutomata(xmax, ymax, r1, r2, loops)
    r1 = 1
    r1Thresh = 4
    loops = 2
    newDng = {}
    for curLoop=1, loops do
        for i=1, xmax do
            newDng[i] = {}
            for j=1, ymax do
                r1WallCount = getNearWalls(r1, i, j)

                if((r1WallCount > r1Thresh)) then
                    newDng[i][j] = {passable=false}
                else
                    newDng[i][j] = {passable=true}
                end

            end
        end
    end

    for i=2, xmax-1 do
        for j=2, ymax-1 do
            dungeon[i][j].passable = newDng[i][j].passable
        end
    end
end

function getNearWalls(radius, i, j)
    wallCount = 0
    for row = -radius, radius do
        for col = -radius, radius do
            if(dungeon[i+row] ~= nil) then
                tile = dungeon[i+row][j+col]
                if((tile ~= nil) and (tile.passable == false)) then
                    wallCount = wallCount + 1
                end
            end
        end
    end
    return wallCount
end

local function load(xmax, ymax)
    tileset = love.graphics.newImage('assets/floorset.png')
    passableQuad = love.graphics.newQuad(0, 0, 32, 32, 65, 32)
    impasssableQuad = love.graphics.newQuad(33, 0, 32, 32, 65, 32)
    gen(xmax, ymax)
end

local function getDungeon()
    return dungeon
end

local function getPassableQuad(passable)
    if passable then
        return passableQuad
    else
        return impasssableQuad
    end
end

local function getTileset()
    return tileset
end

local module = {}
module.load = load
module.getDungeon = getDungeon
module.getPassableQuad = getPassableQuad
module.getTileset = getTileset
module.gen = gen
return module
