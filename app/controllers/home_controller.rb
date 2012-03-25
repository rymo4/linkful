class HomeController < ApplicationController
  def index
    @users = User.where(:isTemp => false)
  end
end
