require "application_system_test_case"

class SeniorsTest < ApplicationSystemTestCase
  setup do
    @senior = seniors(:one)
  end

  test "visiting the index" do
    visit seniors_url
    assert_selector "h1", text: "Seniors"
  end

  test "should create senior" do
    visit seniors_url
    click_on "New senior"

    fill_in "Age", with: @senior.age
    fill_in "Code", with: @senior.code
    fill_in "Gender", with: @senior.gender
    fill_in "Pseudo", with: @senior.pseudo
    fill_in "Structure", with: @senior.structure_id
    click_on "Create Senior"

    assert_text "Senior was successfully created"
    click_on "Back"
  end

  test "should update Senior" do
    visit senior_url(@senior)
    click_on "Edit this senior", match: :first

    fill_in "Age", with: @senior.age
    fill_in "Code", with: @senior.code
    fill_in "Gender", with: @senior.gender
    fill_in "Pseudo", with: @senior.pseudo
    fill_in "Structure", with: @senior.structure_id
    click_on "Update Senior"

    assert_text "Senior was successfully updated"
    click_on "Back"
  end

  test "should destroy Senior" do
    visit senior_url(@senior)
    click_on "Destroy this senior", match: :first

    assert_text "Senior was successfully destroyed"
  end
end
