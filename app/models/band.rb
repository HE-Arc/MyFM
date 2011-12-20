class Band < ActiveRecord::Base
  
  has_many :posts, :as => :comment
  
  has_many :bandrelations
  has_many :users, :through => :bandrelations
  
  validates :name, :presence => true,
                   :length   => { :maximum => 30 }
  
  def self.search(param)
    self.where("bands.name LIKE ?", param)
  end
  
end
