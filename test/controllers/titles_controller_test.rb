require "test_helper"

class TitlesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get titles_show_url
    assert_response :success
  end
end
