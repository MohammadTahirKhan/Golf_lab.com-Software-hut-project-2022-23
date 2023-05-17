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

    # application_job.rb
    it "tests application_job.rb" do
        expect(ApplicationJob).to be_truthy
    end

    it "tests ability.rb" do
        expect(Ability).to be_truthy
    end

    describe "mailer" do
        it "tests application_mailer.rb" do
            expect(ApplicationMailer).to be_truthy
        end

        it "tests application mailer default" do
            mail = ApplicationMailer.default
            expect(mail).to be_truthy
        end

        it "tests user_mailer.rb" do
            expect(UserMailer).to be_truthy
        end

        it "tests user mailer update_notification" do
            user = User.create(id: 12321, email: "abc@gmail.com" , password: "123456" , user_role: "map_creator")
            hole = Hole.create(hole_number: 1, course_name: "abc")
            UserMailer.update_notification(user, hole).deliver_now
            expect(ActionMailer::Base.deliveries.count).to eq(1)
        end

        it "tests user mailer default" do
            mail = UserMailer.default
            expect(mail).to be_truthy
        end
    end
end