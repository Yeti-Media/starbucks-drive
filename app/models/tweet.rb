class Tweet
  include Mongoid::Document

  field :tweet_id, type: Integer
  field :user , type: String
  field :won , type: Boolean, default: false
end
