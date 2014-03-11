require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

  def setup
     ActsAsTaggableOn::Tag.create(name: 'test')
  end

  test "anonymous should not get new" do
    get :new
    assert_redirected_to '/users/sign_in'
  end

  test "anonymous should not create category" do
    post :create, category: {  }
    assert_redirected_to '/users/sign_in'
  end

  test "should show category" do
    get :show, id: 1
    assert_response :success
  end

  test "anonymous should not get edit" do
    get :edit, id: 1
    assert_redirected_to '/users/sign_in'
  end

  test "anoymous should not update category" do
    patch :update, id: 1, category: {  }
    assert_redirected_to '/users/sign_in'
  end

  test "anonymous should not destroy category" do
    delete :destroy, id: 1
    assert_redirected_to '/users/sign_in'
  end
end
