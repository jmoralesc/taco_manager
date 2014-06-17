class UserMail < ActionMailer::Base
  default from: 'julian.morales@crowdint.com'

  def invitation(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
