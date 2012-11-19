require 'spec_helper'

describe "Donate link" do
  it "should be visible" do
    visit "/"
    page.should have_css('.donate')
  end
end
