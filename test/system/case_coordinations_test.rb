require "application_system_test_case"

class CaseCoordinationsTest < ApplicationSystemTestCase
  setup do
    @case_coordination = case_coordinations(:one)
  end

  test "visiting the index" do
    visit case_coordinations_url
    assert_selector "h1", text: "Case Coordinations"
  end

  test "creating a Case coordination" do
    visit case_coordinations_url
    click_on "New Case Coordination"

    fill_in "Description", with: @case_coordination.description
    fill_in "Estimated End Date", with: @case_coordination.estimated_end_date
    fill_in "Log", with: @case_coordination.log
    fill_in "Name", with: @case_coordination.name
    fill_in "Privacy", with: @case_coordination.privacy
    fill_in "State", with: @case_coordination.state
    click_on "Create Case coordination"

    assert_text "Case coordination was successfully created"
    click_on "Back"
  end

  test "updating a Case coordination" do
    visit case_coordinations_url
    click_on "Edit", match: :first

    fill_in "Description", with: @case_coordination.description
    fill_in "Estimated End Date", with: @case_coordination.estimated_end_date
    fill_in "Log", with: @case_coordination.log
    fill_in "Name", with: @case_coordination.name
    fill_in "Privacy", with: @case_coordination.privacy
    fill_in "State", with: @case_coordination.state
    click_on "Update Case coordination"

    assert_text "Case coordination was successfully updated"
    click_on "Back"
  end

  test "destroying a Case coordination" do
    visit case_coordinations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Case coordination was successfully destroyed"
  end
end
