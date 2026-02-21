#!/bin/bash
read -p "enter your name: " name
myfile=./file_of_$name
echo "Name: $name" > $myfile
echo "" >> $myfile
read -p "enter your age: " age
echo "Age: $age" >> $myfile
echo "" >> $myfile
read -p "enter your address: " address
echo "Address: $address" >> $myfile
echo "" >> $myfile
read -p "enter your countery: " countery
echo "Country: $countery" >> $myfile
echo "" >> $myfile
echo "" >> $myfile
echo "All your info saved in $myfile" >> $myfile
