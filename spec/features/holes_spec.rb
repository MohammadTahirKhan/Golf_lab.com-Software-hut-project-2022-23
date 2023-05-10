require "rails_helper"
require "capybara/rspec"
require "capybara/rails"

RSpec.describe "testing holes features" do
    it "should create a hole" do
        Hole.delete_all
        user = User.create(id: 12113, email: "1@gmail.com", password: "123456", user_role: "map_creator")
        visit "/users/sign_in"
        fill_in "Email", with: "1@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit "/holes"
        click_link "New Hole"
        fill_in "Hole number", with: "1"
        fill_in "Course name", with: "TestCourse"
        click_button "Save"
        expect(page).to have_content("Hole was successfully created.")
        expect(Hole.all).to include(Hole.find_by(hole_number: 1))
    end

    it "should edit a hole" do
        Hole.delete_all
        user = User.create(id: 12113, email: "1@gmail.com", password: "123456", user_role: "map_creator")
        visit "/users/sign_in"
        fill_in "Email", with: "1@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit "/holes/new"
        fill_in "Hole number", with: "1"
        fill_in "Course name", with: "TestCourse"
        click_button "Save"
        visit "/holes"
        click_link "Edit"
        fill_in "Hole number", with: "2"
        fill_in "Course name", with: "TestCourse2"
        click_button "Continue to map"
        expect(page).to have_content("Hole was successfully updated.")
        expect(Hole.all).to include(Hole.find_by(hole_number: 2))
    end

    it "should delete a hole" do
        Hole.delete_all
        user = User.create(id: 12113, email: "1@gmail.com", password: "123456", user_role: "map_creator")
        visit "/users/sign_in"
        fill_in "Email", with: "1@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit "/holes/new"
        fill_in "Hole number", with: "1"
        fill_in "Course name", with: "TestCourse"
        click_button "Save"
        visit "/holes"
        click_link "Destroy"
        expect(page).to have_content("Hole was successfully destroyed.")
    end

    it "should show a hole" do
        Hole.delete_all
        user = User.create(id: 12113, email: "1@gmail.com", password: "123456", user_role: "map_creator")
        visit "/users/sign_in"
        fill_in "Email", with: "1@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit "/holes/new"
        fill_in "Hole number", with: "1"
        fill_in "Course name", with: "TestCourse"
        click_button "Save"
        visit "/holes"
        click_link "Show"
        expect(page).to have_content("Hole Details")
    end
end
