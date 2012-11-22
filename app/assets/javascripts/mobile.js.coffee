#detect mobile
$ ->
	if(!jQuery.browser.mobile)
	  $(".tabs-content div").removeClass("panel")
	else
		$('.gmaps4rails_map').width($(window).width()).height('210px');
		$('.map > p').removeClass('margin-bottom-40')
		console.log ("called")
