require 'test_helper'

class ChoppiesControllerTest < ActionController::TestCase
  setup do
    @choppy = choppies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:choppies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create choppy" do
    assert_difference('Choppy.count') do
      post :create, choppy: { actual_url: @choppy.actual_url, http_status: @choppy.http_status, shortened_url: @choppy.shortened_url }
    end

    assert_redirected_to choppy_path(assigns(:choppy))
  end

  test "should show choppy" do
    get :show, id: @choppy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @choppy
    assert_response :success
  end

  test "should update choppy" do
    patch :update, id: @choppy, choppy: { actual_url: @choppy.actual_url, http_status: @choppy.http_status, shortened_url: @choppy.shortened_url }
    assert_redirected_to choppy_path(assigns(:choppy))
  end

  test "should destroy choppy" do
    assert_difference('Choppy.count', -1) do
      delete :destroy, id: @choppy
    end

    assert_redirected_to choppies_path
  end
end
