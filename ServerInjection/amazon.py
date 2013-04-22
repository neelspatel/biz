import re

def get(arg):

	result = arg[(arg.index("btAsinTitle"))+15:]
	result = result[:(result.index("</span>"))]

	return result