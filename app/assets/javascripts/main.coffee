$ ->
  window.history.pushState('', '', window.location.pathname)
  # window.location.hash = ''
  # window.location.replace("#", "");
  FastClick.attach(document.body)
  s = skrollr.init
    forceHeight: false

  #The options (second parameter) are all optional. The values shown are the default values.
  skrollr.menu.init s,
    
    #skrollr will smoothly animate to the new position using `animateTo`.
    animate: true
    
    #The easing function to use.
    easing: "sqrt"
    
    #How long the animation should take in ms.
    duration: (currentTop, targetTop) ->
      
      #By default, the duration is hardcoded at 500ms.
      500

  # Work around for Skrollr when mobile and modals