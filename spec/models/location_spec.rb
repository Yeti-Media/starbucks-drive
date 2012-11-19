require 'spec_helper'

describe "Callbacks" do
  before do
    @location = build(:location)
  end

  it "should create the four groups by default" do
    @location.save
    @location.toy_groups.all.map(&:group_id).should == (0..3).to_a
  end
end

describe "ClassMethods"  do
  before do
    @location = build(:location)
  end

  describe ".chart_data" do
    it "should return the data for charts" do
      @location.save
      4.times do |t|
        @location.toy_groups.each do |tg|
          tg.toy_amounts.create(amount: t)
        end
      end
      Location.chart_data.should == [{:label=>"0-2", :value=>6},
                                      {:label=>"3-8", :value=>6},
                                      {:label=>"9-12", :value=>6},
                                      {:label=>"13-17", :value=>6}]
    end
  end

end

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

  describe ".chart_data" do
    it "should return the data for charts" do
      @location.save
      4.times do |t|
        @location.toy_groups.each do |tg|
          tg.toy_amounts.create(amount: t)
        end
      end
      @location.chart_data.should == [{:label=>"0-2", :value=>6},
                                      {:label=>"3-8", :value=>6},
                                      {:label=>"9-12", :value=>6},
                                      {:label=>"13-17", :value=>6}]
    end
  end


end
