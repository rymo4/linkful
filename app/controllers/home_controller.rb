class HomeController < ApplicationController
  def index
    @users = User.where(:isTemp => false)
  end

  def bookmark
    @current_userid = current_user.id.to_s
  end
end
