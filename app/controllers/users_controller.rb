class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    @links = @user.links
    @title = @user.name + '\'s Links'

  	
  	@friends = Hash.new
  	
  	@user.links.each do |link|
  	  id = link.reciever_id
  	  unless User.find(id).isTemp
  	    if @friends.include?(id)
  	      @friends[id] = @friends[id] + 1
	      else
	        @friends[id] = 1
        end
      end
	  end
	  
	  @friends = Hash[@friends.sort]
	  @priority_friends = @friends.keys
    
    
    
  end
  
  
  
  
end
