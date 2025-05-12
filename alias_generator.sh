#!/bin/bash

if [ -f "$HOME/.bash_aliases" ]; then
    echo "~/.bash_aliases exists."
else
    touch "${HOME}/.bash_aliases"
fi

ALIAS=$(whiptail --inputbox "Enter alias you want to permanently add" 10 100 "alias " 3>&1 1>&2 2>&3)

# Check if user cancelled
if [ $? -ne 0 ]; then
    echo "User cancelled input."
    exit 1
fi

echo $ALIAS >> "${HOME}/.bash_aliases"

source "${HOME}/.bashrc"

echo "alias addes sucesfully"