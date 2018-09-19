require "application_system_test_case"

class InterinstitutionalCoordinationsTest < ApplicationSystemTestCase
  setup do
    @interinstitutional_coordination = interinstitutional_coordinations(:one)
  end

  test "visiting the index" do
    visit interinstitutional_coordinations_url
    assert_selector "h1", text: "Interinstitutional Coordinations"
  end

  test "creating a Interinstitutional coordination" do
    visit interinstitutional_coordinations_url
    click_on "New Interinstitutional Coordination"

    fill_in "Description", with: @interinstitutional_coordination.description
    fill_in "End Date", with: @interinstitutional_coordination.end_date
    fill_in "Estimated End Date", with: @interinstitutional_coordination.estimated_end_date
    fill_in "Log", with: @interinstitutional_coordination.log
    fill_in "Multilateral", with: @interinstitutional_coordination.multilateral
    fill_in "Name", with: @interinstitutional_coordination.name
    fill_in "Privacy", with: @interinstitutional_coordination.privacy
    fill_in "Start Date", with: @interinstitutional_coordination.start_date
    fill_in "State", with: @interinstitutional_coordination.state
    click_on "Create Interinstitutional coordination"

    assert_text "Interinstitutional coordination was successfully created"
    click_on "Back"
  end

  test "updating a Interinstitutional coordination" do
    visit interinstitutional_coordinations_url
    click_on "Edit", match: :first

    fill_in "Description", with: @interinstitutional_coordination.description
    fill_in "End Date", with: @interinstitutional_coordination.end_date
    fill_in "Estimated End Date", with: @interinstitutional_coordination.estimated_end_date
    fill_in "Log", with: @interinstitutional_coordination.log
    fill_in "Multilateral", with: @interinstitutional_coordination.multilateral
    fill_in "Name", with: @interinstitutional_coordination.name
    fill_in "Privacy", with: @interinstitutional_coordination.privacy
    fill_in "Start Date", with: @interinstitutional_coordination.start_date
    fill_in "State", with: @interinstitutional_coordination.state
    click_on "Update Interinstitutional coordination"

    assert_text "Interinstitutional coordination was successfully updated"
    click_on "Back"
  end

  test "destroying a Interinstitutional coordination" do
    visit interinstitutional_coordinations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Interinstitutional coordination was successfully destroyed"
  end
end
