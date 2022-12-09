class UsersController < ApplicationController
  def index; end

  def show
    set_user
  end

  private

  def set_user
    @user = params[:user_id]
  end
end
