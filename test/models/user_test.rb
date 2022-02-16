require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Application User", email: "a.user@nowhere.org")
  end

  test "should be valid" do
    assert @user.valid?
  end
end
