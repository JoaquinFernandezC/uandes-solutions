require 'test_helper'

class CausesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cause = causes(:one)
  end

  test "should get index" do
    get causes_url
    assert_response :success
  end

  test "should get new" do
    get new_cause_url
    assert_response :success
  end

  test "should create cause" do
    assert_difference('Cause.count') do
      post causes_url, params: { cause: { description: @cause.description, estimated_end_date: @cause.estimated_end_date, log: @cause.log, name: @cause.name, privacy: @cause.privacy, prosecutor_id: @cause.prosecutor_id, regional_pros_office_id: @cause.regional_pros_office_id, ruc_felony_id: @cause.ruc_felony_id, state: @cause.state } }
    end

    assert_redirected_to cause_url(Cause.last)
  end

  test "should show cause" do
    get cause_url(@cause)
    assert_response :success
  end

  test "should get edit" do
    get edit_cause_url(@cause)
    assert_response :success
  end

  test "should update cause" do
    patch cause_url(@cause), params: { cause: { description: @cause.description, estimated_end_date: @cause.estimated_end_date, log: @cause.log, name: @cause.name, privacy: @cause.privacy, prosecutor_id: @cause.prosecutor_id, regional_pros_office_id: @cause.regional_pros_office_id, ruc_felony_id: @cause.ruc_felony_id, state: @cause.state } }
    assert_redirected_to cause_url(@cause)
  end

  test "should destroy cause" do
    assert_difference('Cause.count', -1) do
      delete cause_url(@cause)
    end

    assert_redirected_to causes_url
  end
end
