require 'test_helper'

class DerivationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @derivation = derivations(:one)
  end

  test "should get index" do
    get derivations_url
    assert_response :success
  end

  test "should get new" do
    get new_derivation_url
    assert_response :success
  end

  test "should create derivation" do
    assert_difference('Derivation.count') do
      post derivations_url, params: { derivation: { derivation_date: @derivation.derivation_date, description: @derivation.description, end_date: @derivation.end_date, estimated_end_date: @derivation.estimated_end_date, estimated_work_start_date: @derivation.estimated_work_start_date, log: @derivation.log, name: @derivation.name, petitioner_id: @derivation.petitioner_id, priority: @derivation.priority, privacy: @derivation.privacy, state: @derivation.state, work_start_date: @derivation.work_start_date } }
    end

    assert_redirected_to derivation_url(Derivation.last)
  end

  test "should show derivation" do
    get derivation_url(@derivation)
    assert_response :success
  end

  test "should get edit" do
    get edit_derivation_url(@derivation)
    assert_response :success
  end

  test "should update derivation" do
    patch derivation_url(@derivation), params: { derivation: { derivation_date: @derivation.derivation_date, description: @derivation.description, end_date: @derivation.end_date, estimated_end_date: @derivation.estimated_end_date, estimated_work_start_date: @derivation.estimated_work_start_date, log: @derivation.log, name: @derivation.name, petitioner_id: @derivation.petitioner_id, priority: @derivation.priority, privacy: @derivation.privacy, state: @derivation.state, work_start_date: @derivation.work_start_date } }
    assert_redirected_to derivation_url(@derivation)
  end

  test "should destroy derivation" do
    assert_difference('Derivation.count', -1) do
      delete derivation_url(@derivation)
    end

    assert_redirected_to derivations_url
  end
end
