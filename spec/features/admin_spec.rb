# Test for admin features

require "rails_helper"
require "capybara/rspec"
require "capybara/rails"

RSpec.describe "testing admin features" do
    it "display edit and delete buttons" do
        user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "admin")
        user = User.create(id: 1213, email: "2@gmail.com", password: "123456", user_role: "map_creator")
        user = User.create(id: 1123, email: "3@gmail.com", password: "123456", user_role: "user")
        visit "/users/sign_in"
        fill_in "Email", with: "1@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit "/admin"
        expect(page).to have_content("Edit")
        expect(page).to have_content("Delete")
    end

    it "should delete a user" do
        user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "admin")
        user2 = User.create(id: 1123, email: "3@gmail.com", password: "123456", user_role: "user")
        visit "/users/sign_in"
        fill_in "Email", with: "1@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit "/admin"
        click_link "Delete"
        expect(page).not_to have_content("3@gmail.com")
    end

    # it "should edit a user role and make it map creator or admin and vice versa" do
    #     User.delete_all
    #     user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "admin")
    #     user2 = User.create(id: 1123, email: "3@gmail.com", password: "123456", user_role: "user")
    #     visit "/users/sign_in"
    #     fill_in "Email", with: "1@gmail.com"
    #     fill_in "Password", with: "123456"
    #     click_button "Login"
    #     visit "/admin"
    #     click_link "Edit"
    #     expect(page).to have_content("Edit User Role")
    #     # default on the dropdown is admin
    #     click_button "Update"
    #     expect(user2.user_role).to eq("admin")
    # end


end
