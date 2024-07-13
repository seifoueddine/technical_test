require "test_helper"

class MeControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get me_show_url
    assert_response :success
  end

  test "should get add" do
    get me_add_url
    assert_response :success
  end

  test "should get transactions" do
    get me_transactions_url
    assert_response :success
  end
end
