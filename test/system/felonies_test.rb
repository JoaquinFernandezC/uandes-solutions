require "application_system_test_case"

class FeloniesTest < ApplicationSystemTestCase
  setup do
    @felony = felonies(:one)
  end

  test "visiting the index" do
    visit felonies_url
    assert_selector "h1", text: "Felonies"
  end

  test "creating a Felony" do
    visit felonies_url
    click_on "New Felony"

    click_on "Create Felony"

    assert_text "Felony was successfully created"
    click_on "Back"
  end

  test "updating a Felony" do
    visit felonies_url
    click_on "Edit", match: :first

    click_on "Update Felony"

    assert_text "Felony was successfully updated"
    click_on "Back"
  end

  test "destroying a Felony" do
    visit felonies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Felony was successfully destroyed"
  end
end
