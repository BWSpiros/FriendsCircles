class FriendCirclesController < ApplicationController
  def new
    @friend_circle = FriendCircle.new
    @users = User.all
  end

  def create
    @friend_circle = FriendCircle.new(params[:friend_circle])
    @friend_circle.owner_id = current_user.id
    @users = User.all

    @friend_circle.friend_circle_memberships.build(params["members"].values + [{"user_id" => current_user.id}])

    # params[:members].each do |id|
    #   @friend_circle.friend_circle_memberships.new(
    #   friend_circle_id: @friend_circle.id,
    #   user_id: id)
    # end
    # fail

    if @friend_circle.save
      flash[:success] = "You created a new friend circle!"
      redirect_to friend_circle_url(@friend_circle)
    else
      fail
      flash[:errors] = @friend_circle.errors.full_messages
      render :new
    end

  end

  def edit
    @friend_circle = FriendCircle.find(params[:id])
    @users = User.all
  end

  def update
  end

  def index
  end

  def show
    @friend_circle = FriendCircle.find(params[:id])
  end

  def destroy
  end
end
