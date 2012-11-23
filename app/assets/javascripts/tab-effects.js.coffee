$ ->
  $("#map_show").on "click", ->


switchClass = (class) ->
	$(class).removeClass('opacity-0').addClass('opacity-100')