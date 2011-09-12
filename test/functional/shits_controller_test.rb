require 'test_helper'

class ShitsControllerTest < ActionController::TestCase
  setup do
    @shit = shits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shit" do
    assert_difference('Shit.count') do
      post :create, :shit => @shit.attributes
    end

    assert_redirected_to shit_path(assigns(:shit))
  end

  test "should show shit" do
    get :show, :id => @shit.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @shit.to_param
    assert_response :success
  end

  test "should update shit" do
    put :update, :id => @shit.to_param, :shit => @shit.attributes
    assert_redirected_to shit_path(assigns(:shit))
  end

  test "should destroy shit" do
    assert_difference('Shit.count', -1) do
      delete :destroy, :id => @shit.to_param
    end

    assert_redirected_to shits_path
  end
end
