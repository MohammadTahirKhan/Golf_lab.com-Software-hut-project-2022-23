class UserMailer < ApplicationMailer
    def update_notification(user)
        @user = user
        mail(to: @user.email, subject: "Edited hole")
    end
end