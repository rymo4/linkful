class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to links_path
    end
    @users = User.where(:isTemp => false)
  end

  def bookmark
    @current_userid = current_user.id.to_s
  end
end
