require 'test_helper'

class IicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @iic = iics(:one)
  end

  test "should get index" do
    get iics_url
    assert_response :success
  end

  test "should get new" do
    get new_iic_url
    assert_response :success
  end

  test "should create iic" do
    assert_difference('Iic.count') do
      post iics_url, params: { iic: { description: @iic.description, end_date: @iic.end_date, estimated_end_date: @iic.estimated_end_date, log: @iic.log, multilateral: @iic.multilateral, name: @iic.name, privacy: @iic.privacy, start_date: @iic.start_date, state: @iic.state } }
    end

    assert_redirected_to iic_url(Iic.last)
  end

  test "should show iic" do
    get iic_url(@iic)
    assert_response :success
  end

  test "should get edit" do
    get edit_iic_url(@iic)
    assert_response :success
  end

  test "should update iic" do
    patch iic_url(@iic), params: { iic: { description: @iic.description, end_date: @iic.end_date, estimated_end_date: @iic.estimated_end_date, log: @iic.log, multilateral: @iic.multilateral, name: @iic.name, privacy: @iic.privacy, start_date: @iic.start_date, state: @iic.state } }
    assert_redirected_to iic_url(@iic)
  end

  test "should destroy iic" do
    assert_difference('Iic.count', -1) do
      delete iic_url(@iic)
    end

    assert_redirected_to iics_url
  end
end
