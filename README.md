# Instructions to install opencv 4.1.0 and image libraries on Raspberry PI.  

## Things to consider before you build

- Have a fan and/or heatsink on raspberry pi cpu.

- Run the commands with nohup, or use screen.  I use screen to run them in the background because some will take hours.

- Read through the instructions and make your changes.  I create a virtual env in:  ~/.virtualenvs/cv2_env but you might like it somewhere else.


## Overview

This repo contains 2 files:

- pi_install_cv2_410.sh

- pi_install_cv2_454.sh

- pi_install_imagelibs.sh

While both are structured as shell scripts, these were really used as instructions and each line was run individually.  They might run as complete scripts, but that is not how they were tested.

## Background

These scripts were tested with the 06/20/2019 buster version of Raspbian.  This version was targeted as it is the version you must use if you are using the latest Raspberry PI4.

## pi_install_cv2_410.sh

This file contains the instructions to take a base buster raspbian and installs OpenCV 4.1.0.

## pi_install_cv2_454

This file contains the instructions to take a base RaspberryPI OS image and install OpenCV 4.5.4

## pi_install_imagelibs.sh

This file contains the instructions to install a number of image processing libraries that I find useful.  Libraries such as:

- numpy

- scipy

- scikit-image

- dlib

- face_recognition

- imutils

- picamera

- cython

- zmq

## How to see the results of this setup in action

I assume you have a raspberry pi with a pi camera attached.

I use my repo:

https://github.com/youngsoul/imagezmq

to test the install.  It is not a complete test but a good start.

- log into your raspberry pi

- source your python virtual env

- git clone https://github.com/youngsoul/imagezmq

- cd imagezmq/imagezmq/tests

- python test_pi_send_async_images.py.  NOTE you might need to change the IP address of your server ( see below )

### Server
On my mac I clone the same repo and I assume you have all of the necessary libraries install on your Mac.

execute:

- cd imagezmq/imagezmq/tests

- python test_mac_receive_images_montage.py

This will receive images from the raspberry pis.
