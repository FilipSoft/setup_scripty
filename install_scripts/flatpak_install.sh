#!/bin/bash
sudo apt install flatpak -y

sudo apt install gnome-software-plugin-flatpak -y

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

sudo apt install flatseal