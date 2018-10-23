require 'test_helper'

class LegalPeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @legal_person = legal_people(:one)
  end

  test "should get index" do
    get legal_people_url
    assert_response :success
  end

  test "should get new" do
    get new_legal_person_url
    assert_response :success
  end

  test "should create legal_person" do
    assert_difference('LegalPerson.count') do
      post legal_people_url, params: { legal_person: {  } }
    end

    assert_redirected_to legal_person_url(LegalPerson.last)
  end

  test "should show legal_person" do
    get legal_person_url(@legal_person)
    assert_response :success
  end

  test "should get edit" do
    get edit_legal_person_url(@legal_person)
    assert_response :success
  end

  test "should update legal_person" do
    patch legal_person_url(@legal_person), params: { legal_person: {  } }
    assert_redirected_to legal_person_url(@legal_person)
  end

  test "should destroy legal_person" do
    assert_difference('LegalPerson.count', -1) do
      delete legal_person_url(@legal_person)
    end

    assert_redirected_to legal_people_url
  end
end
