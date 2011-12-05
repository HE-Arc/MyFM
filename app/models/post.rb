class Post < ActiveRecord::Base
  belongs_to :comment, :polymorphic => true
  
  def clear_post
    self.content = ""
  end  
  
  def clear_post_title
    self.title = ""
  end
  
end
