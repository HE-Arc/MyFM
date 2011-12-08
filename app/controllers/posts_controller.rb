class PostsController < ApplicationController

  before_filter :find_parent
  before_filter :authorized_type, :only => :destroy
  
  # /type/1/post
  def show
    @post = Post.find params[:id]
  end
  
  def new
    @post = Post.new
  end
  
  def edit
    @post = Post.find params[:id]
  end
  
  def index
    @post = @parent.posts
  end
  
  def create
    @post = @parent.posts.build params[:post]
    if @post.save
      redirect_to @parent
    else
      render :new
    end
    #@post = @parent.posts.create(params[:posts])
    #respond_to do |format|
    #  format.html {redirect_to :controller => @parent.class.to_s.pluralize.downcase, :action => :show, :id => @parent.id}
    #end
    #if @post.save
    #  redirect_to parent_url(@parent)
    #else
    #  render :action => 'new'
    #end
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
    @post.destroy
    redirect_back_or root_path
  end
  
  protected
  
  def authorized_user
    @post = Post.find(params[:id])
    @user = @post.comment_id
    redirect_to root_path unless current_user == @user
  end
  
  # Find the parent of current post
  def find_parent
    case
      when params[:user_id] then @parent = User.find_by_id(params[:user_id])
      when params[:band_id] then @parent = Band.find_by_id(params[:band_id])
    end
     
  end

end
