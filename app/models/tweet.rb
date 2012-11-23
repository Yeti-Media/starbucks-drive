class Tweet
  include Mongoid::Document

  field :tweet_id, type: Integer
  field :user , type: String
  field :user_id , type: String
  field :won , type: Boolean, default: false
end
