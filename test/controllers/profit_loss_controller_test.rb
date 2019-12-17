require 'test_helper'

class ProfitLossControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get profit_loss_index_url
    assert_response :success
  end

  test "should get show" do
    get profit_loss_show_url
    assert_response :success
  end

  test "should get new" do
    get profit_loss_new_url
    assert_response :success
  end

  test "should get create" do
    get profit_loss_create_url
    assert_response :success
  end

  test "should get edit" do
    get profit_loss_edit_url
    assert_response :success
  end

  test "should get update" do
    get profit_loss_update_url
    assert_response :success
  end

  test "should get destroy" do
    get profit_loss_destroy_url
    assert_response :success
  end

end
