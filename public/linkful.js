$(document).ready(function() {
function loadScript(filename, filetype){
   if (filetype=="js"){ //if filename is a external JavaScript file
       var fileref=document.createElement('script')
    fileref.setAttribute("type","text/javascript")
    fileref.setAttribute("src", filename)
   }
    else if (filetype=="css"){ //if filename is an external CSS file
        var fileref=document.createElement("link")
    fileref.setAttribute("rel", "stylesheet")
    fileref.setAttribute("type", "text/css")
    fileref.setAttribute("href", filename)
   }
 if (typeof fileref!="undefined")
    document.getElementsByTagName("head")[0].appendChild(fileref)
}
	$("#linkfulModal").fancybox({
		maxWidth	: 800,
		maxHeight	: 600,
		fitToView	: false,
		width		: '70%',
		height		: '70%',
		autoSize	: false,
		closeClick	: false,
		openEffect	: 'none',
		closeEffect	: 'none'
	});
	$.fancybox( {href : 'http://google.com', title : 'Lorem lipsum', type: 'iframe'} );
  loadScript('http://fancyapps.com/fancybox/source/jquery.fancybox.css', 'css');
});
