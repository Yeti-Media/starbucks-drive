class Location
  include Gmaps4rails::ActsAsGmappable
  include Mongoid::Document
  include Mongoid::Geospatial

  field :coords,  type: Point, spatial: {lat: :latitude, lng: :longitude, return_array: true }

  field :address, type: String

  acts_as_gmappable

  embeds_many :toy_groups

  validates :coords, presence: true
  validates :address , presence: true

  before_create :add_toy_groups

  def self.chart_data
    result = []
    groups_data = {}
    ToyGroup::RANGES.each {|range| groups_data[range] = 0}
    all.each do |location|
      location.toy_groups.each do |group|
        groups_data[group.range] += group.toy_amounts.sum(:amount) || 0
      end
    end
    groups_data.each do |range, amount|
      result << {label: range , value: amount}
    end
    result
  end

  def chart_data
    result = []
    toy_groups.each do |group|
      result << {label: group.range , value: group.toy_amounts.sum(:amount)}
    end
    result
  end

  def gmaps4rails_infowindow
    "#{address}"
  end

  def gmaps4rails_options
    {position: :coords}
  end

  def add_toy_groups
    4.times do |t|
      toy_groups << ToyGroup.new(group_id: t)
    end
  end

end
