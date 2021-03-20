require "test_helper"

class AirControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get air_index_url
    assert_response :success
  end
end
