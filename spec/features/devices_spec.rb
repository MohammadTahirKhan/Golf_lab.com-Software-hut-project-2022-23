require "rails_helper"
require "capybara/rspec"
require "capybara/rails"

RSpec.describe "testing devices features" do
    it "should register an account" do
        visit root_path
        click_link "Sign up"
        fill_in "Email", with: "abc@gmail.com"
        fill_in "Password", with: "123456"
        fill_in "Password confirmation", with: "123456"
        click_button "Register"
        expect(page).to have_content("Welcome! You have signed up successfully.")
        visit "/users/sign_out"
    end

    it "should login" do
        user = User.create(id: 12123, email: "abcabc@gmail.com", password: "123456", user_role: "map_creator")
        visit root_path
        click_link "Log in"
        fill_in "Email", with: "abcabc@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        expect(page).to have_content("Signed in successfully.")
        visit "/users/sign_out"
    end



    it "should access login page from root" do
        visit root_path
        click_link "Log in"
        expect(page).to have_content("Login")
    end

    it "should access signup page from root" do
        visit root_path
        click_link "Sign up"
        expect(page).to have_content("Registration")
    end

    it "should access login page from signup" do
        visit new_user_registration_path
        click_link "Already have an account?"
        expect(page).to have_content("Login")
    end

    it "should access signup page from login" do
        visit "/users/sign_in"
        click_link "Register"
        expect(page).to have_content("Registration")
    end

    it "should access login page from forgot password" do
        visit new_user_session_path
        click_link "Forgot your password?"
        click_link "Login"
        expect(page).to have_content("Login")
    end

    it "should access signup page from forgot password" do
        visit new_user_session_path
        click_link "Forgot your password?"
        click_link "Register"
        expect(page).to have_content("Registration")
    end

    it "should be able to deal with forgot password" do
        user = User.create(id: 12123, email: "abcabc@gmail.com", password: "123456", user_role: "user")
        visit new_user_session_path
        click_link "Forgot your password?"
        fill_in "Email", with: "abcabc@gmail.com"
        click_button "Send me reset password instructions"
        expect(page).to have_content("You will receive an email with instructions on how to reset your password in a few minutes.")
    end

    it "should be able to deal with forgot password with invalid email" do
        user = User.create(id: 12123, email: "abcabc@gmail.com", password: "123456", user_role: "user")
        visit new_user_session_path
        click_link "Forgot your password?"
        fill_in "Email", with: "aksnckasncvkln@gmail.com"
        click_button "Send me reset password instructions"
        expect(page).to have_content("Email not found")
    end

    it "should be able to deal with forgot password with empty email" do
        user = User.create(id: 12123, email: "abcabc@gmail.com", password: "123456", user_role: "user")
        visit new_user_session_path
        click_link "Forgot your password?"
        fill_in "Email", with: ""
        click_button "Send me reset password instructions"
        expect(page).to have_content("Email can't be blank")
    end

    it "should make sure the email is unique" do
        user = User.create(id: 12123, email: "abc@gmail.com", password: "123456", user_role: "user")
        visit root_path
        click_link "Sign up"
        fill_in "Email", with: "abc@gmail.com"
        fill_in "Password", with: "123456"
        fill_in "Password confirmation", with: "123456"
        click_button "Register"
        expect(page).to have_content("Email has already been taken")
        visit "/users/sign_out"
    end

    it "should make sure the password is at least 6 characters" do
        visit root_path
        click_link "Sign up"
        fill_in "Email", with: "abc@gmail.com"
        fill_in "Password", with: "12345"
        fill_in "Password confirmation", with: "12345"
        click_button "Register"
        expect(page).to have_content("Password is too short (minimum is 6 characters)")
    end

    it "should make sure the password and password confirmation match" do
        visit root_path
        click_link "Sign up"
        fill_in "Email", with: "abc@gmail.com"
        fill_in "Password", with: "123456"
        fill_in "Password confirmation", with: "askcnkascn"
        click_button "Register"
        expect(page).to have_content("Password confirmation doesn't match Password")
    end

    it "should make sure the email is not empty" do
        visit root_path
        click_link "Sign up"
        fill_in "Email", with: ""
        fill_in "Password", with: "123456"
        fill_in "Password confirmation", with: "123456"
        click_button "Register"
        expect(page).to have_content("Email can't be blank")
    end

    it "should make sure the password is not empty" do
        visit root_path
        click_link "Sign up"
        fill_in "Email", with: "abc@fmail.com"
        fill_in "Password", with: ""
        fill_in "Password confirmation", with: ""
        click_button "Register"
        expect(page).to have_content("Password can't be blank")
    end

    it "should make sure email is correct while login" do
        user = User.create(id: 12123, email: "abc@gmail.com", password: "123456", user_role: "user")
        visit root_path
        click_link "Log in"
        fill_in "Email", with: "ascascas"
        fill_in "Password", with: "123456"
        click_button "Login"
        expect(page).to have_content("Invalid Email or password.")
    end

    it "should make sure password is correct while login" do
        user = User.create(id: 12123, email: "abc@gmail.com", password: "123456", user_role: "user")
        visit root_path
        click_link "Log in"
        fill_in "Email", with: "abc@gmail.com"
        fill_in "Password", with: "878768767687"
        click_button "Login"
        expect(page).to have_content("Invalid Email or password.")
    end

    it "should make sure email is not empty while login" do
        visit root_path
        click_link "Log in"
        fill_in "Email", with: ""
        fill_in "Password", with: "878768767687"
        click_button "Login"
        expect(page).to have_content("Invalid Email or password.")
    end

    it "should make sure password is not empty while login" do
        visit root_path
        click_link "Log in"
        fill_in "Email", with: "alsmascasc"
        fill_in "Password", with: ""
        click_button "Login"
        expect(page).to have_content("Invalid Email or password.")
    end

    it "should edit profile" do
        user = User.create(id: 12123, email: "abc@gmail.com", password: "123456", user_role: "user")
        visit root_path
        click_link "Log in"
        fill_in "Email", with: "abc@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit edit_user_registration_path
        fill_in "Email", with: "bc@gmail.com"
        fill_in "Current password", with: "123456"
        click_button "Update"
        expect(page).to have_content("Your account has been updated successfully.")

        visit "/users/sign_out"
        visit "/users/sign_in"
        fill_in "Email", with: "bc@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        expect(page).to have_content("Signed in successfully.")
    end

    it "should go to edit profile page from navigation bar" do
        user = User.create(id: 12123, email: "abc@gmail.com", password: "123456", user_role: "user")
        visit root_path
        click_link "Log in"
        fill_in "Email", with: "abc@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        click_link "abc@gmail.com"
        click_link "Edit Profile"
        expect(page).to have_content("Edit User")
    end

    it "should not edit profile with invalid email" do
        user = User.create(id: 12123, email: "abc@gmail.com", password: "123456", user_role: "user")
        visit root_path
        click_link "Log in"
        fill_in "Email", with: "abc@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit edit_user_registration_path
        fill_in "Email", with: ""
        fill_in "Current password", with: "123456"
        click_button "Update"
        expect(page).to have_content("Email can't be blank")
    end

    it "should not edit profile with invalid password" do
        user = User.create(id: 12123, email: "abc@gmail.com", password: "123456", user_role: "user")
        visit root_path
        click_link "Log in"
        fill_in "Email", with: "abc@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit edit_user_registration_path
        fill_in "Email", with: "abc@gmail.com"
        fill_in "Password", with: "12345"
        fill_in "Password confirmation", with: "12345"
        fill_in "Current password", with: "123456"
        click_button "Update"
        expect(page).to have_content("Password is too short (minimum is 6 characters)")
    end

    it "should not edit profile with invalid/mismatching password confirmation" do
        user = User.create(id: 12123, email: "abc@gmail.com", password: "123456", user_role: "user")
        visit root_path
        click_link "Log in"
        fill_in "Email", with: "abc@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit edit_user_registration_path
        fill_in "Email", with: "abc@gmail.com"
        fill_in "Password", with: "12345"
        fill_in "Password confirmation", with: "1234ss5"
        fill_in "Current password", with: "123456"
        click_button "Update"
        expect(page).to have_content("Password confirmation doesn't match Password")
    end

    it "should not edit profile with invalid current password" do
        user = User.create(id: 12123, email: "abc@gmail.com", password: "123456", user_role: "user")
        visit root_path
        click_link "Log in"
        fill_in "Email", with: "abc@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit edit_user_registration_path
        fill_in "Email", with: "ab@gmail.com"
        fill_in "Current password", with: "12345"
        click_button "Update"
        expect(page).to have_content("Current password is invalid")
    end

    it "should not update password" do
        user = User.create(id: 12123, email: "abc@gmail.com", password: "123456", user_role: "user")
        visit root_path
        click_link "Log in"
        fill_in "Email", with: "abc@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit edit_user_registration_path
        fill_in "Email", with: "abc@gmail.com"
        fill_in "Password", with: "123445"
        fill_in "Password confirmation", with: "123445"
        fill_in "Current password", with: "123456"
        click_button "Update"
        expect(page).to have_content("Your account has been updated successfully.")

        visit "/users/sign_out"
        visit "/users/sign_in"
        fill_in "Email", with: "abc@gmail.com"
        fill_in "Password", with: "123445"
        click_button "Login"
        expect(page).to have_content("Signed in successfully.")
    end

    it "should delete account" do
        user = User.create(id: 12123, email: "abc@gmail.com", password: "123456", user_role: "user")
        visit root_path
        click_link "Log in"
        fill_in "Email", with: "abc@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit edit_user_registration_path
        click_button "Delete my account"
        expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")

        visit root_path
        click_link "Log in"
        fill_in "Email", with: "abc@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        expect(page).to have_content("Invalid Email or password.")
    end

    it "should delete all the user holes created along with the user account" do
        user = User.create(id: 1213, email: "abc@gmail.com", password: "123456", user_role: "user")
        user2 = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "map_creator")
        hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
        user_hole = UserHole.create(id: 12123, hole_id: 12123, user_id: 1213)
        visit root_path
        click_link "Log in"
        fill_in "Email", with: "abc@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit edit_user_registration_path
        click_button "Delete my account"
        expect(UserHole.all).not_to include(user_hole)
    end

    it "should not delete account for admin and map creators" do
        user = User.create(id: 1213, email: "abc@gmail.com", password: "123456", user_role: "admin")
        visit root_path
        click_link "Log in"
        fill_in "Email", with: "abc@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        visit edit_user_registration_path
        expect(page).to have_content("You are an admin, you cannot delete your account.")
    end

    it "logs out" do
        user = User.create(id: 12123, email: "abc@gmail.com", password: "123456", user_role: "user")
        visit root_path
        click_link "Log in"
        fill_in "Email", with: "abc@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        click_link "abc@gmail.com"
        click_link "Log out"
        expect(page).to have_content("Signed out successfully.")
    end

end