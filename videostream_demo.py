# import the necessary packages
from imutils.video import VideoStream
import datetime
import argparse
import imutils
import time
import cv2

"""
Credit to PyImageSearch

https://www.pyimagesearch.com/2016/01/04/unifying-picamera-and-cv2-videocapture-into-a-single-class-with-opencv/

Must create VideoStream in function
https://github.com/opencv/opencv/issues/19527

"""

def main(use_picamera):
	# initialize the video stream and allow the cammera sensor to warmup
	vs = VideoStream(usePiCamera=use_picamera).start()
	time.sleep(2.0)

	# loop over the frames from the video stream
	while True:
		# grab the frame from the threaded video stream and resize it
		# to have a maximum width of 400 pixels
		frame = vs.read()
		frame = imutils.resize(frame, width=400)
		# draw the timestamp on the frame
		timestamp = datetime.datetime.now()
		ts = timestamp.strftime("%A %d %B %Y %I:%M:%S%p")
		cv2.putText(frame, ts, (10, frame.shape[0] - 10), cv2.FONT_HERSHEY_SIMPLEX,
			0.35, (0, 0, 255), 1)
		# show the frame
		cv2.imshow("Frame", frame)
		key = cv2.waitKey(1) & 0xFF
		# if the `q` key was pressed, break from the loop
		if key == ord("q"):
			break
	# do a bit of cleanup
	cv2.destroyAllWindows()
	vs.stop()


if __name__ == "__main__":
	# construct the argument parse and parse the arguments
	ap = argparse.ArgumentParser()

	ap.add_argument("--picamera", action='store_true', help="whether or not the Raspberry Pi camera should be used")

	args = vars(ap.parse_args())

	use_picamera = args['picamera']
	main(use_picamera)
