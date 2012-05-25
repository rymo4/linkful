class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to links_path
    end
    @users = User.where(:isTemp => false)
    n = Link.all.count
    @random = (0..Link.count-1).sort_by{rand}.slice(0, n).collect! do |i| 
      Link.skip(i).first 
    end
    @random = @random.first
    titles = ["land mine?", "take a risk", "im feeling lucky"]
    @title = titles[rand titles.length]
    
  end

  def bookmark
    @current_userid = current_user.id.to_s
  end

  def test
  end
end
