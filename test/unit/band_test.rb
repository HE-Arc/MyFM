require 'test_helper'

class BandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "new band should be named Band" do
    assert_equal("Band", Band.new.name)
  end
  
end
