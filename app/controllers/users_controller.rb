class UsersController < Clearance::UsersController
  
  before_filter :authenticate, :only => [:edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  
  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(:page => params[:page])
	  @title = @user.firstname + " " + @user.name
	  
	  if @user == current_user
	    @is_admin_of_page = true
      @post = Post.new # Variable to allowed the current user to create a new post
    else
      @is_admin_of_page = false
    end
  end
  
  def edit
    @user = User.find(params[:id])
    @title = "Edit profile"
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, :notice => "Profile updated!"
    else
      @title = "Edit profile"
      render 'edit'
    end
  end
  
  def mybands
    @title = "MyBands"
    @user = User.find(params[:id])
    @bands = @user.bands
  end
  
  private
  
  # Sign up
  def url_after_create
    user_path(current_user.id)
  end
  
  def authenticate
    deny_access unless signed_in?
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless @user == current_user
  end
  
end
