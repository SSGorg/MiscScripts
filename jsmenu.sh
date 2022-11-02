#!/bin/bash

#Just a basic menu to install / run juice shop on arch linux systems
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Alex's Juice Shop Menu"
TITLE="Alex's Juice Shop Menu"
MENU="Choose one of the following options:"

OPTIONS=(1 "Start Juice Shop"
         2 "Stop Juice Shop"
         3 "Install Juice Shop (Docker)")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            echo "Starting Juice Shop"
            sudo  docker run --name juiceshop -d -p 3000:3000 bkimminich/juice-shop
            ;;
        2)
            echo "Stopping & Removing Juice Shop"
            sudo docker stop juiceshop
            sudo docker rm juiceshop
            ;;
        3)
            echo "Installing Juice Shop (Docker)"
            sudo pacman -Syu 
            sudo pacman -S docker
            sudo docker pull bkimminich/juice-shop
            ;;
esac
