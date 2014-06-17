# Mailer for Orders' invitations
class UserMailer < ActionMailer::Base
  default from: 'julian.morales@crowdint.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

end
