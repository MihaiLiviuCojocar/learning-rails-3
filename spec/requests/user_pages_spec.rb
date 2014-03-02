require 'spec_helper'

describe "UserPages" do

  let(:base_title) {'Ruby on Rails Tutorial Sample App'}

  describe "signup page" do

    before { visit signup_path }

    it "should have content 'Sign Up'" do
      page.should have_selector('h1', :text => 'Sign Up')
    end

    it "should have the title 'Sign Up'" do
      expect(page.title).to eq("#{base_title} | Sign Up")
    end

  end

end
