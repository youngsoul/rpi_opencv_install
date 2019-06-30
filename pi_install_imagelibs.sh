
# install image libraries to raspberry pi

sudo sed -i 's/CONF_SWAPSIZE=100/CONF_SWAPSIZE=1024/g' /etc/dphys-swapfile

sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start

free -m

sudo apt-get update
sudo apt-get install -y build-essential cmake
sudo apt-get install -y libgtk-3-dev
sudo apt-get install -y libboost-all-dev

# SOURCE YOUR VIRTUAL ENV
source .virtualenvs/cv2_env/bin/activate

pip install numpy
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
