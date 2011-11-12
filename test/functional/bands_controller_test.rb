require 'test_helper'

class BandsControllerTest < ActionController::TestCase
  setup do
    @band = bands(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bands)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create band" do
    assert_difference('Band.count') do
      post :create, band: @band.attributes
    end

    assert_redirected_to band_path(assigns(:band))
  end

  test "should show band" do
    get :show, id: @band.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @band.to_param
    assert_response :success
  end

  test "should update band" do
    put :update, id: @band.to_param, band: @band.attributes
    assert_redirected_to band_path(assigns(:band))
  end

  test "should destroy band" do
    assert_difference('Band.count', -1) do
      delete :destroy, id: @band.to_param
    end

    assert_redirected_to bands_path
  end
end
