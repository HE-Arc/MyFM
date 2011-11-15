class Band < ActiveRecord::Base
  has_many :posts, :order => "created_at DESC"
end
