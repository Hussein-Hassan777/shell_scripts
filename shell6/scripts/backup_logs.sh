#!/bin/bash


currentdate=$(date +%y%m%d)

path="$HOME/shell_scripts/shell6/backups/backups_${currentdate}"

mkdir -p "$path"

mapfile -t files < <(sudo find /var/log/ -maxdepth 1 -type f -name *.log)

for file in "${files[@]}"
do
sudo cp "$file" "$path/" 
done

sudo tar -cjf "$path.tbz2" -C "$HOME/shell_scripts/shell6/backups/" "backups_${currentdate}"
rm -rf "$path"

echo "successfully backup...$backups_${currentdate}.tbz2 created in $HOME/shell_scripts/shell6/backups/"
