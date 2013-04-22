import amazon

def get(arg):	

	output = "<script src='http://code.jquery.com/jquery-1.7.2.min.js'></script>"	
	output = '<script>$(document).ready(function() {$("#popup").click(function() {alert ("here"); ("#popup").hide();});});</script>'
	#output += "<script src='https://s3.amazonaws.com/codiqa-cdn/mobile/1.2.0/jquery.mobile-1.2.0.min.js'></script>"
	
	#output += '<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.1/jquery.mobile-1.3.1.min.css" />'

	#output = '<script>$(document).ready(function(){$("#popupPadded").popup("open");});</script>'

	#output += '<div data-role="popup" id="popup" class="ui-content"><p>This is a popup</p></div>'
	#output += '<a href="#popupPadded" data-rel="popup" data-role="button">Popup with padding</a><div data-role="popup" id="popupPadded" class="ui-content"><p>This is a popup with the <code>ui-content</code> class added to the popup container.</p></div>'
	#output += "<script>$(document).ready(function(){alert('out5');});</script>"
	
	#output += '<a href="#popupDialog" data-rel="popup" data-position-to="window" data-role="button" data-inline="true" data-transition="pop">Dialog</a><div data-role="popup" id="popupDialog" data-overlay-theme="a" data-theme="c" style="max-width:400px;" class="ui-corner-all"><div data-role="header" data-theme="a" class="ui-corner-top"><h1>Delete Page?</h1></div><div data-role="content" data-theme="d" class="ui-corner-bottom ui-content"><h3 class="ui-title">Are you sure you want to delete this page?</h3><p>This action cannot be undone.</p></div></div>'
	output += '<div id = "popup" style = "position:absolute;width:800px; height:100px; z-index:99; background-color: rgba(12,34,56,0.5); margin: auto" onclick = "$(#popup).hide();">'
	output += '<h1>' + amazon.get(arg) + '</h1>'
	output += '</div>'
	return output