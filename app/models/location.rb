class Location
  include Gmaps4rails::ActsAsGmappable
  include Mongoid::Document
  include Mongoid::Geospatial


  field :coords,  type: Point, spatial: {lat: :latitude, lng: :longitude, return_array: true }

  field :address, type: String

  acts_as_gmappable


  validates :coords, presence: true
  validates :address , presence: true

  def gmaps4rails_infowindow
    "#{address}"
  end

  def gmaps4rails_options
    {position: :coords}
  end


end
