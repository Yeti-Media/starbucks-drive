class TweetController < ApplicationController

  def save_tweet
    Tweet.create(params)
  end
end
