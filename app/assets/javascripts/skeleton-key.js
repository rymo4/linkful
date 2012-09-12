$(window).load(function () {					


/*-----------------------------------------------------------------------------------*/
/*	Filterable - http://www.gethifi.com/blog/a-jquery-plugin-to-create-an-interactive-filterable-portfolio-like-ours
/*-----------------------------------------------------------------------------------*/

		
		 // Default Override Section
		 
		 // This is still super duper beta (the default parts, not the actual filtering script), so you'll want
		 // to keep in mind that the "four" under the defaults corresponds to the number of columns on your portfolio...
		 // Sorta - remember that Portfolio-4 uses "four columns", Portfolio-3 uses "one-third column", and Portfolio-2 uses "eight columns"
		 // So, if you're using the "2-column portfolio", you'll want to replace "four columns" with "eight columns"
		 // I know, gnarly stuff. Some day I might consider making this easier to manage ;)
		 // Proceed with caution if you're not comfortable with jQuery!
		 		 
		 // To change the "default" mode of this script, you need to do three major things:
		 // 1. Uncomment the section below that you want to be the default.
		 // 2. Add comment marks to the other two section by adding a "//" before each line.
		 // 3. Change the default column classes to your portfolio style.
		 
		 // At this point you can't set the default for more than one portfolio-column type at once (not easily anyways). 
		 
		 // Note: Comments in jQuery are designated by adding a "//" before a line of code.
		 // So remove the "//" from your desired section to enable it as "active code" and add "//" to lines that you want to disable.
		 
		 // Ok, here are the sections you'll want to edit:
		
		 
		 // Grid View Defaults (comment this section to turn this off as default) - add "//" before each line
		 //	 $("#portfolio-list .module-container").removeClass("sixteen columns").addClass("four columns");
		 //	 $("#portfolio-list .module-img").removeClass("twelve columns alpha");
		 //	 $("#portfolio-list .module-meta").fadeOut(100).removeClass("four columns alpha omega visible");
		 	 $(".list_btn").css("opacity","1");
		 	 $(".hybrid_btn").css("opacity","1");
		 	 $(".grid_btn").css("opacity","0.5");
		 
		 // Hybrid View Defaults (uncomment to activate)
		 //	 $("#portfolio-list .module-container").removeClass("sixteen columns").addClass("four columns");
		 //	 $("#portfolio-list .module-img").removeClass("twelve columns alpha");
		 //  $("#portfolio-list .module-meta").fadeIn(300).removeClass("omega").addClass("four columns alpha visible");
		 //	 $(".list_btn").css("opacity","1");
		 //  $(".hybrid_btn").css("opacity","0.5");
		 //	 $(".grid_btn").css("opacity","1");
			 
			 
		 // List View Defaults (uncomment to activate)
		 //	 $("#portfolio-list .module-container").removeClass("four columns").addClass("sixteen columns");			 
		 //	 $("#portfolio-list .module-img").addClass("twelve columns alpha");
		 //	 $("#portfolio-list .module-meta").fadeIn(300).removeClass("alpha").addClass("four columns omega visible");
		 //	 $(".list_btn").css("opacity","0.5"); 
		 //  $(".hybrid_btn").css("opacity","1");
		 //	 $(".grid_btn").css("opacity","1");


		 // Stop editting. The next section is our button actions. 
		 // Use this for research if you're having trouble understanding how the column count thing works. 
		 // ie: Note the differences between the Four Columns classes and the Three Columns classes.
		 
		 // Four Column Buttons Actions
		 $("span.4-col-grid").click(function () {
			 $("#portfolio-list .module-container").removeClass("sixteen columns").addClass("four columns");
			 $("#portfolio-list .module-img").removeClass("twelve columns alpha");
			 $("#portfolio-list .module-meta").fadeOut(100).removeClass("four columns alpha omega visible");
			 $(".list_btn").css("opacity","1");
			 $(".hybrid_btn").css("opacity","1");
			 $(".grid_btn").css("opacity","0.5");
		 });
		 
		 $("span.4-col-hybrid").click(function () {
			 $("#portfolio-list .module-container").removeClass("sixteen columns").addClass("four columns");
			 $("#portfolio-list .module-img").removeClass("twelve columns alpha");
			 $("#portfolio-list .module-meta").fadeIn(300).removeClass("omega").addClass("four columns alpha visible");
			 $(".list_btn").css("opacity","1");
			 $(".hybrid_btn").css("opacity","0.5");
			 $(".grid_btn").css("opacity","1");
		 }); 
		 
		 $("span.4-col-list").click(function () {
			 $("#portfolio-list .module-container").removeClass("four columns").addClass("sixteen columns");			 
			 $("#portfolio-list .module-img").addClass("twelve columns alpha");
			 $("#portfolio-list .module-meta").fadeIn(300).removeClass("alpha").addClass("four columns omega visible");
			 $(".list_btn").css("opacity","0.5"); 
			 $(".hybrid_btn").css("opacity","1");
			 $(".grid_btn").css("opacity","1");
		 }); 
		 
		 // Three Column Buttons Actions
		 $("span.3-col-grid").click(function () {
			 $("#portfolio-list .module-container").removeClass("sixteen columns").addClass("one-third column");
			 $("#portfolio-list .module-img").removeClass("twelve columns alpha");
			 $("#portfolio-list .module-meta").fadeOut(100).removeClass("one-third column alpha omega visible");
			 $(".list_btn").css("opacity","1");
			 $(".hybrid_btn").css("opacity","1");
			 $(".grid_btn").css("opacity","0.5");
		 });
		 
		 $("span.3-col-hybrid").click(function () {
			 $("#portfolio-list .module-container").removeClass("sixteen columns").addClass("one-third column columns");
			 $("#portfolio-list .module-img").removeClass("twelve columns alpha");
			 $("#portfolio-list .module-meta").fadeIn(300).removeClass("omega").addClass("one-third column alpha visible");
			 $(".list_btn").css("opacity","1");
			 $(".hybrid_btn").css("opacity","0.5");
			 $(".grid_btn").css("opacity","1");
		 }); 
		 
		 $("span.3-col-list").click(function () {
			 $("#portfolio-list .module-container").removeClass("one-third column").addClass("sixteen columns");			 
			 $("#portfolio-list .module-img").addClass("twelve columns alpha");
			 $("#portfolio-list .module-meta").fadeIn(300).removeClass("one-third column alpha").addClass("four columns omega visible");
			 $(".list_btn").css("opacity","0.5"); 
			 $(".hybrid_btn").css("opacity","1");
			 $(".grid_btn").css("opacity","1");
		 }); 
		 		 
		 // Two Column Buttons Actions
		 $("span.2-col-grid").click(function () {
			 $("#portfolio-list .module-container").removeClass("sixteen columns").addClass("eight columns");
			 $("#portfolio-list .module-img").removeClass("twelve columns alpha");
			 $("#portfolio-list .module-meta").fadeOut(100).removeClass("eight columns alpha omega visible");
			 $(".list_btn").css("opacity","1");
			 $(".hybrid_btn").css("opacity","1");
			 $(".grid_btn").css("opacity","0.5");
		 });
		 
		 $("span.2-col-hybrid").click(function () {
			 $("#portfolio-list .module-container").removeClass("sixteen columns").addClass("eight columns");
			 $("#portfolio-list .module-img").removeClass("twelve columns alpha");
			 $("#portfolio-list .module-meta").fadeIn(300).removeClass("four columns omega").addClass("eight columns alpha visible");
			 $(".list_btn").css("opacity","1");
			 $(".hybrid_btn").css("opacity","0.5");  
			 $(".grid_btn").css("opacity","1");
		 }); 
		 
		 $("span.2-col-list").click(function () {
			 $("#portfolio-list .module-container").removeClass("eight columns").addClass("sixteen columns");			 
			 $("#portfolio-list .module-img").addClass("twelve columns alpha");
			 $("#portfolio-list .module-meta").fadeIn(300).removeClass("eight columns alpha").addClass("four columns omega visible");
			 $(".list_btn").css("opacity","0.5"); 
			 $(".hybrid_btn").css("opacity","1");
			 $(".grid_btn").css("opacity","1");
		 }); 
		 

		 		


/*-----------------------------------------------------------------------------------*/
/*	Widget Overlay Area - custom, no URL
/*-----------------------------------------------------------------------------------*/	

		var topBar = jQuery('#topbar');
		var logo = jQuery('#logotype');
		
		var topBarHeight = logo.height();
		
		topBar.css({
			height : topBarHeight
		});
		
	
		var widgetOverlay = jQuery('#overlay-master-container');
		var widgetTrigger = jQuery('#overlay-open a');
		
		var widgetOverlayHeight = widgetOverlay.height();
		
		widgetOverlay.css({
			marginBottom : -widgetOverlayHeight,
			display : 'block'
		});
		
		widgetTrigger.addClass('close');
		
		widgetTrigger.toggle( function() {
			 
			widgetOverlay.animate({
				marginBottom : 0
			}, 600, 'easeInOutCirc');
			
			widgetTrigger.removeClass('close');
		
		}, function() {
			
			widgetOverlay.animate({
				marginBottom : -widgetOverlayHeight
			}, 600, 'easeInOutCirc');
			
			widgetTrigger.addClass('close');		
			
		});
	




/*-----------------------------------------------------------------------------------*/
/*	PERSISTENT HEADER - http://css-tricks.com
/*-----------------------------------------------------------------------------------*/
	
	function UpdateTableHeaders() {
	   $(".persist-area").each(function() {
	
	       var el             = $(this),
	           offset         = el.offset(),
	           scrollTop      = $(window).scrollTop(),
	           floatingHeader = $(".floatingHeader", this)
	
	       if ((scrollTop > offset.top) && (scrollTop < offset.top + el.height())) {
	           floatingHeader.css({
	            "visibility": "visible"
	           });
	       } else {
	           floatingHeader.css({
	            "visibility": "hidden"
	           });
	       };
	   });
	}
	
	// DOM Ready
	$(function() {
	
	   var clonedHeaderRow;
	
	   $(".persist-area").each(function() {
	       clonedHeaderRow = $(".persist-header", this);
	       clonedHeaderRow
	         .before(clonedHeaderRow.clone())
	         .css("width", clonedHeaderRow.width())
	         .addClass("floatingHeader");
	
	   });
	
	   $(window)
	    .scroll(UpdateTableHeaders)
	    .trigger("scroll");
	
	});


/*-----------------------------------------------------------------------------------*/
/*	Jump to the Top - custom, no URL
/*-----------------------------------------------------------------------------------*/

	var topLink = jQuery('#back-to-top');
	function jumpToTop(topLink) {		
		if(jQuery(window).scrollTop() > 0) {topLink.fadeIn(150);} 
		else {topLink.fadeOut(150);}
	}
	
	jQuery(window).scroll( function() {jumpToTop(topLink);});
	
	topLink.find('a').click( function() {
		jQuery('html, body').stop().animate({scrollTop:0}, 450);
		return false;
	});


});
