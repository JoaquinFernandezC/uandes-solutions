require "application_system_test_case"

class LegalPeopleTest < ApplicationSystemTestCase
  setup do
    @legal_person = legal_people(:one)
  end

  test "visiting the index" do
    visit legal_people_url
    assert_selector "h1", text: "Legal People"
  end

  test "creating a Legal person" do
    visit legal_people_url
    click_on "New Legal Person"

    click_on "Create Legal person"

    assert_text "Legal person was successfully created"
    click_on "Back"
  end

  test "updating a Legal person" do
    visit legal_people_url
    click_on "Edit", match: :first

    click_on "Update Legal person"

    assert_text "Legal person was successfully updated"
    click_on "Back"
  end

  test "destroying a Legal person" do
    visit legal_people_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Legal person was successfully destroyed"
  end
end
