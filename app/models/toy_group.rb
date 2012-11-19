class ToyGroup
  include Mongoid::Document
  field :group_id, type: Integer

  embedded_in :location
  embeds_many :toy_amounts

  RANGES =  ['0-2', '3-8' , '9-12', '13-17']


  def range
    RANGES[group_id]
  end
end
