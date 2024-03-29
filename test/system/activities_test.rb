require "application_system_test_case"

class ActivitiesTest < ApplicationSystemTestCase
  setup do
    @activity = activities(:one)
  end

  test "visiting the index" do
    visit activities_url
    assert_selector "h1", text: "Activities"
  end

  test "should create activity" do
    visit activities_url
    click_on "New activity"

    fill_in "Date", with: @activity.date
    fill_in "Description", with: @activity.description
    fill_in "Device", with: @activity.device_id
    fill_in "Duration", with: @activity.duration
    fill_in "Game", with: @activity.game_id
    fill_in "Name", with: @activity.name
    fill_in "Otherdevice", with: @activity.otherDevice
    click_on "Create Activity"

    assert_text "Activity was successfully created"
    click_on "Back"
  end

  test "should update Activity" do
    visit activity_url(@activity)
    click_on "Edit this activity", match: :first

    fill_in "Date", with: @activity.date
    fill_in "Description", with: @activity.description
    fill_in "Device", with: @activity.device_id
    fill_in "Duration", with: @activity.duration
    fill_in "Game", with: @activity.game_id
    fill_in "Name", with: @activity.name
    fill_in "Otherdevice", with: @activity.otherDevice
    click_on "Update Activity"

    assert_text "Activity was successfully updated"
    click_on "Back"
  end

  test "should destroy Activity" do
    visit activity_url(@activity)
    click_on "Destroy this activity", match: :first

    assert_text "Activity was successfully destroyed"
  end
end
