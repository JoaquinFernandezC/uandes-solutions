require 'test_helper'

class CasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @case = cases(:one)
  end

  test "should get index" do
    get cases_url
    assert_response :success
  end

  test "should get new" do
    get new_case_url
    assert_response :success
  end

  test "should create case" do
    assert_difference('Case.count') do
      post cases_url, params: { case: { description: @case.description, estimated_end_date: @case.estimated_end_date, log: @case.log, name: @case.name, privacy: @case.privacy, prosecutor_id: @case.prosecutor_id, regional_pros_office_id: @case.regional_pros_office_id, ruc_felony_id: @case.ruc_felony_id, state: @case.state } }
    end

    assert_redirected_to case_url(Case.last)
  end

  test "should show case" do
    get case_url(@case)
    assert_response :success
  end

  test "should get edit" do
    get edit_case_url(@case)
    assert_response :success
  end

  test "should update case" do
    patch case_url(@case), params: { case: { description: @case.description, estimated_end_date: @case.estimated_end_date, log: @case.log, name: @case.name, privacy: @case.privacy, prosecutor_id: @case.prosecutor_id, regional_pros_office_id: @case.regional_pros_office_id, ruc_felony_id: @case.ruc_felony_id, state: @case.state } }
    assert_redirected_to case_url(@case)
  end

  test "should destroy case" do
    assert_difference('Case.count', -1) do
      delete case_url(@case)
    end

    assert_redirected_to cases_url
  end
end
