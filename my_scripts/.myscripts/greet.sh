#!/bin/bash

name=$1

user=$(whoami)
date=$(date)
whereami=$(pwd)

sleep 1
echo "Hello $name!"
sleep 1
echo "Hope you are having a good day!"
sleep 1
echo "Enjoy your session today, $name :) !"
sleep 1
echo "You are currently logged in as $user" 
echo "You are in the directory $whereami"
echo "Also today is: $date" 

echo "me: $me"
