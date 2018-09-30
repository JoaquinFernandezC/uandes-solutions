require 'test_helper'

class InterinstitutionalCoordinationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interinstitutional_coordination = interinstitutional_coordinations(:one)
  end

  test "should get index" do
    get interinstitutional_coordinations_url
    assert_response :success
  end

  test "should get new" do
    get new_interinstitutional_coordination_url
    assert_response :success
  end

  test "should create interinstitutional_coordination" do
    assert_difference('InterinstitutionalCoordination.count') do
      post interinstitutional_coordinations_url, params: { interinstitutional_coordination: { description: @interinstitutional_coordination.description, end_date: @interinstitutional_coordination.end_date, estimated_end_date: @interinstitutional_coordination.estimated_end_date, log: @interinstitutional_coordination.log, multilateral: @interinstitutional_coordination.multilateral, name: @interinstitutional_coordination.name, privacy: @interinstitutional_coordination.privacy, start_date: @interinstitutional_coordination.start_date, state: @interinstitutional_coordination.state } }
    end

    assert_redirected_to interinstitutional_coordination_url(InterinstitutionalCoordination.last)
  end

  test "should show interinstitutional_coordination" do
    get interinstitutional_coordination_url(@interinstitutional_coordination)
    assert_response :success
  end

  test "should get edit" do
    get edit_interinstitutional_coordination_url(@interinstitutional_coordination)
    assert_response :success
  end

  test "should update interinstitutional_coordination" do
    patch interinstitutional_coordination_url(@interinstitutional_coordination), params: { interinstitutional_coordination: { description: @interinstitutional_coordination.description, end_date: @interinstitutional_coordination.end_date, estimated_end_date: @interinstitutional_coordination.estimated_end_date, log: @interinstitutional_coordination.log, multilateral: @interinstitutional_coordination.multilateral, name: @interinstitutional_coordination.name, privacy: @interinstitutional_coordination.privacy, start_date: @interinstitutional_coordination.start_date, state: @interinstitutional_coordination.state } }
    assert_redirected_to interinstitutional_coordination_url(@interinstitutional_coordination)
  end

  test "should destroy interinstitutional_coordination" do
    assert_difference('InterinstitutionalCoordination.count', -1) do
      delete interinstitutional_coordination_url(@interinstitutional_coordination)
    end

    assert_redirected_to interinstitutional_coordinations_url
  end
end
