def get(arg):
	output = "<script src='http://code.jquery.com/jquery-1.7.2.min.js'></script>"	
	output += "<script>$(document).ready(function(){alert('out3');});</script>"
	output += "<script src='http://code.jquery.com/ui/1.10.2/jquery-ui.js'></script>"
	output += "<script src='https://s3.amazonaws.com/codiqa-cdn/mobile/1.2.0/jquery.mobile-1.2.0.min.js'></script>"
	output += "<div style = 'width:100%; background-color:grey;'>Butucu - Doin Big Shit</div>"
	return output