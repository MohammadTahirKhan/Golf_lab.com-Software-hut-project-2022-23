require "rails_helper"
require "capybara/rspec"
require "capybara/rails"

RSpec.describe "testing if all the pages are displayed" do
    
    it "should display the home page" do
        visit root_path
        expect(page).to have_content("Group 31")
    end
    it "should display the signup page" do
        visit new_user_registration_path
        expect(page).to have_content("Registration")
    end
    
    it "should display the login page" do
        visit new_user_session_path
        expect(page).to have_content("Login")
    end

    it "should display the holes page" do
        user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "map_creator")
        visit "/users/sign_in"
        fill_in "Email", with: "1@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit holes_path
        expect(page).to have_content("Listing Holes")
    end

    it "should display the new holes page" do
        user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "map_creator")
        visit "/users/sign_in"
        fill_in "Email", with: "1@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit new_hole_path
        expect(page).to have_content("New Hole")
    end

    it "should display the edit holes page" do
        user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "map_creator")
        UserHole.delete_all
        Hole.delete_all
        visit "/users/sign_in"
        fill_in "Email", with: "1@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit "/holes/new"
        fill_in "Hole number", with: "1"
        fill_in "Course name", with: "TestCourse"
        click_button "Save"
        datum= Datum.create(id: 1, xCoordinates: 1, yCoordinates: 1, hole_id: 1)
        visit "/holes/1/edit"
        expect(page).to have_content("Edit Hole")
        click_button "Continue to map"
    end

    it "should display the show hole page" do
        user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "map_creator")
        visit "/users/sign_in"
        fill_in "Email", with: "1@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit "/holes/new"
        fill_in "Hole number", with: "1"
        fill_in "Course name", with: "TestCourse"
        click_button "Save"
        visit "/holes/2"
        expect(page).to have_content("Hole Details")
    end

    it "should display the new user holes page" do
        user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "user")
        visit "/users/sign_in"
        fill_in "Email", with: "1@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit new_user_hole_path
        expect(page).to have_content("Choose a Hole")
    end

    it "should display the user holes page" do
        user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "user")
        visit "/users/sign_in"
        fill_in "Email", with: "1@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit "/user_holes"
        expect(page).to have_content("Listing User Holes")
    end

    # it "should display the show user holes page" do
    #     user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "map_creator")
    #     visit "/users/sign_in"
    #     fill_in "Email", with: "1@gmail.com"
    #     fill_in "Password", with: "123456"
    #     click_button "Login"
    #     visit "/holes/new"
    #     fill_in "Hole number", with: "1"
    #     fill_in "Course name", with: "TestCourse"
    #     click_button "Save"
    #     visit new_user_hole_path
    #     click_button "Create", match: :first 
    #     visit "/user_holes/7"

    #     expect(page).to have_content("User Hole details")
    # end

    # it "should display the edit user holes page" do
    # #     # visit root_path
    #     user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "map_creator")
    #     visit "/users/sign_in"
    #     fill_in "Email", with: "1@gmail.com"
    #     fill_in "Password", with: "123456"
    #     click_button "Login"
    #     visit "/holes/new"
    #     fill_in "Hole number", with: "1"
    #     fill_in "Course name", with: "TestCourse"
    #     click_button "Save"
    #     visit new_user_hole_path
    #     click_button "Create", match: :first 
    #     visit "/user_holes/7/edit"
    #     expect(page).to have_content("Editing User Hole")
    # end

    it "display forgot password page" do
        visit "/users/sign_in"
        click_link "Forgot your password?"
        expect(page).to have_content "Forgot your password?"
    end

    it "display edit user page" do
        user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "map_creator")
        visit "/users/sign_in"
        fill_in "Email", with: "1@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit "/users/edit"
        expect(page).to have_content "Edit User"
    end

    it "should display the delete account section" do
        user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "map_creator")
        visit "/users/sign_in"
        fill_in "Email", with: "1@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit "/users/edit"
        expect(page).to have_content "Delete my account"
    end

    it "download the csv file" do
        user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "admin")
        visit "/users/sign_in"
        fill_in "Email", with: "1@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        click_link "Download CSV"
    end

    it "should display the admin page" do
        user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "admin")
        visit "/users/sign_in"
        fill_in "Email", with: "1@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        expect(page).to have_content "Admin"
        click_link "Admin"
        expect(page).to have_content "Listing Users"
    end

    it "should display the edit role page for admin" do
        User.delete_all
        user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "admin")
        user = User.create(id: 1212, email: "2@gmail.com", password: "123456", user_role: "user")
        visit "/users/sign_in"
        fill_in "Email", with: "1@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        click_link "Admin"
        click_link "Edit"
        expect(page).to have_content "Edit User Role"
    end

end