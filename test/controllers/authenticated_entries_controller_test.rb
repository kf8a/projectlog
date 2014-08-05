require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @user = User.create email: 
      'test@google.com', 
      name: 'tester', 
      password:"a really long password"

    sign_in @user
    @request.env["devise.mapping"] = Devise.mappings[:user]

    @entry = Entry.create date: Date.today, note: "something important", author: @user
  end

  def teardown
    @user.delete
    @entry.delete
  end

  test "authenticated should get create" do
    post :create,  entry: {date: Date.today, note: 'Something to say'}
    assert_redirected_to entries_path
  end

  test "authenticated should get edit" do
    get :edit, id: @entry
    assert_response :success
  end

  test "authenticated should get update" do
    patch :update, id: @entry, entry: {note: "Something new"}
    assert_redirected_to entries_path
  end

  test "authenticated should get destroy" do
    delete :destroy, id: @entry
    assert_redirected_to entries_path
  end
end
