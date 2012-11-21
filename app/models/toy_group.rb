class ToyGroup
  RANGES =  ['0-2', '3-8' , '9-12', '13-17']

  include Mongoid::Document
  field :group_id, type: Integer

  embedded_in :location
  embeds_many :toy_amounts, cascade_callbacks: true

  def range
    RANGES[group_id]
  end

  def add_initial_amount
    self.toy_amounts <<  ToyAmount.new
  end
end
