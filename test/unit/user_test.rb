require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase
self.use_instantiated_fixtures = true
fixtures :users

  def test_auth
    assert_equal @one, User.authenticate("selvam@aazis.com", "selvam")
    assert_nil User.authenticate("nobody@aazis.com", "selvam")
    assert_equal User.authenticate("selvam@aazis.com", "wrongpassword")
  end

end
