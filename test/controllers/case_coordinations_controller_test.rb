require 'test_helper'

class CaseCoordinationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @case_coordination = case_coordinations(:one)
  end

  test "should get index" do
    get case_coordinations_url
    assert_response :success
  end

  test "should get new" do
    get new_case_coordination_url
    assert_response :success
  end

  test "should create case_coordination" do
    assert_difference('CaseCoordination.count') do
      post case_coordinations_url, params: { case_coordination: { description: @case_coordination.description, estimated_end_date: @case_coordination.estimated_end_date, log: @case_coordination.log, name: @case_coordination.name, privacy: @case_coordination.privacy, state: @case_coordination.state } }
    end

    assert_redirected_to case_coordination_url(CaseCoordination.last)
  end

  test "should show case_coordination" do
    get case_coordination_url(@case_coordination)
    assert_response :success
  end

  test "should get edit" do
    get edit_case_coordination_url(@case_coordination)
    assert_response :success
  end

  test "should update case_coordination" do
    patch case_coordination_url(@case_coordination), params: { case_coordination: { description: @case_coordination.description, estimated_end_date: @case_coordination.estimated_end_date, log: @case_coordination.log, name: @case_coordination.name, privacy: @case_coordination.privacy, state: @case_coordination.state } }
    assert_redirected_to case_coordination_url(@case_coordination)
  end

  test "should destroy case_coordination" do
    assert_difference('CaseCoordination.count', -1) do
      delete case_coordination_url(@case_coordination)
    end

    assert_redirected_to case_coordinations_url
  end
end
