#!/bin/bash
# System Updates
sudo apt-get update -y
sudo apt-get full-upgrade --fix-missing -y
sudo apt-get autoremove -y

echo 'It is recomended to reboot your system after the update '

echo 'ENTER 1 TO AUTOMATICALLY RESTART YOUR SYSTEM ...'
read decision
if [ $decision -eq 1 ] 
then init 6
fi