#!/bin/bash

currentdate=$(date +%y%m%d)
path="$HOME/shell_scripts/shell6/logs/log_$(date +%y%m%d).txt"

used=$( df / | awk ' NR==2 {print $3}' )
available=$( df / | awk ' NR==2 {print $4}' )
percentage=$(( 100 * used / ( used + available )))
echo "you have used $((used/1024/1024)) GB of your disk and there are $((available/1024/1024)) GB left" > "$path"
if (( percentage > 80 ))
then
echo "warning...you used more than 80% of your disk" >> "$path"
fi

