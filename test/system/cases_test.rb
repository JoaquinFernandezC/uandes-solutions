require "application_system_test_case"

class CasesTest < ApplicationSystemTestCase
  setup do
    @case = cases(:one)
  end

  test "visiting the index" do
    visit cases_url
    assert_selector "h1", text: "Cases"
  end

  test "creating a Case" do
    visit cases_url
    click_on "New Case"

    fill_in "Description", with: @case.description
    fill_in "Estimated End Date", with: @case.estimated_end_date
    fill_in "Log", with: @case.log
    fill_in "Name", with: @case.name
    fill_in "Privacy", with: @case.privacy
    fill_in "Prosecutor", with: @case.prosecutor_id
    fill_in "Regional Pros Office", with: @case.regional_pros_office_id
    fill_in "Ruc Felony", with: @case.ruc_felony_id
    fill_in "State", with: @case.state
    click_on "Create Case"

    assert_text "Case was successfully created"
    click_on "Back"
  end

  test "updating a Case" do
    visit cases_url
    click_on "Edit", match: :first

    fill_in "Description", with: @case.description
    fill_in "Estimated End Date", with: @case.estimated_end_date
    fill_in "Log", with: @case.log
    fill_in "Name", with: @case.name
    fill_in "Privacy", with: @case.privacy
    fill_in "Prosecutor", with: @case.prosecutor_id
    fill_in "Regional Pros Office", with: @case.regional_pros_office_id
    fill_in "Ruc Felony", with: @case.ruc_felony_id
    fill_in "State", with: @case.state
    click_on "Update Case"

    assert_text "Case was successfully updated"
    click_on "Back"
  end

  test "destroying a Case" do
    visit cases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Case was successfully destroyed"
  end
end
