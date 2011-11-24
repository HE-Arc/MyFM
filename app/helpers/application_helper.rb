module ApplicationHelper

  # Return a title based by the page
  def title
    base_title = "MyFM"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

end
