#!/bin/bash 

# Clone repo for the first time

git clone https://github.com/KiCad/kicad-source-mirror kicad

sudo apt-get install libwxgtk3.0-0v5 libglew-dev libcairo2-dev libbz2-dev \
                     doxygen libssl-dev \
                     libboost-dev libboost-thread-dev libboost-context-dev \
                     libboost-filesystem-dev libboost-iostreams-dev \
                     libboost-locale-dev libboost-program-options-dev \
                    swig

cd kicad
git pull
sudo rm -rf build > /dev/null 
mkdir -p build/release
cd build/release
cmake \
  -DDOWNLOAD_DIR="${PWD}/cmake-downloads" \
  -DCMAKE_INSTALL_PREFIX="/usr" \
  -DKICAD_SKIP_BOOST=ON \
  -DCMAKE_BUILD_TYPE=Release \
  -DKICAD_SCRIPTING=ON \
  -DKICAD_SCRIPTING_MODULES=ON \
  -DKICAD_SCRIPTING_WXPYTHON=ON \
  ../../ 

make -j 4 # this is sufficient after source changes
#sudo make install 
sudo checkinstall -D make install
