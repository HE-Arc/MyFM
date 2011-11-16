class UsersController < Clearance::UsersController
  def show
    @user = current_user.id
  end
  
  # Sign up
  def url_after_create
    user_path(current_user.id)
  end
end
