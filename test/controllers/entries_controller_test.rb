require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "should get index" do
    get :index
    assert_response :success
  end

  test "anonymous should not get create" do
    post :create
    assert_redirected_to '/users/sign_in'
  end

  test "anonymous should not get edit" do
    get :edit, id: 1
    assert_redirected_to '/users/sign_in'
  end

  test "anonoymous should not get update" do
    patch :update, id: 1
    assert_redirected_to '/users/sign_in'
  end

  test "anonymous should not get destroy" do
    delete :destroy, id: 1
    assert_redirected_to '/users/sign_in'
  end

  test "authenticated should get create" do
    @controller.stub(:signed_in?).and_return(true)
    post :create
    assert_response :success
  end

  test "authenticated should get edit" do
    get :edit, id: 1
    assert_response :success
  end

  test "authenticated should get update" do
    patch :update, id: 1
    assert_response :success
  end

  test "authenticated should get destroy" do
    delete :destroy, id: 1
    assert_response :success
  end
end
