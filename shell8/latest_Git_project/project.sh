#!/bin/bash
if [ -z "$1" ]
then 
echo "Enter the project name"
exit 1
fi
log="./logs/log"
targetpath="/etc/www/html"
projectname="$1"
if [ ! -d "$targetpath/$projectname" ]
then
read -p "the project not exist, do you want to clone it from GitHup(Y/N): " answer
if [[ ${"answer",,} =~ ^y(es)?]]
then
git clone "https://github.com/Hussein-Hassan777/${projectname}.git" "$targetpath/$projectname" &> /dev/null 
if [ "$?" -eq 0 ]
then
echo "cloning $projectname from GitHub in $(date +%Y%m%d%H%M)" >> $log
else
echo "something goes wrong through cloning" >> $log
fi
fi
else
git -C "$targetpath/$projectname" pull &> /dev/null
if [ "$?" -eq 0 ]
then
echo "pulling $projectname from GitHub in $(date +%Y%m%d%H%M)" >> $log
else
echo "something goes wrong through pulling" >> $log
fi
fi

