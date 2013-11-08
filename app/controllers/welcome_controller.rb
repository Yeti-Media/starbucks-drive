class WelcomeController < ApplicationController
  caches_page :index


  def index
    @locations = Location.all
    @json = Gmaps4rails.build_markers(@locations) do |user, marker|
      marker.lat user.coords.first
      marker.lng user.coords.last
    end
    
    @donut_chart_data = Location.chart_data
  end
end
