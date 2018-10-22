require "application_system_test_case"

class RucsTest < ApplicationSystemTestCase
  setup do
    @ruc = rucs(:one)
  end

  test "visiting the index" do
    visit rucs_url
    assert_selector "h1", text: "Rucs"
  end

  test "creating a Ruc" do
    visit rucs_url
    click_on "New Ruc"

    click_on "Create Ruc"

    assert_text "Ruc was successfully created"
    click_on "Back"
  end

  test "updating a Ruc" do
    visit rucs_url
    click_on "Edit", match: :first

    click_on "Update Ruc"

    assert_text "Ruc was successfully updated"
    click_on "Back"
  end

  test "destroying a Ruc" do
    visit rucs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ruc was successfully destroyed"
  end
end
