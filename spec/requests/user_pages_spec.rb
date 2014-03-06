require 'spec_helper'

describe "UserPages" do

  subject { page }

  let(:base_title) {'Ruby on Rails Tutorial Sample App'}
  let(:user) { FactoryGirl.create(:user) }

  describe "signup page" do

    before { visit signup_path }

    it "should have content 'Sign Up'" do
      page.should have_selector('h1', :text => 'Sign Up')
    end

    it "should have the title 'Sign Up'" do
      expect(page.title).to eq("#{base_title} | Sign Up")
    end

  end

  describe "profile page" do

    before { visit user_path(user) }

    it { should have_selector('h1',    text: user.name) }
    it { should have_title("#{base_title} | #{user.name}") }

  end

  describe "sign up" do

    before { visit '/signup' }

    describe "with invalid information" do
      it "should not create a user" do
        click_button 'Create my account'
        expect(User.count).to eq 0
      end
    end

    describe "with valid information" do

      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        click_button 'Create my account'
        expect(User.count).to eq(1)
      end

    end

  end

end











