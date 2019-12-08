require 'test_helper'

class VendorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vendor_index_url
    assert_response :success
  end

  test "should get show" do
    get vendor_show_url
    assert_response :success
  end

  test "should get new" do
    get vendor_new_url
    assert_response :success
  end

  test "should get create" do
    get vendor_create_url
    assert_response :success
  end

  test "should get edit" do
    get vendor_edit_url
    assert_response :success
  end

  test "should get update" do
    get vendor_update_url
    assert_response :success
  end

  test "should get destroy" do
    get vendor_destroy_url
    assert_response :success
  end

end
