os.loadAPI("patternset.lua")
os.loadAPI("nav.lua")

--BEGIN USER AND MACHINE INPUT-------------------

-- ORE METADATA FOR COMPARISON IN COMPARE() FUNCTION

ores = {"minecraft:coal_ore","minecraft:gold_ore","minecraft:iron_ore","minecraft:lapis_ore","minecraft:diamond_ore","minecraft:redstone_ore","thermalfoundation:ore","techreborn:ore2","forestry:resources","mekanism:oreblock"}
blockcount = 0

function checkBlocks() -- RETURNS SPACE = 1,0 and # of EMPTY slots
    space = 1
    emptySlots = 0
    inventory = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
    inventoryComp = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0} --Arrays for XOR comparison
    inventoryXOR = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
        for i = 1,16 do
            turtle.select(i)
            inventory[i] = turtle.getItemCount()
        end
            for i = 1,16 do
                if (inventory[i] == inventoryComp[i])
                then inventoryXOR[i] = 1
                end
            end
                for i = 1,16 do
                    emptySlots = emptySlots + inventoryXOR[i]
                end
        if (emptySlots == 0) then
            space = 0
        end
end

function cleanInventory()
    for i = 1,16 do
    turtle.select(i)
        if (turtle.getItemCount() > 0) then
            potentialTrash = turtle.getItemDetail()
            trash = 1
                    for i = 1,#ores do
                        if (potentialTrash["name"] == ores[i]) then
                            trash = 0
                        end
                    end
            if (trash == 1) then
                turtle.drop()
                trash = 0
            end
        end
    end
end

function compare()
success, blockData = turtle.inspect()
oreAnalysis = 0         -- TAKES ORES AND RETURNS 1 IF COMPARE TRUE
    for i = 1,#ores do
        if (ores[i] == blockData["name"]) then
            oreAnalysis = 1
            blockcount = blockcount + 1
        end
    end
    
    if (oreAnalysis == 1) then
        print("Ore Found!")
    else do
        print("Ore not found")
    end
end
end 

function compareUp()
success, blockDataUp = turtle.inspect()
oreAnalysisUp = 0         -- TAKES ORES AND RETURNS 1 IF COMPARE TRUE
    for i = 1,#ores do
        if (ores[i] == blockDataUp["name"]) then
            oreAnalysisUp = 1
            blockcount = blockcount + 1
        end
    end
    
    if (oreAnalysisUp == 1) then
        print("Ore Found!")
    else do
        print("Ore not found")
    end
end
end 

function compareDown()
success, blockDataDown = turtle.inspect()
oreAnalysisDown = 0         -- TAKES ORES AND RETURNS 1 IF COMPARE TRUE
    for i = 1,#ores do
        if (ores[i] == blockDataDown["name"]) then
            oreAnalysisDown = 1
            blockcount = blockcount + 1
        end
    end
        if (oreAnalysisDown == 1) then
                print("Ore Found!")
            else do
                print("Ore not found")
        end
    end
end 

function othercheck()
    orient("left")
        compare()
        compareUp()
        compareDown()
                if (oreAnalysisUp == 1) then
                    turtle.digUp()
                    oreAnalysisUp = 0
                end
                    if (oreAnalysisDown == 1) then
                        turtle.digDown()
                        oreAnalysisDown = 0
                    end
            if (oreAnalysis == 1) then
                move((x-1),y,z)
                oreAnalysis = 0
                othercheck()
            end

    orient("back")
        compare()
        compareUp()
        compareDown()
                if (oreAnalysisUp == 1) then
                    turtle.digUp()
                    oreAnalysisUp = 0
                end
                    if (oreAnalysisDown == 1) then
                        turtle.digDown()
                        oreAnalysisDown = 0
                    end
            if (oreAnalysis == 1) then
                move(x,(y-1),z)
                oreAnalysis = 0
                othercheck()
            end 
               
    orient("right")
        compare()
        compareUp()
        compareDown()
                if (oreAnalysisUp == 1) then
                    turtle.digUp()
                    oreAnalysisUp = 0
                end
                    if (oreAnalysisDown == 1) then
                        turtle.digDown()
                        oreAnalysisDown = 0
                    end
            if (oreAnalysis == 1) then
                move((x+1),y,z)
                oreAnalysis = 0
                othercheck()
            end 
    orient("forward")
        compare()
        compareUp()
        compareDown()
                if (oreAnalysisUp == 1) then
                    turtle.digUp()
                    oreAnalysisUp = 0
                end
                    if (oreAnalysisDown == 1) then
                        turtle.digDown()
                        oreAnalysisDown = 0
                    end
            if (oreAnalysis == 1) then
                move(x,(y+1),z)
                oreAnalysis = 0
                othercheck()
            end 
end

-- MAIN RECURSIVE FUNCTION FOR MINING, CALLS OTHERCHECK IF NEEDED

function firstCheck()
 
    homex = x -- Waypoint to get back to mineshaft
    homey = y
    homez = z

    orient("left")
        compare()
        compareUp()
        compareDown()
                if (oreAnalysisUp == 1) then
                    turtle.digUp()
                    oreAnalysisUp = 0
                end
                    if (oreAnalysisDown == 1) then
                        turtle.digDown()
                        oreAnalysisDown = 0
                    end
            if (oreAnalysis == 1) then
                move((x-1),y,z)
                oreAnalysis = 0
                othercheck()
            end
        move(homex,homey,homez)


    orient("back")
        compare()
        compareUp()
        compareDown()
                if (oreAnalysisUp == 1) then
                    turtle.digUp()
                    oreAnalysisUp = 0
                end
                    if (oreAnalysisDown == 1) then
                        turtle.digDown()
                        oreAnalysisDown = 0
                    end
            if (oreAnalysis == 1) then
                move(x,(y-1),z)
                oreAnalysis = 0
                othercheck()
            end
        move(homex,homey,homez)


    orient("right")
        compare()
        compareUp()
        compareDown()
                if (oreAnalysisUp == 1) then
                    turtle.digUp()
                    oreAnalysisUp = 0
                end
                    if (oreAnalysisDown == 1) then
                        turtle.digDown()
                        oreAnalysisDown = 0
                    end
            if (oreAnalysis == 1) then
                move((x+1),y,z)
                oreAnalysis = 0
                othercheck()
            end
        move(homex,homey,homez)


    orient("forward")
        compare()
        compareUp()
        compareDown()
                if (oreAnalysisUp == 1) then
                    turtle.digUp()
                    oreAnalysisUp = 0
                end
                    if (oreAnalysisDown == 1) then
                        turtle.digDown()
                        oreAnalysisDown = 0
                    end
            if (oreAnalysis == 1) then
                move(x,(y+1),z)
                oreAnalysis = 0
                othercheck()
            end
        move(homex,homey,homez)
end
-- ===============================================================
-- ======================BEGIN MAIN FUNCTION FOR MINING===========
-- ===============================================================

write("Enter the radius of your pattern: ") 
radius = read()
radius = tonumber(radius)
print("Enter the world height of the turtle: ")
height = read()
height = tonumber(height)
miningDepth = height - 16


for  xMove = 0,radius do
    write("X")
    for yMove = 0,radius do
    write("Y")
        for zMove = 1,miningDepth do
    write("Z")
            goDown = -zMove 
            if (turtle.detectDown() == false) then
                if (z > -miningDepth) then
                    move(xMove,yMove,goDown)
                    firstCheck()
                    turtle.digDown()
                end
                if (z <= -miningDepth) then
                    move(xMove,yMove,0)
                end
            end             
        end
                move(xMove,yMove,0)
    end
end
           
