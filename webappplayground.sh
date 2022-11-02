#!/bin/bash

#Just a basic menu to install / run juice shop on arch linux systems
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Alex's Web App Playground"
TITLE="Alex's Web App Playground"
MENU="Choose one of the following options:"

OPTIONS=(1 "Start Juice Shop"
         2 "Stop Juice Shop"
         3 "Start DVWA"
         4 "Stop DVWA"
         5 "Install Juice Shop (Docker)"
         6 "Install DVWA (Docker)")

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
            sudo docker run --name juiceshop -d -p 3000:3000 bkimminich/juice-shop
            sudo docker container ls
            echo "Go to: http://localhost:3000 to access the juice shop"
            ;;
        2)
            echo "Stopping Juice Shop"
            sudo docker stop juiceshop
            echo "Removing instance of Juice Shop"
            sudo docker rm juiceshop
            echo "Listing containers"
            sudo docker container ls
            ;;
        3) 
            echo "Starting DVWA"
            sudo docker run --name dvwa -d -p 80:80 vulnerables/web-dvwa
            sudo docker container ls
            echo "Go to: http://localhost:80 to access DVWA"
            echo "Username: Admin | Password: password"
            ;;
        4)
            echo "Stopping DVWA"
            sudo docker stop dvwa
            echo "Removing DVWA"
            sudo docker rm dvwa
            echo "Listing containers"
            sudo docker container ls
            ;;
        5)
            echo "Installing Juice Shop (Docker)"
            sudo pacman -Syu 
            sudo pacman -S docker
            sudo docker pull bkimminich/juice-shop
            echo "OWASP Juice Shop Installed."
            ;;
        6)
            echo "Installing DVWA (Docker)"
            sudo pacman -Syu
            sudo pacman -S docker
            sudo docker pull vulnerables/web-dvwa
            echo "DVWA installed."
            ;;
esac
