require 'test_helper'

class ProfileCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get profile_comments_new_url
    assert_response :success
  end

end
