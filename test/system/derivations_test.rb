require "application_system_test_case"

class DerivationsTest < ApplicationSystemTestCase
  setup do
    @derivation = derivations(:one)
  end

  test "visiting the index" do
    visit derivations_url
    assert_selector "h1", text: "Derivations"
  end

  test "creating a Derivation" do
    visit derivations_url
    click_on "New Derivation"

    fill_in "Derivation Date", with: @derivation.derivation_date
    fill_in "Description", with: @derivation.description
    fill_in "End Date", with: @derivation.end_date
    fill_in "Estimated End Date", with: @derivation.estimated_end_date
    fill_in "Estimated Work Start Date", with: @derivation.estimated_work_start_date
    fill_in "Log", with: @derivation.log
    fill_in "Name", with: @derivation.name
    fill_in "Petitioner", with: @derivation.petitioner_id
    fill_in "Priority", with: @derivation.priority
    fill_in "Privacy", with: @derivation.privacy
    fill_in "State", with: @derivation.state
    fill_in "Work Start Date", with: @derivation.work_start_date
    click_on "Create Derivation"

    assert_text "Derivation was successfully created"
    click_on "Back"
  end

  test "updating a Derivation" do
    visit derivations_url
    click_on "Edit", match: :first

    fill_in "Derivation Date", with: @derivation.derivation_date
    fill_in "Description", with: @derivation.description
    fill_in "End Date", with: @derivation.end_date
    fill_in "Estimated End Date", with: @derivation.estimated_end_date
    fill_in "Estimated Work Start Date", with: @derivation.estimated_work_start_date
    fill_in "Log", with: @derivation.log
    fill_in "Name", with: @derivation.name
    fill_in "Petitioner", with: @derivation.petitioner_id
    fill_in "Priority", with: @derivation.priority
    fill_in "Privacy", with: @derivation.privacy
    fill_in "State", with: @derivation.state
    fill_in "Work Start Date", with: @derivation.work_start_date
    click_on "Update Derivation"

    assert_text "Derivation was successfully updated"
    click_on "Back"
  end

  test "destroying a Derivation" do
    visit derivations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Derivation was successfully destroyed"
  end
end
