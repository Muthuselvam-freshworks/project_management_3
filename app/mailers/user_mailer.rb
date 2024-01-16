class UserMailer < ApplicationMailer
  
    #sending acknowledgement mail when registering 
    def acknowledgment_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to Project Management App - Registration Acknowledgment')
    end

end
