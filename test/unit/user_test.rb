require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users, :bands

  ###########Tests isInBand###########
  ####################################
  test "users should have a isInBand method" do
    user = users(:user1)
    assert_respond_to( user, "isInBand")
  end

  ###########Tests joinband###########
  ####################################
  test "users should have a joinband method" do
    user = users(:user1)
    assert_respond_to( user, "joinband")
  end

  test "user1 should be in band2" do
    user = users(:user1)
    band = bands(:band2)
    user.joinband(band)
    assert(user.isInBand(band))
  end

  test "user1 should not be in band2" do
    user = users(:user1)
    band = bands(:band2)
    assert_nil(user.isInBand(band))
  end

  ###########Tests leaveband###########
  ####################################
  test "users should have a leaveband method" do
    user = users(:user1)
    assert_respond_to( user, "leaveband")
  end

  test "user1 should not be in band2 anymore" do
    user = users(:user1)
    band = bands(:band2)
    user.joinband(band)
    assert_not_nil(user.isInBand(band))
    user.leaveband(band)
    assert_nil(user.isInBand(band))
  end
    
end