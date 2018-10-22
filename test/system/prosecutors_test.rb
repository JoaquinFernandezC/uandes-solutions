require "application_system_test_case"

class ProsecutorsTest < ApplicationSystemTestCase
  setup do
    @prosecutor = prosecutors(:one)
  end

  test "visiting the index" do
    visit prosecutors_url
    assert_selector "h1", text: "Prosecutors"
  end

  test "creating a Prosecutor" do
    visit prosecutors_url
    click_on "New Prosecutor"

    click_on "Create Prosecutor"

    assert_text "Prosecutor was successfully created"
    click_on "Back"
  end

  test "updating a Prosecutor" do
    visit prosecutors_url
    click_on "Edit", match: :first

    click_on "Update Prosecutor"

    assert_text "Prosecutor was successfully updated"
    click_on "Back"
  end

  test "destroying a Prosecutor" do
    visit prosecutors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Prosecutor was successfully destroyed"
  end
end
