import json
from pprint import pprint


def readConfig():
	serialString = open('config.json')
	returned = json.load(serialString)
	print "The following stocks would be analyzed"
	for symbol in returned["SYMBOLS"]:
		print symbol


readConfig()
	

