class ToyAmount
  include Mongoid::Document
  include Mongoid::Timestamps

  field :amount, type: Integer, default: 0
  embedded_in :toy_group

  validates :amount , presence: true
end
