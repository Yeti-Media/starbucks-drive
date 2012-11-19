require 'spec_helper'

describe ToyGroup, "InstanceMethods" do
  before do
    @toy_group = build(:toy_group)
  end


  describe ".range" do
    it "should return the range" do
      @toy_group.range.should == '0-2'
    end
  end
end
