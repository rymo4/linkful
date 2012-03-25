class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to links_path
    end
    @users = User.where(:isTemp => false)
  end
end
