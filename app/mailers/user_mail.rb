class UserMail < ActionMailer::Base
  default from: 'julian.morales@crowdint.com'

  def invitation(user, order)
    @user = user 
    @url  = link_to "order now", edit_order_path(order)
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
