require "application_system_test_case"

class GoalsTest < ApplicationSystemTestCase
  setup do
    @goal = goals(:one)
  end

  test "visiting the index" do
    visit goals_url
    assert_selector "h1", text: "Goals"
  end

  test "creating a Goal" do
    visit goals_url
    click_on "New Goal"

    fill_in "Description", with: @goal.description
    fill_in "End Date", with: @goal.end_date
    fill_in "Estimated End Date", with: @goal.estimated_end_date
    fill_in "Goal Number", with: @goal.goal_number
    fill_in "Log", with: @goal.log
    fill_in "Name", with: @goal.name
    fill_in "Privacy", with: @goal.privacy
    fill_in "State", with: @goal.state
    fill_in "Year", with: @goal.year
    click_on "Create Goal"

    assert_text "Goal was successfully created"
    click_on "Back"
  end

  test "updating a Goal" do
    visit goals_url
    click_on "Edit", match: :first

    fill_in "Description", with: @goal.description
    fill_in "End Date", with: @goal.end_date
    fill_in "Estimated End Date", with: @goal.estimated_end_date
    fill_in "Goal Number", with: @goal.goal_number
    fill_in "Log", with: @goal.log
    fill_in "Name", with: @goal.name
    fill_in "Privacy", with: @goal.privacy
    fill_in "State", with: @goal.state
    fill_in "Year", with: @goal.year
    click_on "Update Goal"

    assert_text "Goal was successfully updated"
    click_on "Back"
  end

  test "destroying a Goal" do
    visit goals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Goal was successfully destroyed"
  end
end
