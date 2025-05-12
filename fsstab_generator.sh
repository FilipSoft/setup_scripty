#!/bin/bash

lsblk -f
read -p  "enter desired UUID: "

UUID=$REPLY
/mnt/linux_storage
read -p "enter mount point: "

MTP=$REPLY

read -p "enter filesytem type (ussually etx4 or ntfs): "

TYPE=$REPLY

echo -e "\nYOUR FSTAB entry is: \nUUID=${UUID}	${MTP}	${TYPE}	rw,exec	0       0
	\nnow paste it at the end of your /etc/fstab file and then run \nsudo mount -a to check if everythings ok
	\nif everything is right command should have no output, /notherwise delete the line or your system may have trouble booting up"