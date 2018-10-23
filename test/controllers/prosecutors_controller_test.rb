require 'test_helper'

class ProsecutorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prosecutor = prosecutors(:one)
  end

  test "should get index" do
    get prosecutors_url
    assert_response :success
  end

  test "should get new" do
    get new_prosecutor_url
    assert_response :success
  end

  test "should create prosecutor" do
    assert_difference('Prosecutor.count') do
      post prosecutors_url, params: { prosecutor: {  } }
    end

    assert_redirected_to prosecutor_url(Prosecutor.last)
  end

  test "should show prosecutor" do
    get prosecutor_url(@prosecutor)
    assert_response :success
  end

  test "should get edit" do
    get edit_prosecutor_url(@prosecutor)
    assert_response :success
  end

  test "should update prosecutor" do
    patch prosecutor_url(@prosecutor), params: { prosecutor: {  } }
    assert_redirected_to prosecutor_url(@prosecutor)
  end

  test "should destroy prosecutor" do
    assert_difference('Prosecutor.count', -1) do
      delete prosecutor_url(@prosecutor)
    end

    assert_redirected_to prosecutors_url
  end
end
