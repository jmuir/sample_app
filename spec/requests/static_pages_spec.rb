require 'spec_helper'

describe "Static Pages" do
  describe "Home page" do
    before { visit root_path }

    it "should have the right Home page title" do
      page.should have_selector('title', text: " | Home")
    end

    it "should have the base title" do
      page.should have_selector('title',
      text: "Ruby on Rails Tutorial Sample App")
    end


    it "should have the h1 'Sample App'" do
      page.should have_selector('h1', text: 'Sample App')
    end
  end

  describe "Help page" do
    before { visit help_path }
    it "should have the right Help page title" do
      page.should have_selector('title', text: " | Help")
    end

    it "should have the h1 'Help'" do
      page.should have_selector('h1', text: "Help")
    end
  end

  describe "About page" do
    before { visit about_path }
    it "should have the right About Us page title" do
      page.should have_selector('title', :text => " | About Us")
    end

    it "should have the h1 'About'" do
      page.should have_selector('h1', text: "About")
    end
  end

  describe "Contact page" do
    before { visit contact_path }
    it "should have the right Contact Us page title" do
      page.should have_selector('title', :text => " | Contact Us")
    end

    it "should have the h1 'Contact'" do
      page.should have_selector('h1', text: "Contact")
    end
  end
end

