#!/bin/bash

mkdir -p ~/shell_scripts/shell5/reports/
report="$HOME/shell_scripts/shell5/reports/report_$(date +%y%m%d).txt"


whoami > "$report"


read -p "Enter your path: " path
[[ "$path" == "~" ]] && path="$HOME"

mapfile -t content < <(ls -F "$path")

dirs=0
files=0
for i in "${content[@]}"
do
if [[ "$i" == */ ]]
then
((dirs++))
else
((files++))
fi
done

echo "the number of directories: $dirs" >> "$report"
echo "the number of files: $files" >> "$report"

commands=(curl git docker)

for i in "${commands[@]}"
do
if command -v "$i" &> /dev/null
then
echo "$i is already installed" >> "$report"
else
echo "$i is not installed" >> "$report"
fi
done

cat "$report"

