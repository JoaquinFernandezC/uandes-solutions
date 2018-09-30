require "application_system_test_case"

class CausesTest < ApplicationSystemTestCase
  setup do
    @cause = causes(:one)
  end

  test "visiting the index" do
    visit causes_url
    assert_selector "h1", text: "Causes"
  end

  test "creating a Cause" do
    visit causes_url
    click_on "New Cause"

    fill_in "Description", with: @cause.description
    fill_in "Estimated End Date", with: @cause.estimated_end_date
    fill_in "Log", with: @cause.log
    fill_in "Name", with: @cause.name
    fill_in "Privacy", with: @cause.privacy
    fill_in "Prosecutor", with: @cause.prosecutor_id
    fill_in "Regional Pros Office", with: @cause.regional_pros_office_id
    fill_in "Ruc Felony", with: @cause.ruc_felony_id
    fill_in "State", with: @cause.state
    click_on "Create Cause"

    assert_text "Cause was successfully created"
    click_on "Back"
  end

  test "updating a Cause" do
    visit causes_url
    click_on "Edit", match: :first

    fill_in "Description", with: @cause.description
    fill_in "Estimated End Date", with: @cause.estimated_end_date
    fill_in "Log", with: @cause.log
    fill_in "Name", with: @cause.name
    fill_in "Privacy", with: @cause.privacy
    fill_in "Prosecutor", with: @cause.prosecutor_id
    fill_in "Regional Pros Office", with: @cause.regional_pros_office_id
    fill_in "Ruc Felony", with: @cause.ruc_felony_id
    fill_in "State", with: @cause.state
    click_on "Update Cause"

    assert_text "Cause was successfully updated"
    click_on "Back"
  end

  test "destroying a Cause" do
    visit causes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cause was successfully destroyed"
  end
end
