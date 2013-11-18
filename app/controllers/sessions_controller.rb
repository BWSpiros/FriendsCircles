class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user
      log_in_user!(user)
      redirect_to user_url(user)
    else
      @user = User.new(params[:user])
      flash.now[:error] = "Invalid Log-in"
      render :new
    end
  end

  def destroy
    log_out_user!(current_user)

    flash[:success] = "Logged out!"
    redirect_to root_url
  end
end
