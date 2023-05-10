require "rails_helper"
require "capybara/rspec"
require "capybara/rails"

RSpec.describe "testing user holes features" do

    it "should create a user hole" do
        Hole.delete_all
        user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "map_creator")
        visit "/users/sign_in"
        fill_in "Email", with: "1@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit "/holes/new"
        fill_in "Hole number", with: "1"
        fill_in "Course name", with: "TestCourse"
        click_button "Save"
        visit destroy_user_session_path

        user2 = User.create(id: 12124, email: "2@gmail.com", password: "123456", user_role: "user")
        visit "/users/sign_in"
        fill_in "Email", with: "2@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit "/user_holes"
        click_link "New User Hole"
        click_button "Create"
        expect(page).to have_content("User hole was successfully created.")
    end

    it "should edit a user hole" do
        user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "map_creator")
        visit "/users/sign_in"
        fill_in "Email", with: "1@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit "/holes/new"
        fill_in "Hole number", with: "1"
        fill_in "Course name", with: "TestCourse"
        click_button "Save"
        visit destroy_user_session_path

        user2 = User.create(id: 12124, email: "2@gmail.com", password: "123456", user_role: "user")
        visit "/users/sign_in"
        fill_in "Email", with: "2@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit new_user_hole_path
        click_button "Create"
        visit "/user_holes"
        click_link "Edit"
        expect(page).to have_content("Edit Hole")
        click_button "Continue to map"
        expect(page).to have_content("User hole was successfully updated.")
    end

    it "should delete a user hole" do
        Hole.delete_all
        user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "map_creator")
        visit "/users/sign_in"
        fill_in "Email", with: "1@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit "/holes/new"
        fill_in "Hole number", with: "1"
        fill_in "Course name", with: "TestCourse"
        click_button "Save"
        visit destroy_user_session_path

        user2 = User.create(id: 12124, email: "2@gmail.com", password: "123456", user_role: "user")
        visit "/users/sign_in"
        fill_in "Email", with: "2@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit new_user_hole_path
        click_button "Create"
        visit "/user_holes"
        click_link "Destroy"
        expect(page).to have_content("User hole was successfully destroyed.")
    end

    it "should show a user hole" do
        user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "map_creator")
        visit "/users/sign_in"
        fill_in "Email", with: "1@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit "/holes/new"
        fill_in "Hole number", with: "1"
        fill_in "Course name", with: "TestCourse"
        click_button "Save"
        visit destroy_user_session_path

        user2 = User.create(id: 12124, email: "2@gmail.com", password: "123456", user_role: "user")
        visit "/users/sign_in"
        fill_in "Email", with: "2@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit new_user_hole_path
        click_button "Create"
        visit "/user_holes"
        click_link "Show"
        expect(page).to have_content("Hole Details")
    end

end