require "test_helper"

class BadgeControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get badge_new_url
    assert_response :success
  end

  test "should get create" do
    get badge_create_url
    assert_response :success
  end

  test "should get index" do
    get badge_index_url
    assert_response :success
  end

  test "should get view" do
    get badge_view_url
    assert_response :success
  end

  test "should get destroy" do
    get badge_destroy_url
    assert_response :success
  end
end
