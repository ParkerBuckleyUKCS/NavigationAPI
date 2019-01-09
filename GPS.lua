--=====GPS API=====
x = 0
y = 0
z = 0
d = 1
--[[ d = 1, forward
 d = 2, left
 d = 3, right
 d = 4, back
 turtle starts facing away from computer]] 
--=================
function orient(direction)
    if (direction == "left") then      
        if (d==1) then 
            turtle.turnLeft()
        elseif (d==3) then 
            turtle.turnLeft()
            turtle.turnLeft()
        elseif (d==4) then
            turtle.turnRight()
        end 
                d = 2
    end

    if (direction == "right") then
        if (d==1) then 
            turtle.turnRight()
        elseif (d==2) then 
            turtle.turnLeft()
            turtle.turnLeft()
        elseif (d==4) then
            turtle.turnLeft()
        end
                d = 3
    end
                
    if (direction == "forward") then
        if (d==3) then 
            turtle.turnLeft()
        elseif (d==4) then 
            turtle.turnLeft()
            turtle.turnLeft()
        elseif (d==2) then
            turtle.turnRight()
        end
                d = 1
    end

    if (direction == "back") then
        if (d==2) then 
            turtle.turnLeft()
        elseif (d==1) then 
            turtle.turnLeft()
            turtle.turnLeft()
        elseif (d==3) then
            turtle.turnRight()
        end
                d = 4
    end
end

-- MOVEMENT FUNCTIONS --

function go(blocks)
    for i = 1,blocks do
        turtle.dig()
        turtle.forward()
    end
end

function up(blocks)
    for i = 1,blocks do
    turtle.digUp()
    turtle.up()
    end
end

function down(blocks)
    for i = 1,blocks do
    turtle.digDown()
    turtle.down()
    end
end

-- MOVEMENT FUNCTIONS END-


-- MAIN FUNCTION ---------
function move(X,Y,Z)

    xdist = X - x
    ydist = Y - y
    zdist = Z - z

-- X MOVEMENT-------------
    if (xdist < 0) then
        xdist = xdist*(-1)
        orient("left")
        go(xdist)
                for i = 1,xdist do
                    x = x - 1
                end            
        xdist = 0
    end

    if (xdist > 0) then
        orient("right")           
        go(xdist)
                for i = 1,xdist do
                    x = x + 1
                end
        xdist = 0
    end
-- END X MOVEMENT ---------

-- Y MOVEMENT--------------
    if (ydist < 0) then
        ydist = ydist*(-1)
        orient("back")       
        go(ydist)
                for i = 1,ydist do
                    y = y - 1 
                end
        ydist = 0
    end

    if (ydist > 0) then
        orient("forward")           
        go(ydist)
                for i = 1,ydist do
                    y = y + 1
                end           
        ydist = 0
    end
-- END Y MOVEMENT ----------
    
-- Z MOVEMENT --------------
    if (zdist > 0) then        
        up(zdist)
            for i = 1,zdist do
                z = z + 1
            end        
        zdist = 0
    end

    if (zdist < 0) then
        zdist = zdist*(-1)       
        down(zdist)
            for i = 1,zdist do
                z = z - 1        
            end
        zdist = 0
    end

write("X: ")    print(x)
write("Y: ")    print(y)
write("Z: ")    print(z)
write("Direction: ")    print(d)

end

--BEGIN USER AND MACHINE INPUT-------------------

while true do
sleep(1)

write("Enter the Coordinate (x): ") 
X = read()
X = tonumber(X)

write("Enter the Coordinate (Y): ") 
Y = read()
Y = tonumber(Y)

write("Enter the Coordinate (Z): ") 
Z = read()
Z = tonumber(Z)

if (X and Y and Z) then
move(X,Y,Z)
end
end
