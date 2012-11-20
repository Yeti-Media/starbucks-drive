class WelcomeController < ApplicationController
  caches_page :index


  def index
    @json = Location.all.to_gmaps4rails
    @donut_chart_data = Location.chart_data
  end
end
