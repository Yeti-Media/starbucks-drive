namespace :twitter do
  desc "gather eligible tweets for contest"
  task :gather_tweets => :environment do
    followers = Twitter.follower_ids
    Twitter.search("##{Settings.twitter.hashtag} -rt").results.map do |tw|
      if followers.include? tw.from_user_id 
        tweet = Tweet.find_or_create_by(user_id: tw.from_user_id)
        tweet.user = tw.from_user
        tweet.tweet_id = tw.id
        tweet.save
      end
    end
  end

  desc "should pick random tweet"
  task :pick_winner => :environment do
    3.times do
      eligible = Tweet.where(won: false)
      t = eligible.skip(rand(eligible.count)).limit(1).first
      t.won = true
      t.save
      p 'Winner: ' + t.user
      p 'user_id: ' + t.user_id
      p 'tweet: ' + t.tweet_id
      p '-----'
    end    
  end

end