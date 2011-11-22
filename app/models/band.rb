class Band < ActiveRecord::Base
  
  has_many :posts, :order => "created_at DESC"
  
  validates :name, :presence => true,
                   :length   => { :maximum => 30 }
  
end
