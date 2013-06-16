$(document).ready(function(){	
/***************************************************
	MENU
***************************************************/
	$("<select />").appendTo("nav#main_menu div");
	
	// Create default option "Go to..."
	$("<option />", {
	   "selected": "selected",
	   "value"   : "",
	   "text"    : "choose a page"
	}).appendTo("nav#main_menu select");	
	
	// Populate dropdowns with the first menu items
	$("nav#main_menu li a").each(function() {
	 	var el = $(this);
	 	$("<option />", {
	     	"value"   : el.attr("href"),
	    	"text"    : el.text()
	 	}).appendTo("nav#main_menu select");
	});
	
/***************************************************
	RESPONSIVE MENU
***************************************************/		
  	$("nav#main_menu select").change(function() {
    	window.location = $(this).find("option:selected").val();
  	});
	
/***************************************************
		TOOLTIP & POPOVER
***************************************************/
$("[rel=tooltip]").tooltip();
$("[data-rel=tooltip]").tooltip();
$("[data-rel=popover]").popover();

/***************************************************
		HOVERS
***************************************************/
	$(".hover_img, .hover_colour").on('mouseover',function(){
			var info=$(this).find("img");
			info.stop().animate({opacity:0.1},500);
		}
	);
	$(".hover_img, .hover_colour").on('mouseout',function(){
			var info=$(this).find("img");
			info.stop().animate({opacity:1},800);
		}
	);
	
/***************************************************
		BACK TO TOP LINK
***************************************************/
	$(window).scroll(function() {
		if ($(this).scrollTop() > 200) {
			$('.go-top').fadeIn(200);
		} else {
			$('.go-top').fadeOut(200);
		}
	});
	
	// Animate the scroll to top
	$('.go-top').click(function(event) {
		event.preventDefault();
		
		$('html, body').animate({scrollTop: 0}, 300);
	})
$('a[data-rel]').each(function() {
$(this).attr('rel', $(this).attr('data-rel')).removeAttr('data-rel');
});
$(function() { 	
$('.welcome').show().addClass("animated fadeInDown");
$('.welcome_index').show().addClass("animated fadeInDown");
$('.intro_sections h6').show().addClass("animated fadeInUp");
$('.fadeinup').show().addClass("animated fadeInUp");
$('.fadeindown').show().addClass("animated fadeInDown");
});