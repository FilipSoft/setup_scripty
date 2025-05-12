#!/bin/bash
cd install_scripts
if [ ! -d "./Telegram" ]; then
	wget https://telegram.org/dl/desktop/linux && tar -xvf linux
	cd Telegram
	./Telegram
fi