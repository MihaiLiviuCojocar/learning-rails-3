require 'spec_helper'

describe "AuthenticationPages" do

  subject { page }
  let(:base_title) {'Ruby on Rails Tutorial Sample App'}

  describe "signin page" do

    before { visit '/signin' }

    it { should have_selector('h1', text: 'Sign in') }

    it "should have the title 'About Us'" do
      expect(page.title).to eq("#{base_title} | Sign in")
    end

  end

  describe "sign in" do

    context "with invalid information" do

      before { visit '/signin' }
      before { click_button 'Sign in' }

      it { should have_content("Sign in") }
      it { should have_content("Invalid") }

      context "after visiting another page" do

        before { click_link "Home" }

        it { should_not have_content("Invalid") }

      end

    end


    context "with valid information" do

      let(:user) { FactoryGirl.create(:user) }
      before do
        visit '/signin'
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
      end

      it { should have_link("Sign out") }
      it { should have_link("Profile") }
      it { should_not have_link("Sign in") }

      context "followed by sign out" do

        before { click_link "Sign out" }

        it { should have_link("Sign in") }

      end

    end

  end

end
