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

  def test
#puts url_for(:action => 'creation', :controller => 'links', :only_path => false)
puts request.fullpath
    return 
    current_user.sendDailyEmail.each do |l|
      puts l.title
    end
  end
end
