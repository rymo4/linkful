class BookmarklinksController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def new
    @source = params[:source]
    render :layout => false
  end

  def create
    #user = current_user
    if params[:user].nil?
      user = current_user
    else
      user = User.find(params[:user])
    end
      
    email = params[:email].to_s

    unless params[:source].nil? || params[:source].empty?
        params[:link] = Hash.new

      params[:link][:source] = Hash.new
      params[:link][:source] = params[:source]
    end

		
 		link = Mechanize.new { |agent| agent.user_agent_alias = 'Mac Safari'}
		link.get "http://img.bitpixels.com/getthumbnail?code=27543&size=200&url=" + Link.makeAbsolute(params[:link][:source])
		link.get(Link.makeAbsolute(params[:link][:source]))
    title = link.page.title 

    url = nil

    if !User.where(:email => /#{email}/).first.nil?
      reciever_id = User.where(:email => /#{email}/i).first.id
    else
      User.create!(
        :name => "Temp User", 
        :email => email, 
        :password => "temppass", 
        :password_confirmation => "temppass",
        :isTemp => true 
        )
      reciever_id = User.where(:email => /#{email}/i).first.id
    end
      
    
    @link = user.links.new(params[:link].merge({
      :reciever_id => reciever_id, 
      :title => title, 
      :source => Link.makeAbsolute(params[:link][:source]),
      :parsely_url => url
      }))
      @link.save
  end
end
