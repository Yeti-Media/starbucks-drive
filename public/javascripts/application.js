$(document).ready(function() {
  twttr.events.bind('tweet', function(event) {
    var tweet_id = event.data.source_tweet_id;
    var user_id = event.data.user_id;
    alert('something');
    $.post('/tweets', {tweet_id: tweet_id.val(), user_id: user_id.val()});
  }); 
}); 
