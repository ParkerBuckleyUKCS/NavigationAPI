function back()
    for i = 1,24 do
    
        turtle.back()

    end
end

function left()
  turtle.turnLeft()
  turtle.forward()
  turtle.forward()
  turtle.forward()
  turtle.turnRight()
end 

function log()
	if turtle.compare() then
		turtle.dig()
		turtle.forward()
	end
		while turtle.compareUp() do
			turtle.digUp()
			turtle.up()
		end
			while not turtle.detectDown() do
				turtle.down()
			end
		
	turtle.turnRight()
	turtle.turnRight()
	turtle.forward()
	turtle.turnRight()
	check()
	turtle.turnLeft()
end

function check()
	turtle.turnRight()
	count = 0
		if not turtle.detect()  
			then
			turtle.select(2)
			turtle.place()
			turtle.select(1)
				count = 1
		end
				count = 3
	   if turtle.compare() then
			log()
			count = 2
	   end

		if count == 2 
			then 
			turtle.turnRight()
			count = 0
		end

		if count == 1 
			then
			turtle.turnLeft()
			count = 0
		end

		if count == 3
			then turtle.turnLeft()
			count = 0
		end 			
end

function pass()
	turtle.forward()
	turtle.forward()
	turtle.forward()
	check()
	turtle.forward()
	turtle.forward()
	turtle.forward()
	check()
	turtle.forward()
	turtle.forward()
	turtle.forward()
	check()
	turtle.forward()
	turtle.forward()
	turtle.forward()
	check()
	turtle.forward()
	turtle.forward()
	turtle.forward()
	check()
	turtle.forward()
	turtle.forward()
	turtle.forward()
	check()
	turtle.forward()
	turtle.forward()
	turtle.forward()
	check()
	turtle.forward()
	turtle.forward()
	turtle.forward()
	check()
end


while true do
sleep(5)
turtle.select(1)
logs = turtle.getItemCount()

if (logs < 32) then
    turtle.suckDown(64)  
end

turtle.select(2)
saplings = turtle.getItemCount()

if (saplings < 64) then
    turtle.turnLeft()
    turtle.forward()
    turtle.suckDown((64-saplings))
    turtle.turnRight()
    turtle.turnRight()
    turtle.forward()
    turtle.turnLeft()
end

turtle.select(1)
turtle.forward()
turtle.forward()
turtle.forward()
turtle.turnRight()

  for i = 1,8 do
    pass()
    back()
    left()
  end
  
 turtle.turnRight()
    for i = 1,26 do
      turtle.forward()
    end
for i = 3,16 do
	turtle.select(i)
	turtle.dropDown()
end
  turtle.select(1)
  turtle.turnRight()
  turtle.turnRight()
end
 
