class LinksController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user!

  # GET /links
  # GET /links.json
  def index
    @links = current_user.links
    @title = 'Shared By You'
    
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

    if User.where(:email => /#{email}/).any?
      reciever_id = User.where(:email => /#{email}/i).first.id
    else
      u = User.create!(
        :name => "Temp User", 
        :email => email, 
        :password => "temppass", 
        :password_confirmation => "temppass",
        :isTemp => true 
        )
      reciever_id = u.id
    end
      
    @link = user.links.new(params[:link].merge({
      :reciever_id => reciever_id, 
      :title => title, 
      :source => Link.makeAbsolute(params[:link][:source]),
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
    @current_userid = params[:userid]
    headers["Content-Type"] = "text/javascript"
    render :layout => false
  end
end
