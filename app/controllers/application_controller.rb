class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery
  
  protected

    def sign_in(user)
      # store current time to display "last signed in at" message
      user.update_attribute(:last_signed_in_at, Time.now)
      super user
    end
end
