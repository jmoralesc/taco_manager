class UserMail < ActionMailer::Base
  default from: 'julian.morales@crowdint.com'
  default_url_options[:host] = 'heroku.com'

  def invitation(user, order)
    @user = user 
    @order = order
    @url  = edit_order_url(@order)
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
