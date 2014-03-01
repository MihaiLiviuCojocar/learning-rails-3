require 'spec_helper'

describe "Static Pages" do

  describe "Home page" do

    it "should have the content h1 'Sample App'" do
      visit('static_pages/home')
      page.should have_selector('h1', :text => 'Sample App')
    end

    it "should have the right title" do
      visit('/static_pages/home')
      expect(page.title).to eq('Ruby on Rails Tutorial Sample App | Home')
    end

  end

  describe "Help page" do

    it "should have content 'Help'" do
      visit('/static_pages/help')
      page.should have_selector('h1', :text => 'Help')
    end

    it "should have the right title" do
      visit('/static_pages/help')
      expect(page.title).to eq("Ruby on Rails Tutorial Sample App | Help")
    end

  end

  describe "About page" do

    it "should have content 'About Us'" do
      visit('/static_pages/about')
      page.should have_selector('h1', :text => 'About Us')
    end

    it "should have the right title" do
      visit('/static_pages/about')
      expect(page.title).to eq('Ruby on Rails Tutorial Sample App | About Us')
    end

  end


end
