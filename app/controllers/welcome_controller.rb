class WelcomeController < ApplicationController
  caches_page :index


  def index
    @locations = Location.all
    @json = Gmaps4rails.build_markers(@locations) do |user, marker|
      marker.lat user.coords.last
      marker.lng user.coords.first
      marker.infowindow  user.full_location
      marker.picture({"url"=> "//#{request.host_with_port}/assets/sb_logo.jpg",
                      "width" =>  32,
                      "height" => 32})
    end
    @donut_chart_data = Location.chart_data
  end
end
