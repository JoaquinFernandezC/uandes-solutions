require 'test_helper'

class RegionalProsOfficesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @regional_pros_office = regional_pros_offices(:one)
  end

  test "should get index" do
    get regional_pros_offices_url
    assert_response :success
  end

  test "should get new" do
    get new_regional_pros_office_url
    assert_response :success
  end

  test "should create regional_pros_office" do
    assert_difference('RegionalProsOffice.count') do
      post regional_pros_offices_url, params: { regional_pros_office: {  } }
    end

    assert_redirected_to regional_pros_office_url(RegionalProsOffice.last)
  end

  test "should show regional_pros_office" do
    get regional_pros_office_url(@regional_pros_office)
    assert_response :success
  end

  test "should get edit" do
    get edit_regional_pros_office_url(@regional_pros_office)
    assert_response :success
  end

  test "should update regional_pros_office" do
    patch regional_pros_office_url(@regional_pros_office), params: { regional_pros_office: {  } }
    assert_redirected_to regional_pros_office_url(@regional_pros_office)
  end

  test "should destroy regional_pros_office" do
    assert_difference('RegionalProsOffice.count', -1) do
      delete regional_pros_office_url(@regional_pros_office)
    end

    assert_redirected_to regional_pros_offices_url
  end
end
