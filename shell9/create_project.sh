#!/bin/bash

#test(){
#if [[ "$1" -eq 0 ]]
#then
#echo "the $1 is done successfully"
#else
#echo "Ooh, something goes wrong"


read -p "Enter the name of your project: " project_name

today=$(date)
outside_path="$HOME/project_creation"
project_path="$outside_path/$project_name"
log_path="$project_path/logs/log${today}"
creation(){
if [[ -d "$outside_path/$project_name" ]] 
then
mkdir -p "$project_path/logs"
touch "$log_path"
echo "the project is already existed" >> "$log_path"
return 1
fi
mkdir -p "$project_path/src"
mkdir -p "$project_path/logs"
touch "$log_path"
mkdir -p "$project_path/backups"
mkdir -p "$project_path/tests"
echo "the project creation is successfully done" >> "$log_path"
return 0
}


while true
do

read -p "type..C for creation, anything for nothing" answer
answer="${answer,,}"

case "$answer" in

"c")
creation
;;

*)
break
;;
esac


done
