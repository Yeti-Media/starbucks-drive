require 'spec_helper'

describe "About" do
  it "I can reach the about page", js: true do
    visit "/"
    page.should have_content('About')
  end

  it "I can see the about page", js: true do
    visit "/"
    click_link 'About'
    page.should have_css('#wufoo-z7x3p9')
  end
end
