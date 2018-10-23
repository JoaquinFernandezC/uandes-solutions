require "application_system_test_case"

class PetitionersTest < ApplicationSystemTestCase
  setup do
    @petitioner = petitioners(:one)
  end

  test "visiting the index" do
    visit petitioners_url
    assert_selector "h1", text: "Petitioners"
  end

  test "creating a Petitioner" do
    visit petitioners_url
    click_on "New Petitioner"

    click_on "Create Petitioner"

    assert_text "Petitioner was successfully created"
    click_on "Back"
  end

  test "updating a Petitioner" do
    visit petitioners_url
    click_on "Edit", match: :first

    click_on "Update Petitioner"

    assert_text "Petitioner was successfully updated"
    click_on "Back"
  end

  test "destroying a Petitioner" do
    visit petitioners_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Petitioner was successfully destroyed"
  end
end
