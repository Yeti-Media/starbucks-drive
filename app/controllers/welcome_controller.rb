class WelcomeController < ApplicationController
  def index
    @json = Location.all.to_gmaps4rails
    @donut_chart_data = Location.chart_data
  end
end
