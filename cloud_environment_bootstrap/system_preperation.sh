#!/bin/bash
essencomm=(curl git docker)
sudo apt update
sudo apt full-upgrade -y
for i in "${essencomm[@]}"
do
if ! command -v "$i" &> /dev/null
then
echo "$i isn't installed"
read -p "do you want to install it (Yes/No): " state
if [[ ${state,,} == "yes" || ${state,,} == "y" ]]
then
sudo apt install -y "$i"
if command -v "$i" &> /dev/null
then
echo "the command installed successfully"
else
echo "ooh something goes wrong"
fi
fi
else
echo "$i is installed"
fi
done

mkdir -p ~/shell_scripts/shell4/cloud-project/{scripts,logs} 
touch ~/shell_scripts/shell4/cloud-project/README.txt

ls -R ~/shell_scripts/

sudo chmod a+rx ~/shell_scripts/shell4/cloud-project/scripts
sudo chmod 400 ~/shell_scripts/shell4/cloud-project/README.txt

ls -l ~/shell_scripts/shell4/cloud-project/README.txt

read -p "Enter your number: " number
if [[ $number =~ ^[+]?[0-9]+$ ]]
then
echo "valid number"
else
echo "invalid input"
fi
