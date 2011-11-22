require 'test_helper'

class BandTest < ActiveSupport::TestCase

  test "should not save band without name" do
    band = Band.new
    assert !band.save, "Saved the band without a name"
  end
  
  test "should not save band with a too long name" do
    long_name = "a" * 31
    long_name_band = Band.new(:name=> long_name)
    assert !long_name_band.save, "Saved the band with a name too long"
  end
  
end
