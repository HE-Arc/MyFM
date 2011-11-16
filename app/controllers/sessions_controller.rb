class SessionsController < Clearance::SessionsController

  # Sign in
  def url_after_create
    user_path(current_user.id)
  end
  
  # Sign out
  def url_after_destroy
    "/"
  end
end
