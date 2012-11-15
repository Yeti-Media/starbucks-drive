require 'spec_helper'

describe "Map presence" do
  it "I see the map", js: true do
    visit "/"
    page.should have_css('div.gmaps4rails_map')
  end
end
