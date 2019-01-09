# NavigationAPI
A navigation script for Turtle GPS tracking and pathing

This is a project for computercraft (https://github.com/dan200/ComputerCraft) made for the popular sandbox game, Minecraft.

This API allows for an ingame sentient block, otherwise known as a turtle, to navigate the world.
Normally turtles in computecraft must use basic commands from the console such as turtle.forward(1) to move forward one block.

With my API, users can simply enter XYZ coordinates relative to the turtles starting position to path to that point in space.
This API allows for much more complex scripts to be written in a fraction of the codebase 
(As my Recursive mining program demonstrates).

functions added include

orient(int n)
user enters 1,2,3,4 for corresponding sides.

go(int n)
go forward n blocks

up(int n)
go up n blocks

down(int n)         
go down n blocks

move(int x,y,z)     
move to a point XYZ relative to starting position.


TURTLE WILL KEEP TRACK OF CURRENT POSITION, negative coordinates will correspond to standard cartesian coordinates.
