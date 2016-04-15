#!/usr/bin/env python
import rospy
from std_msgs.msg import String

def callback(data):
	rospy.loginfo("Receiving Sensor Data: %s", data.data)

def listener():
	rospy.init_node('listener', anonymous=True)

	rospy.Subscriber("chatter", String, callback)

	# spin() keeps python from exiting until this note stops
	rospy.spin()

if __name__ == '__main__':
	listener()
