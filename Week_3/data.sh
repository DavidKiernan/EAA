#!/bin/bash  

echo "Enter Name: "
read $name
echo"\n"
echo "Month Born: "
read $month
echo "\nFavourite Colour: "
read $colour

printf "Hello "+ $name +" you were born in "+ $month + " and your favourite colour is " + $colour

