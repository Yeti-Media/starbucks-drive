//GOOGLE ANALYTICS
var _gaq = _gaq || [];
var pageTracker;
_gaq.push(['_setAccount', 'UA-4547391-5']);
_gaq.push(['_setDomainName', 'givethruyeti.com']);
_gaq.push(['_setAllowLinker', true]);
_gaq.push(['_trackPageview']);
_gaq.push(function(){
  pageTracker = _gat._getTracker('UA-4547391-5');
});

(function() {
  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();


// TWITTER WIDGETS
window.twttr = (function (d,s,id) {
  var t, js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return; js=d.createElement(s); js.id=id;
  js.src="//platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs);
  return window.twttr || (t = { _e: [], ready: function(f){ t._e.push(f) } });
}(document, "script", "twitter-wjs"));

  // Define our custom event hanlders

  function clickEventToAnalytics(intent_event) {

    if (intent_event) {

      var label = intent_event.region;

      pageTracker._trackEvent('twitter_web_intents', intent_event.type, label);

    };

  }


  function tweetIntentToAnalytics(intent_event) {

    if (intent_event) {

      var label = "tweet";

      pageTracker._trackEvent('twitter_web_intents', intent_event.type, label);

    };

  }


  function followIntentToAnalytics(intent_event) {

    if (intent_event) {

      var label = intent_event.data.user_id + " (" + intent_event.data.screen_name + ")";

      pageTracker._trackEvent('twitter_web_intents', intent_event.type, label);

    };

  }



 // Wait for the asynchronous resources to load

 twttr.ready(function (twttr) {

  // Now bind our custom intent events

  twttr.events.bind('click',    clickEventToAnalytics);

  twttr.events.bind('tweet',    tweetIntentToAnalytics);

  twttr.events.bind('follow',   followIntentToAnalytics);

  });
