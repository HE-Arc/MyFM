class BandsController < ApplicationController

  # GET /bands
  def index
    @title = "All bands"
    @bands = Band.paginate(:page => params[:page])
  end

  # GET /bands/1
  def show
    @band = Band.find(params[:id])
    @posts = @band.posts.paginate(:page => params[:page], :per_page => 5)
	@artist = Scrobbler::Artist.new(@band.name)
    
    if is_current_user_in_band
      @post = Post.new
      @is_admin_of_band = true
    else
      @is_admin_of_band = false
    end
  end

  # GET /bands/new
  def new
    if signed_in?
      @band = Band.new
    else
      redirect_to root_path
    end
  end

  # GET /bands/1/edit
  def edit
    @band = Band.find(params[:id])
    if is_current_user_in_band
      @band = Band.find(params[:id])
    else
      redirect_to root_path
    end
  end

  # POST /bands
  def create
    @band = Band.new(params[:band])

    respond_to do |format|
      if @band.save
        current_user.joinband(@band)
        format.html { redirect_to @band, notice: 'Band was successfully created.' }
        format.json { render json: @band, status: :created, location: @band }
      else
        format.html { render action: "new" }
        format.json { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bands/1
  def update
    @band = Band.find(params[:id])

    respond_to do |format|
      if @band.update_attributes(params[:band])
        format.html { redirect_to @band, notice: 'Band was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bands/1
  def destroy
    @band = Band.find(params[:id])
    @band.destroy
  end
  
  private
  
  def is_current_user_in_band
    return @band.users.include? current_user
  end
  
end