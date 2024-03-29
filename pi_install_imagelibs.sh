
# install image libraries to raspberry pi
# Assumes you have a python virtual environment at
# ~/.virtualenvs/cv2_env
# assumes you want to install opencv and contrib from pip

sudo sed -i 's/CONF_SWAPSIZE=100/CONF_SWAPSIZE=1024/g' /etc/dphys-swapfile

sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start

free -m

sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt-get install -y build-essential cmake
sudo apt-get install -y libgtk-3-dev
sudo apt-get install -y libboost-all-dev
sudo apt-get install -y libatlas-base-dev

# SOURCE YOUR VIRTUAL ENV
source /home/pi/.virtualenvs/cv2_env/bin/activate

pip install opencv-python

# ONLY INCLUDE THE CONTRIB IF YOU REALLY NEED IT
# the wheel will take FOREVER to compile
# pip install opencv-contrib-python

pip install scipy
pip install scikit-image

pip install dlib
pip install face_recognition

pip install imutils
pip install picamera

# if you are building on buster python 3.7
# and you want zmq you need to install cython
# not sure why it was not already there
pip install cython
pip install zmq

sudo sed -i 's/CONF_SWAPSIZE=1024/CONF_SWAPSIZE=100/g' /etc/dphys-swapfile

sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start
