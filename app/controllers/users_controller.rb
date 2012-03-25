class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    @links = @user.links
    
    
    
    
    
    @links.each do |link|
      if ((!link.tags.nil?) && (!link.tags.empty?))
        url = link.parsely_url
        puts "URL" + url
        request = Typhoeus::Request.new("http://hack.parsely.com#{url}",
                                        :method => :get,
                                        :timeout => 100,
                                        :cache_timeout => 60
                                        )
        hydra = Typhoeus::Hydra.new
        hydra.queue(request)
        hydra.run
        response = request.response

        unless response.timed_out?
          parsed_json = ActiveSupport::JSON.decode(response.body)
     
        if parsed_json['status']=='DONE'
          topics = Array.new
          marked_text = parsed_json['data'] 
          topics = marked_text.scan(/<TOPIC>([^<>]*)<\/TOPIC>/imu).flatten # HACKY CODE FTW!!!

          topics = topics.inject({}) do |hash,item|
             hash[item]||=item
             hash 
          end.values # HACKY CODE FTW!!!
          link.tags = topics
          link.save!
        end
        end
      end
    end
    
    
   
    
    
    
    
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
	  
	  #@friends = Hash[@friends.sort]
	  @priority_friends = @friends.keys
    
    
    
  end
  
  
  
  
end
