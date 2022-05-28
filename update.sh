#!/bin/bash

#update the system, autoremove & autoclean then reboot

#echo "* * * 2 * root ../update.sh" >> crontab

sudo apt update && sudo apt dist-upgrade -y
sudo apt autoremove -y && sudo apt autoclean -y
sudo init 6
