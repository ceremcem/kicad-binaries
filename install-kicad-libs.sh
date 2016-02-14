#!/bin/bash 

#bash ./library-repos-install.sh --install-or-update

cd ~/kicad_sources/kicad-lib.bzr
bzr update 
echo "Copying modules, library and template to /usr/local/share/kicad/"
sudo cp ~/kicad_sources/kicad-lib.bzr/{modules,library,template} /usr/local/share/kicad -a
sudo chown root:staff /usr/local/share/kicad/*
sudo chmod 755 /usr/local/share/kicad/*

