class UserMailer < ActionMailer::Base
  default from: "passwordreset@friendcircle.com"

  def reset_email(user)
    @user = user
    @reset_token = user.password_resets.first.reset_token
    @link = new_password_user_url(user, reset_token: @reset_token)
    mail(to: @user.email, subject: "Your password Reset!")
  end

end
