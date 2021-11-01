require 'test_helper'

class GossipControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get gossip_home_url
    assert_response :success
  end

  test "should get show" do
    get gossip_show_url
    assert_response :success
  end

end
