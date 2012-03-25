class LinksController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user!, :except => [:show, :index, :create]

  # GET /links
  # GET /links.json
  def index
    @links = Link.where(:reciever_id => current_user.id)
    @title = 'Shared With You'
    
    
    
    
    
    @links.each do |link|
      if link.tags.empty?
        url = link.parsely_url
        puts "URL" + url
        request = Typhoeus::Request.new("http://hack.parsely.com#{url}",
                                        :method => :get
                                        )
        hydra = Typhoeus::Hydra.new
        hydra.queue(request)
        hydra.run
        response = request.response
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
    
    
    
    
    
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @links }
    end
  end

  # GET /links/1
  # GET /links/1.json
  def show
    @link = Link.find(params[:id])
    @topics = @link.tags
    
 
    
    
                       
                                  
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @link }
    end
  end

  # GET /links/new
  # GET /links/new.json
  def new
    @link = Link.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @link }
    end
  end

  # GET /links/1/edit
  def edit
    @link = Link.find(params[:id])
  end

  # POST /links
  # POST /links.json
  def create

    #user = current_user
    user = User.find(params[:user])
    email = params[:email].to_s

    if not params[:source].empty?
        params[:link] = Hash.new

      params[:link][:source] = Hash.new
      params[:link][:source] = params[:source]
    end
    
    link = Mechanize.new { |agent| agent.user_agent_alias = 'Mac Safari'}
    link.get(Link.makeAbsolute(URI.unescape(params[:link][:source])))
    title = link.page.title 
    puts 'testtest' + title

    html = link.page.content
    doc = Hpricot.parse(html)
    p = doc/ :p
    body = p.inner_html
    puts 'body ' + body
    
    request = Typhoeus::Request.new("http://hack.parsely.com/parse",
                                    :method => :post,
                                    :params => {
                                      :text => body,
                                      :wiki_filter => true
                                      }
                                    )
    hydra = Typhoeus::Hydra.new
    hydra.queue(request)
    hydra.run
    response = request.response
    parsed_json = ActiveSupport::JSON.decode(response.body)
    
    url = parsed_json['url']
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

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render json: @link, status: :created, location: @link }
      else
        format.html { render action: "new" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /links/1
  # PUT /links/1.json
  def update
    @link = Link.find(params[:id])

    respond_to do |format|
      if @link.update_attributes(params[:link])
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    respond_to do |format|
      format.html { redirect_to links_url }
      format.json { head :no_content }
    end
  end

  def bookmarklet
    headers["Content-Type"] = "text/javascript"
    render :layout => false
  end
end
