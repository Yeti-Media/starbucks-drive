class Tweet
  include Mongoid::Document

  field :tweet_id, type: Integer
  field :user_id , type: Integer
end
