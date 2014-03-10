require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: 1
    assert_response :success
  end

  test "should get create" do
    post :create
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: 1
    assert_response :success
  end

  test "should get update" do
    patch :update, id: 1
    assert_response :success
  end

  test "should get destroy" do
    delete :destroy, id: 1
    assert_response :success
  end

end
