class Band < ActiveRecord::Base
  
  after_initialize :default_values
  
  has_many :posts
  
  def default_values
    self.name = "Band"
  end
  
  has_many :posts, :order => "created_at DESC"
  
end
