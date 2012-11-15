class Tweet
  include Mongoid::Document

  field :id , type: Integer
  field :user_id , type: Integer
end
