require 'spec_helper'

describe "ChatRequest" do

  it "shold show the chart as a donut", js: true do
    l = create(:location)
    l.toy_groups.first.toy_amounts.create amount: '66'
    visit "/"
    within('#donut_chart') do
      page.should have_content('0-2')
      page.should have_content('66')
    end
  end

end
