require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'that it requires a name' do
    u = User.new
    u.email = 'test@somewhere.com'
    u.password = 'passwords'
    refute u.valid?
  end
end
