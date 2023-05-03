# extra features test

require "rails_helper"
require "capybara/rspec"
require "capybara/rails"

RSpec.describe "testing extra features" do
    it "explores the home page" do
        visit root_path
        expect(page).to have_content("Explore")
        click_button "Explore"
        expect(page).to have_content("Features")
    end

    
end