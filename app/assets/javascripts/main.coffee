$ ->
  if (window.history.pushState)
    window.history.pushState('', '', window.location.pathname)
  FastClick.attach(document.body)

  #The options (second parameter) are all optional. The values shown are the default values.
  init_skrollr = ->
    @s = skrollr.init
      forceHeight: true
    skrollr.menu.init s,
      
      #skrollr will smoothly animate to the new position using `animateTo`.
      animate: true
      
      #The easing function to use.
      easing: "sqrt"
      
      #How long the animation should take in ms.
      duration: (currentTop, targetTop) ->
        
        #By default, the duration is hardcoded at 500ms.
        500
  
  kill_skrollr = ->
    if $('html').hasClass('touch')
      s.destroy()
      $('#skrollr-body').attr('style', 'overflow: hidden; height: auto; background-position: 0px 0px;')

  init_skrollr()
  
  # Work around for Skrollr when mobile and modals
  $('[data-id="eventsModal"]').click (e) ->
    e.preventDefault()
    $('#eventsModal').reveal
      opened: kill_skrollr
      closed: init_skrollr

  $('[data-id="enterModal"]').click (e) ->
    e.preventDefault()
    $('#enterModal').reveal
      opened: kill_skrollr
      closed: init_skrollr

  $('[data-id="suggestModal"]').click (e) ->
    e.preventDefault()
    $('#suggestModal').reveal
      opened: kill_skrollr
      closed: init_skrollr

  $('[data-id="termsModal"]').click (e) ->
    e.preventDefault()
    $('#termsModal').reveal
      opened: kill_skrollr
      closed: init_skrollr

  $('[data-id="aboutModal"]').click (e) ->
    e.preventDefault()
    $('#aboutModal').reveal
      opened: kill_skrollr
      closed: init_skrollr

  $('[data-id="mapModal"]').click (e) ->
    e.preventDefault()
    $('#mapModal').reveal
      open: window.map_render
      opened: kill_skrollr
      closed: init_skrollr
    center = window.map.getCenter()
    google.maps.event.trigger(window.map, "resize")
    window.map.setCenter(center)
