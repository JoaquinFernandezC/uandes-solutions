require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:one)
  end

  test "visiting the index" do
    visit projects_url
    assert_selector "h1", text: "Projects"
  end

  test "creating a Project" do
    visit projects_url
    click_on "New Project"

    fill_in "End Date", with: @project.end_date
    fill_in "Estimated End Date", with: @project.estimated_end_date
    fill_in "Log", with: @project.log
    fill_in "Name", with: @project.name
    fill_in "Objective", with: @project.objective
    fill_in "Privacy", with: @project.privacy
    fill_in "Project Number", with: @project.project_number
    fill_in "Start Date", with: @project.start_date
    fill_in "State", with: @project.state
    fill_in "Year", with: @project.year
    click_on "Create Project"

    assert_text "Project was successfully created"
    click_on "Back"
  end

  test "updating a Project" do
    visit projects_url
    click_on "Edit", match: :first

    fill_in "End Date", with: @project.end_date
    fill_in "Estimated End Date", with: @project.estimated_end_date
    fill_in "Log", with: @project.log
    fill_in "Name", with: @project.name
    fill_in "Objective", with: @project.objective
    fill_in "Privacy", with: @project.privacy
    fill_in "Project Number", with: @project.project_number
    fill_in "Start Date", with: @project.start_date
    fill_in "State", with: @project.state
    fill_in "Year", with: @project.year
    click_on "Update Project"

    assert_text "Project was successfully updated"
    click_on "Back"
  end

  test "destroying a Project" do
    visit projects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project was successfully destroyed"
  end
end
