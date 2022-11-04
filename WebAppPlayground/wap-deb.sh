#!/bin/bash

#Just a basic menu to install / run juice shop on arch linux systems
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Alex's Web App Playground"
TITLE="Alex's Web App Playground"
MENU="Choose one of the following options:"

OPTIONS=(1 "Launch Docker (Required)"
         2 "Stop docker"
         3 "Start Juice Shop"
         4 "Stop Juice Shop"
         5 "Start DVWA"
         6 "Stop DVWA"
         7 "Install Juice Shop (Docker)"
         8 "Install DVWA (Docker)")

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
            echo "Starting Docker"
            sudo systemctl start docker
            sudo docker container ls
            ;;
        2)
            echo "Stopping docker"
            sudo systemctl stop docker
            ;;
        3)
            echo "Starting Juice Shop"
            sudo docker run --name juiceshop -d -p 3000:3000 bkimminich/juice-shop
            sudo docker container ls
            echo "Go to: http://localhost:3000 to access the juice shop"
            ;;
        4)
            echo "Stopping Juice Shop"
            sudo docker stop juiceshop
            echo "Removing instance of Juice Shop"
            sudo docker rm juiceshop
            echo "Listing containers"
            sudo docker container ls
            ;;
        5) 
            echo "Starting DVWA"
            sudo docker run --name dvwa -d -p 80:80 vulnerables/web-dvwa
            sudo docker container ls
            echo "Go to: http://localhost:80 to access DVWA"
            echo "Username: Admin | Password: password"
            ;;
        6)
            echo "Stopping DVWA"
            sudo docker stop dvwa
            echo "Removing DVWA"
            sudo docker rm dvwa
            echo "Listing containers"
            sudo docker container ls
            ;;
        7)
            echo "Installing Juice Shop (Docker)"
            sudo apt update && sudo apt  upgrade 
            sudo apt install docker
            sudo docker pull bkimminich/juice-shop
            echo "OWASP Juice Shop Installed."
            ;;
        8)
            echo "Installing DVWA (Docker)"
            sudo apt update && sudo apt upgrade
            sudo apt install docker
            sudo docker pull vulnerables/web-dvwa
            echo "DVWA installed."
            ;;
esac
