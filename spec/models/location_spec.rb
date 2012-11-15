require 'spec_helper'

describe Location, "Instance Methods" do
  before do
    @location = build(:location)
  end

  describe ".gmaps4rails_options"  do
    it "should return the options" do
      @location.gmaps4rails_options.should == {position: :coords}
    end
  end

  describe ".gmaps4rails_infowindow" do
    it "should return the infowindow" do
      @location.gmaps4rails_infowindow.should == @location.address
    end
  end
end
