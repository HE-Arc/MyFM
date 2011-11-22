require 'test_helper'

class BandTest < ActiveSupport::TestCase

  test "should not save band without name" do
    band = Band.new
    assert !band.save, "Saved the band without a name"
  end
  
end
