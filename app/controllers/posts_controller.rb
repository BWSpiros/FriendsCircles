class PostsController < ApplicationController
  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(params[:post])
    @user = current_user
    # STUFF
    @post.author_id = @user.id
    @post.post_shares.build(params[:friend_circles].values)

    if @post.save
      flash[:success ] = "You posted on the internet. I hope it didn't suck!"
      redirect_to user_post_url(@post.id, user_id: @user.id)
    else
      flash.now[:error] = "Post fail"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end
end
