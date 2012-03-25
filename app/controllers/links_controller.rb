class LinksController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  # GET /links
  # GET /links.json
  def index
    @links = Link.where(:reciever_id => current_user.id)
    @title = 'Shared With You'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @links }
    end
  end

  # GET /links/1
  # GET /links/1.json
  def show
    @link = Link.find(params[:id])

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
    user = current_user
    email = params[:email].to_s
    
    
    link = Mechanize.new 
    link.get(Link.makeAbsolute(params[:link][:source]))
    title = link.page.title 
    
    if !User.where(:email => /#{email}/).first.nil?
      reciever_id = User.where(:email => /#{email}/i).first.id
    else
      User.create!(
        :name => "Temp User", 
        :email => email, 
        :password => "temppass", 
        :password_confirmation => "temppass",
        :isTemp => true )
     
      reciever_id = User.where(:email => /#{email}/i).first.id
    end
      
    
    @link = user.links.new(params[:link].merge({
      :reciever_id => reciever_id, 
      :title => title, 
      :source => Link.makeAbsolute(params[:link][:source])}))

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
end
