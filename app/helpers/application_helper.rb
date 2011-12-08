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
  
  def parent_url
    parent = controller.controller_name.singularize
    posts_path(:comment_type => parent, :comment_id => controller.instance_variable_get("@#{parent}").id)
  end

end
