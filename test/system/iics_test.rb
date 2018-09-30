require "application_system_test_case"

class IicsTest < ApplicationSystemTestCase
  setup do
    @iic = iics(:one)
  end

  test "visiting the index" do
    visit iics_url
    assert_selector "h1", text: "Iics"
  end

  test "creating a Iic" do
    visit iics_url
    click_on "New Iic"

    fill_in "Description", with: @iic.description
    fill_in "End Date", with: @iic.end_date
    fill_in "Estimated End Date", with: @iic.estimated_end_date
    fill_in "Log", with: @iic.log
    fill_in "Multilateral", with: @iic.multilateral
    fill_in "Name", with: @iic.name
    fill_in "Privacy", with: @iic.privacy
    fill_in "Start Date", with: @iic.start_date
    fill_in "State", with: @iic.state
    click_on "Create Iic"

    assert_text "Iic was successfully created"
    click_on "Back"
  end

  test "updating a Iic" do
    visit iics_url
    click_on "Edit", match: :first

    fill_in "Description", with: @iic.description
    fill_in "End Date", with: @iic.end_date
    fill_in "Estimated End Date", with: @iic.estimated_end_date
    fill_in "Log", with: @iic.log
    fill_in "Multilateral", with: @iic.multilateral
    fill_in "Name", with: @iic.name
    fill_in "Privacy", with: @iic.privacy
    fill_in "Start Date", with: @iic.start_date
    fill_in "State", with: @iic.state
    click_on "Update Iic"

    assert_text "Iic was successfully updated"
    click_on "Back"
  end

  test "destroying a Iic" do
    visit iics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Iic was successfully destroyed"
  end
end
