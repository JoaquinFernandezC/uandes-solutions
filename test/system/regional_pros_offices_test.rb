require "application_system_test_case"

class RegionalProsOfficesTest < ApplicationSystemTestCase
  setup do
    @regional_pros_office = regional_pros_offices(:one)
  end

  test "visiting the index" do
    visit regional_pros_offices_url
    assert_selector "h1", text: "Regional Pros Offices"
  end

  test "creating a Regional pros office" do
    visit regional_pros_offices_url
    click_on "New Regional Pros Office"

    click_on "Create Regional pros office"

    assert_text "Regional pros office was successfully created"
    click_on "Back"
  end

  test "updating a Regional pros office" do
    visit regional_pros_offices_url
    click_on "Edit", match: :first

    click_on "Update Regional pros office"

    assert_text "Regional pros office was successfully updated"
    click_on "Back"
  end

  test "destroying a Regional pros office" do
    visit regional_pros_offices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Regional pros office was successfully destroyed"
  end
end
