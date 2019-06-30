# script or instructions to install opencv 4.1.0
# on raspberry pi with buster version of raspbian

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install screen
sudo apt-get -y install htop

# -------------------
# run screen command to put window in background
# -------------------

# -i update the file
# substitute string1 for string2 globally
sudo sed -i 's/CONF_SWAPSIZE=100/CONF_SWAPSIZE=2048/g' /etc/dphys-swapfile

sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start

free -m

# -i update the file
# $ regex for end of the file
# a append
# then the text to append.
sudo sed -i '$a gpu_mem=128' /boot/config.txt

sudo apt-get -y install build-essential cmake pkg-config
sudo apt-get -y install libjpeg-dev libtiff-dev libjasper-dev libpng12-dev
sudo apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get -y install libxvidcore-dev libx264-dev
sudo apt-get -y install libgtk2.0-dev libgtk-3-dev
sudo apt-get -y install libatlas-base-dev gfortran

sudo apt-get -y install python3-dev

wget -O opencv.zip https://github.com/opencv/opencv/archive/4.1.0.zip

wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.1.0.zip

unzip opencv.zip
unzip opencv_contrib.zip

# yes you really need to rename the directories
mv opencv-4.1.0/ opencv
mv opencv_contrib-4.1.0/ opencv_contrib

# you have to make python3.6 env so it uses python3.6 for the build
mkdir -p .virtualenvs
python3 -m venv .virtualenvs/cv2_env
source .virtualenvs/cv2_env/bin/activate

# took a really long time
pip3 install numpy

# took so long I gave up
# sudo pip3 install scipy

cd ~/opencv
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
    -D ENABLE_NEON=ON \
    -D ENABLE_VFPV3=ON \
    -D BUILD_TESTS=OFF \
    -D OPENCV_ENABLE_NONFREE=ON \
    -D INSTALL_PYTHON_EXAMPLES=OFF \
    -D BUILD_EXAMPLES=OFF ..

make -j4

sudo make install
sudo ldconfig
sudo apt-get update

cd ~/opencv/build/lib/python3
mkdir -p ~/lib/cv2
cp cv2.cpython-37m-arm-linux-gnueabihf.so ~/lib/cv2
ln -s ~/lib/cv2/cv2.cpython-37m-arm-linux-gnueabihf.so ~/.virtualenvs/cv2_env/lib/python3.7/site-packages/cv2.so

cd ~

# update /etc/dphys-swapfile to increase size
# set CONF_SWAPSIZE=100
# set CONF_SWAPSIZE=2048
sudo sed -i 's/CONF_SWAPSIZE=2048/CONF_SWAPSIZE=100/g' /etc/dphys-swapfile

sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start

# update /boot/config.txt
sudo sed -i 's/gpu_mem=128/gpu_mem=16/g' /boot/config.txt

rm opencv.zip
rm opencv_contrib.zip

sudo rm -r opencv
sudo rm -r opencv_contrib

# to test
# source ~/.virtualenvs/cv2_env/bin/activate
# python
# import cv2
# print(cv2.__version__)
# you should see 4.1.0

