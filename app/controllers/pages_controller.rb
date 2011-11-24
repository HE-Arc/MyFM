class PagesController < ApplicationController
  
  # Controller for static pages
  
  def home
    @title = "Home"
  end

  def about
    @title = "About"
  end

end
