require "application_system_test_case"

class ErrorLogsTest < ApplicationSystemTestCase
  setup do
    @error_log = error_logs(:one)
  end

  test "visiting the index" do
    visit error_logs_url
    assert_selector "h1", text: "Error Logs"
  end

  test "creating a Error log" do
    visit error_logs_url
    click_on "New Error Log"

    fill_in "Action", with: @error_log.action
    fill_in "Code", with: @error_log.code
    fill_in "Privacy", with: @error_log.privacy
    click_on "Create Error log"

    assert_text "Error log was successfully created"
    click_on "Back"
  end

  test "updating a Error log" do
    visit error_logs_url
    click_on "Edit", match: :first

    fill_in "Action", with: @error_log.action
    fill_in "Code", with: @error_log.code
    fill_in "Privacy", with: @error_log.privacy
    click_on "Update Error log"

    assert_text "Error log was successfully updated"
    click_on "Back"
  end

  test "destroying a Error log" do
    visit error_logs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Error log was successfully destroyed"
  end
end
