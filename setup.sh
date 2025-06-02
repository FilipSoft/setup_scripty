#!/bin/bash
sudo apt update

# Check if whiptail is installed
if ! command -v whiptail &> /dev/null; then
    echo "whiptail not found. Installing..."
    sudo apt update && sudo apt install -y whiptail
fi

# Define packages (KEY DESCRIPTION ON/OFF)
OPTIONS=(
    "telegram" "alternative messaging app" OFF
    "signal" "private messaging app" OFF
    "discord" "comunity messaging app" OFF
    "sublime" "simple text editor" OFF
    "office" "office tools" OFF
    "brave" "Personally preffered browser with add blocker" OFF
    "steam" "Directory tree viewer" OFF
    "gimp" "Image manipulation software" OFF
    "timeshift" "Desktop backup tool" OFF
    "jetbrains-toolbox" "A tool used to simplify instalation and use of jetbrains software" OFF
    "lutris" "all in one gaming platform"
)

# Show the menu
SELECTED=$(whiptail --title "Package Installer" \
    --checklist "Choose packages to install:" 20 95 10 \
    "${OPTIONS[@]}" 3>&1 1>&2 2>&3)

# Handle cancel
if [ $? -ne 0 ]; then
    echo "Installation cancelled."
    exit 1
fi

# Convert selection to array
PACKAGES=()
for choice in $SELECTED; do
    PACKAGES+=("${choice//\"/}")
done

installFolder="./install_scripts"
whiptail --yesno "Proceed?" 8 40 3>&1 1>&2 2>&3
#installinf flatpak and flatseal (nonoptional)
clear
$installFolder/flatpak_install.sh

echo -e "\nflatak, flatseal and graphical application manager were installed"
sleep 1

#user message stating that 
echo -e " \nthe instalation of this packages: \n ${PACKAGES[@]}, \nwill begin shortly"
sleep 2

for p in ${PACKAGES[@]}; do
    chmod +x ${installFolder}/${p}_install.sh
    ${installFolder}/${p}_install.sh
done