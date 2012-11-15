require 'spec_helper'

describe WelcomeController do
  it "should be success" do
    get :index
    response.should be_success
  end
end
