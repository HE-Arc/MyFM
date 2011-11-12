class PostsController < ApplicationController

  before_filter :get_band
  
  def show
    @post = Post.find params[:id]
  end
  
  def new
    @post = Post.new
  end
  
  def edit
    @post = Post.find params[:id]
  end
  
  def create
    @post = @band.posts.build params[:post]
    if @post.save
      redirect_to [@band, @post], :notice => "Post created!"
    else
      render :new
    end
  end
  
  def update
    @post = Post.find params[:id]
    if @post.update_attributes params[:post]
      redirect_to @post, :notice => "Post created!"
    else
      render :edit
    end
  end
  
  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to @band, :notice => "Post destroyed!"
  end
  
  protected
  def get_band
    @band = Band.find params[:band_id]
  end

end
