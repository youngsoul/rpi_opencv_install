import cv2

cap = cv2.VideoCapture(0)

# Capture frame
ret, frame = cap.read()
if ret:
	cv2.imwrite('image.jpg', frame)

cap.release()
