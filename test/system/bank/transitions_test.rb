require "application_system_test_case"

class Bank::TransitionsTest < ApplicationSystemTestCase
  setup do
    @bank_transition = bank_transitions(:one)
  end

  test "visiting the index" do
    visit bank_transitions_url
    assert_selector "h1", text: "Transitions"
  end

  test "should create transition" do
    visit bank_transitions_url
    click_on "New transition"

    fill_in "Display name", with: @bank_transition.display_name
    fill_in "Name", with: @bank_transition.name
    fill_in "Origin", with: @bank_transition.origin_id
    fill_in "Value", with: @bank_transition.value
    click_on "Create Transition"

    assert_text "Transition was successfully created"
    click_on "Back"
  end

  test "should update Transition" do
    visit bank_transition_url(@bank_transition)
    click_on "Edit this transition", match: :first

    fill_in "Display name", with: @bank_transition.display_name
    fill_in "Name", with: @bank_transition.name
    fill_in "Origin", with: @bank_transition.origin_id
    fill_in "Value", with: @bank_transition.value
    click_on "Update Transition"

    assert_text "Transition was successfully updated"
    click_on "Back"
  end

  test "should destroy Transition" do
    visit bank_transition_url(@bank_transition)
    click_on "Destroy this transition", match: :first

    assert_text "Transition was successfully destroyed"
  end
end
