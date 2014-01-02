require 'spec_helper'

describe "Static Pages" do
  describe "Home page" do

    it "should have the right Home page title" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => " | Home")
    end
  end

  describe "Help page" do
    it "should have the right Help page title" do
      visit '/static_pages/help'
      page.should have_selector('title', :text => " | Help")
    end
  end

  describe "About page" do
    it "should have the right About Us page title" do
      visit '/static_pages/about'
      page.should have_selector('title', :text => " | About Us")
    end
  end

  describe "Contact page" do
    it "should have the right Contact Us page title" do
      visit '/static_pages/contact'
      page.should have_selector('title', :text => " | Contact Us")
    end
  end
end

