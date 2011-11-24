class UsersController < Clearance::UsersController
  
  #before_filter :authorize
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
	  @title = @user.firstname + " " + @user.name
  end
  
  # Sign up
  def url_after_create
    user_path(current_user.id)
  end
  
end
