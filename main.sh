#!/bin/bash

while true; do
	CHOICE=$(whiptail --title "Desktop setup tool (by felix)" --menu "Choose an option:" 15 60 4 \
        "1" "Install Packages" \
        "2" "fstab generator" \
        "3" "alias generator" \
        "4" "Exit" 3>&1 1>&2 2>&3)

    exitstatus=$?

    if [ $exitstatus -ne 0 ]; then
        echo "User cancelled. Exiting..."
        exit
    fi


	case $CHOICE in
		1)
			chmod +x ./setup.sh
			./setup.sh
			;;
		2)
			chmod +x ./fsstab_generator.sh
			./fsstab_generator.sh
			;;
		3)
			chmod +x ./alias_generator.sh 
			./alias_generator.sh
			;;
		4)
			echo "Goodbye! Thanks for using my SetupTool"
			exit 0
			;;
		*)
			echo "Invalid option!"
			;;
	esac

	echo ""
	read -p "press Enter to return to the menu"
done