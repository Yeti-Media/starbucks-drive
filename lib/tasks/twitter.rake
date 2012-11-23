namespace :twitter do
  desc "gather eligible tweets for contest"
  task :gather_tweets => :environment do
    Twitter.search("##{Settings.twitter.hashtag} -rt").results.map do |tweet|
      tweet = Tweet.find_or_create_by(user: tweet.from_user)
      tweet.tweet_id = tweet.id
      tweet.save
    end
  end

  desc "should pick random tweet"
  task :pick_winner => :environment do
    3.times do
      eligible = Tweet.where(won: false)
      t = eligible.skip(rand(eligible.count)).limit(1).first
      t.won = true
      t.save
      p 'Winner --- ' + t.user
    end    
  end

end