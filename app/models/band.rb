class Band < ActiveRecord::Base
<<<<<<< HEAD
  
  after_initialize :default_values
  
  has_many :posts
  
  def default_values
    self.name = "Band"
  end
  
=======
  has_many :posts, :order => "created_at DESC"
>>>>>>> 413b83724a5ee2606f1dbadc68d22b6e4594e72c
end
