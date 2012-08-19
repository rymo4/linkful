class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]

  def show
    @user = User.where(:profile_hash => params[:profile_hash]).first
    @links = Link.where(:reciever_id => @user.id)
    
    if (@user.name == 'Temp User')
      name = @user.email
    else
      name = @user.name
    end
    @title = name + '\'s Links'
  end
end
