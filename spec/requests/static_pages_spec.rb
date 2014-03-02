require 'spec_helper'

describe "Static Pages" do

  let(:base_title) {'Ruby on Rails Tutorial Sample App'}

  describe "Home page" do

    before { visit root_path }

    it "should have the content h1 'Sample App'" do
      page.should have_selector('h1', :text => 'Sample App')
    end

    it "should have the title 'Home'" do
      expect(page.title).to eq("#{base_title} | Home")
    end

  end

  describe "Help page" do

    before { visit help_path }

    it "should have content 'Help'" do
      page.should have_selector('h1', :text => 'Help')
    end

    it "should have the title 'Help'" do
      expect(page.title).to eq("#{base_title} | Help")
    end

  end

  describe "About page" do

    before { visit about_path }

    it "should have content 'About Us'" do
      page.should have_selector('h1', :text => 'About Us')
    end

    it "should have the title 'About Us'" do
      expect(page.title).to eq("#{base_title} | About Us")
    end

  end

  describe "Contact page" do

    before { visit contact_path }

    it "should have content the h1 'Contact'" do
      page.should have_selector('h1', :text => 'Contact')
    end

    it "should have the title 'Contact'" do
      expect(page.title).to eq("#{base_title} | Contact")
    end

  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page.title).to eq("#{base_title} | About Us")
  end

end
