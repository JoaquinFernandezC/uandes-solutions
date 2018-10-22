require 'test_helper'

class FeloniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @felony = felonies(:one)
  end

  test "should get index" do
    get felonies_url
    assert_response :success
  end

  test "should get new" do
    get new_felony_url
    assert_response :success
  end

  test "should create felony" do
    assert_difference('Felony.count') do
      post felonies_url, params: { felony: {  } }
    end

    assert_redirected_to felony_url(Felony.last)
  end

  test "should show felony" do
    get felony_url(@felony)
    assert_response :success
  end

  test "should get edit" do
    get edit_felony_url(@felony)
    assert_response :success
  end

  test "should update felony" do
    patch felony_url(@felony), params: { felony: {  } }
    assert_redirected_to felony_url(@felony)
  end

  test "should destroy felony" do
    assert_difference('Felony.count', -1) do
      delete felony_url(@felony)
    end

    assert_redirected_to felonies_url
  end
end
