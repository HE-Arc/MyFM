class User < ActiveRecord::Base
  include Clearance::User
  
  has_many :bandrelations
  has_many :bands, :through => :bandrelations
  has_many :posts, :as => :comment, :dependent => :destroy
  
  def joinband(band)
    self.bandrelations.create!(:band_id => band.id)
  end
  
  def leaveband(band)
    bandrelations.find_by_band_id(band).destroy
  end
  
  def isInBand(band)
    bandrelations.find_by_band_id(band)
  end
  
  def mybands()
    bandrelations.find_all_by_user_id(self.id)
  end
      
end
