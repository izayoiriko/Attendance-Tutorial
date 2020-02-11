require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get now" do
    get users_now_url
    assert_response :success
  end

end
