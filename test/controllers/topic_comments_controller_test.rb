require 'test_helper'

class TopicCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get topic_comments_new_url
    assert_response :success
  end

end
