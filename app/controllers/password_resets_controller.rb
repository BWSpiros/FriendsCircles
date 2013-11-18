class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])#(params[:id])

    if @user.nil?
      flash.now[:error] = "Invalid email"
      render :new
    else

      @user.password_resets.each do |reset|
        reset.destroy
      end

      @reset = PasswordReset.new
      @reset.user_id = @user.id
      @reset.reset_token = SecureRandom.urlsafe_base64(16)
      @reset.save!

      # SEND EMAIL
      UserMailer.reset_email(@user).deliver!

      flash[:success] = "Email has been sent to #{@user.email}!"
      redirect_to new_session_url
    end
  end
end
