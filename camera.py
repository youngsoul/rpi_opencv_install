import cv2

"""
Test script to verify that OpenCV can access the RPI camera and save a file.

"""
cap = cv2.VideoCapture(0)

# Capture frame
ret, frame = cap.read()
if ret:
	cv2.imwrite('image.jpg', frame)

cap.release()
