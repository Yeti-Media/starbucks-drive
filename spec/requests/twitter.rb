require 'spec_helper'

describe "Tweet Button presence" do
  it "should show the button", js: true do
    visit "/"
    page.should have_css('#twttrHubFrameSecure')
  end
end