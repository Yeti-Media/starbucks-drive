class WelcomeController < ApplicationController
  def index
    @json = Location.all.to_gmaps4rails
  end
end
