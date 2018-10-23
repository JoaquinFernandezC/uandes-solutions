require 'test_helper'

class RucsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ruc = rucs(:one)
  end

  test "should get index" do
    get rucs_url
    assert_response :success
  end

  test "should get new" do
    get new_ruc_url
    assert_response :success
  end

  test "should create ruc" do
    assert_difference('Ruc.count') do
      post rucs_url, params: { ruc: {  } }
    end

    assert_redirected_to ruc_url(Ruc.last)
  end

  test "should show ruc" do
    get ruc_url(@ruc)
    assert_response :success
  end

  test "should get edit" do
    get edit_ruc_url(@ruc)
    assert_response :success
  end

  test "should update ruc" do
    patch ruc_url(@ruc), params: { ruc: {  } }
    assert_redirected_to ruc_url(@ruc)
  end

  test "should destroy ruc" do
    assert_difference('Ruc.count', -1) do
      delete ruc_url(@ruc)
    end

    assert_redirected_to rucs_url
  end
end
