#detect mobile
$ ->
	if(!jQuery.browser.mobile)
	  $(".tabs-content div").removeClass("panel boxshadow")
	  $("body .row").removeClass("margin-0")
	else
		$('.gmaps4rails_map').width('100%').height('210px')
		$('.map > p').removeClass('margin-bottom-40')
