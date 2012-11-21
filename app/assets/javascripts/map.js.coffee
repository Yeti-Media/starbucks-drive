# hack to get the map to show up correctly using tabs
$ ->
  $("#map_show").on "click", ->
    $('#maptabTab').html($('.map'))
    $('.map').removeClass('opacity-0 l-map-top-of-page').addClass('opacity-100')