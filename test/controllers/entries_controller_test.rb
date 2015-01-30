require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @user = User.create email: 
      'test@google.com', 
      name: 'tester', 
      password:"a really long password"
    @entry = Entry.create date: Date.today, 
      note: "something important", author: @user
  end

  def teardown
    @user.delete
    @entry.delete
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "anonymous should not get create" do
    post :create
    assert_redirected_to '/users/sign_in'
  end

  test "anonymous should not get edit" do
    get :edit, id: @entry
    assert_redirected_to '/users/sign_in'
  end

  test "anonoymous should not get update" do
    patch :update, id: @entry 
    assert_redirected_to '/users/sign_in'
  end

  test "anonymous should not get destroy" do
    delete :destroy, id: @entry 
    assert_redirected_to '/users/sign_in'
  end

  test "authenticated should get create" do
    sign_in @user
    post :create,  entry: {date: Date.today, note: 'Something to say'}
    assert_redirected_to entries_path
  end

  test "authenticated should get edit" do
    sign_in @user
    get :edit, id: @entry
    assert_response :success
  end

  test "authenticated should get update" do
    sign_in @user
    patch :update, id: @entry, entry: {note: "Something new"}
    assert_redirected_to entries_path
  end

  test "authenticated should get destroy" do
    sign_in @user
    delete :destroy, id: @entry
    assert_redirected_to entries_path
  end

  test 'file upload' do
    sign_in @user
    post :create,  entry: {date: Date.today, note: 'Something to say', attachments_bad: fixture_file_upload("test.txt")}
    assert_redirected_to entries_path
    assert assigns(:entry).attachments != nil
  end
end
