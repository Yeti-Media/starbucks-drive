class Location
  include Gmaps4rails::ActsAsGmappable
  include Mongoid::Document
  include Geocoder::Model::Mongoid

  attr_accessor :gmaps

  geocoded_by :full_location, coordinates: :coords

  field :coords,  type: Array, default: [0,0]

  field :address, type: String
  field :name, type: String
  field :zip_code, type: String
  field :store_id, type: Integer
  field :city, type: String
  field :state, type: String
  field :phone_number , type: String

  acts_as_gmappable position: :coords

  index({ coords: "2d" }, { min: -200, max: 200 })

  embeds_many :toy_groups, cascade_callbacks: true

  before_create :add_toy_groups
  before_validation :geocode, if: lambda{|r| r.address.present?}

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
    full_location
  end

  def gmaps4rails_address
    full_location
  end


  def full_location
    [address, city, state].join(', ')
  end

  def add_toy_groups
    4.times do |t|
      toy_group = ToyGroup.new(group_id: t)
      toy_group.add_initial_amount
      toy_groups << toy_group
    end
  end

end
