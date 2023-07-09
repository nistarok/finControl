require "application_system_test_case"

class VariableIncomesTest < ApplicationSystemTestCase
  setup do
    @variable_income = variable_incomes(:one)
  end

  test "visiting the index" do
    visit variable_incomes_url
    assert_selector "h1", text: "Variable incomes"
  end

  test "should create variable income" do
    visit variable_incomes_url
    click_on "New variable income"

    fill_in "Mode", with: @variable_income.mode
    fill_in "Name", with: @variable_income.name
    fill_in "Trade date", with: @variable_income.trade_date
    fill_in "Value", with: @variable_income.value
    click_on "Create Variable income"

    assert_text "Variable income was successfully created"
    click_on "Back"
  end

  test "should update Variable income" do
    visit variable_income_url(@variable_income)
    click_on "Edit this variable income", match: :first

    fill_in "Mode", with: @variable_income.mode
    fill_in "Name", with: @variable_income.name
    fill_in "Trade date", with: @variable_income.trade_date
    fill_in "Value", with: @variable_income.value
    click_on "Update Variable income"

    assert_text "Variable income was successfully updated"
    click_on "Back"
  end

  test "should destroy Variable income" do
    visit variable_income_url(@variable_income)
    click_on "Destroy this variable income", match: :first

    assert_text "Variable income was successfully destroyed"
  end
end
