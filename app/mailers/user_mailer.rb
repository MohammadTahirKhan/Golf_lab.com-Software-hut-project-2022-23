class UserMailer < ApplicationMailer
    def update_notification(user, hole)
        @user = user
        @hole_number = hole.hole_number
        @course_name = hole.course_name
        mail(to: @user.email, subject: "Course updates")
    end
end