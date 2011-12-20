class Post < ActiveRecord::Base
  
  belongs_to :comment, :polymorphic => true
  
  def clear_post
    self.content = ""
  end  
  
  default_scope :order => 'posts.created_at DESC'
  
end
