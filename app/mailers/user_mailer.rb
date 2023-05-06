class UserMailer < ApplicationMailer
    def update_notification(user, hole)
        @user_email = user.email
        @hole_number = hole.hole_number
        @course_name = hole.course_name
        mail(to: @user_email, subject: 'Course updates')
    end
end