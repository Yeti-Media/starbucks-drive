namespace :twitter do
  desc "gather eligible tweets for contest"
  task :gather_tweets => :environment do
    Twitter.search("#sbdrive  @yeti_media -rt").results.map do |tweet|
      Tweet.find_or_create_by(tweet_id: tweet.id, user: tweet.from_user)
    end
    p Tweet.all.count + ' tweets eligible.'
  end
end