class Band < ActiveRecord::Base
  
  after_initialize :default_values
  
  has_many :posts
  
  def default_values
    self.name = "Band"
  end
  
end
