#!/bin/bash

if [[ -z "$1" ]]
then
echo "Error: project path (including project name) is missing."
exit 1
fi

project_path="$1"
[[ "$project_path" == ~* ]] && project_path="${project_path/#~/$HOME}"
mkdir -p "$project_path"
! [[ "$project_path" == */ ]] && project_path="${project_path}/"

mkdir -p "${project_path}src/"
mkdir -p "${project_path}tests/"
mkdir -p "${project_path}docs/"
touch "${project_path}.gitignore"
touch "${project_path}README.md"

read -p "do you want the file of LICENSE (Y/N): " answer
[[ "${answer,,}" =~ y(es)? ]] && touch "${project_path}LICENSE"

git -C "$project_path" init
grep -qxF "*.log" "${project_path}.gitignore" || echo -e "*.log" >> "${project_path}.gitignore"
grep -qxF "*.tmp" "${project_path}.gitignore" || echo -e "*.tmp" >> "${project_path}.gitignore"

git -C "$project_path" add .
git -C "$project_path" commit -m "initial commit"


GitHub() {
cd "$project_path"
read -p "Enter an alias name for the remote repo: " myalias
while git remote | grep -Fqw "$myalias"
do
read -p "that alias name is already exising try another name: " myalias
done

read -p "Enter your GitHub remote URL (e.g., https://github.com/user/repo.git): " myaccount
if ! git remote add "$myalias" "$myaccount"
then
echo "something goes wrong in remote add"
return 1
fi

read -p "Enter the name of branch that will be used with the remote repo: " mybranch
while git branch --format='%(refname:short)' | grep -Fqw "$mybranch"
do
read -p "that alias name is already exising try another name: " mybranch
done

git branch "$mybranch"
git checkout "$mybranch"
 
if ! git push -u "$myalias" "$mybranch"
then
echo "something goes wrong in push"
return 1
fi
cd -
}

read -p "do you want to add this repo to your GitHub Y/N: " answer
if [[ "${answer,,}" =~ y(es)? ]]
then
if GitHub
then
echo "repo is added successfully!"
else
echo "something goes wrong!"
fi
fi

exit 0
