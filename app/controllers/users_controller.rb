class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    @links = @user.links
    @title = @user.name + '\'s Links'

  end
end
