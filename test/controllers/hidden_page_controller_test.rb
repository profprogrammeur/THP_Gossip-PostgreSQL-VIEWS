require 'test_helper'

class HiddenPageControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get hidden_page_welcome_url
    assert_response :success
  end

end
