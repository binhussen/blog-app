class PostsController < ApplicationController
  def index
    set_user
  end

  def show
    set_post
  end

  private

  def set_post
    @post = params[:post_id]
  end

  def set_user
    @user = params[:user_id]
  end
end
