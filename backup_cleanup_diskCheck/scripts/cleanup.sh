#!/bin/bash

path="$HOME/shell_scripts/shell6/backups"

mapfile -d '' -t files < <(find "$path" -type f -mtime +7 -print0)

for file in "${files[@]}"
do
echo "$file is over 7 days"
rm "$file"
echo "$file was deleted"
done

echo "cleaned up successfully"
