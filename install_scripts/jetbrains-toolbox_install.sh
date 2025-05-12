#!/bin/bash
cd install_scripts
if [ ! -d "jetbrains-toolbox-2.6.2.41321" ]; then
	wget -O Toolbox https://download-cdn.jetbrains.com/toolbox/jetbrains-toolbox-2.6.2.41321.tar.gz && tar -xvf Toolbox	
	cd jetbrains-toolbox-2.6.2.41321
	./jetbrains-toolbox
fi