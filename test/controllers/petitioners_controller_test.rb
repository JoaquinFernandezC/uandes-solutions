require 'test_helper'

class PetitionersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @petitioner = petitioners(:one)
  end

  test "should get index" do
    get petitioners_url
    assert_response :success
  end

  test "should get new" do
    get new_petitioner_url
    assert_response :success
  end

  test "should create petitioner" do
    assert_difference('Petitioner.count') do
      post petitioners_url, params: { petitioner: {  } }
    end

    assert_redirected_to petitioner_url(Petitioner.last)
  end

  test "should show petitioner" do
    get petitioner_url(@petitioner)
    assert_response :success
  end

  test "should get edit" do
    get edit_petitioner_url(@petitioner)
    assert_response :success
  end

  test "should update petitioner" do
    patch petitioner_url(@petitioner), params: { petitioner: {  } }
    assert_redirected_to petitioner_url(@petitioner)
  end

  test "should destroy petitioner" do
    assert_difference('Petitioner.count', -1) do
      delete petitioner_url(@petitioner)
    end

    assert_redirected_to petitioners_url
  end
end
