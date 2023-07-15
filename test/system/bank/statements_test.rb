require "application_system_test_case"

class Bank::StatementsTest < ApplicationSystemTestCase
  setup do
    @bank_statement = bank_statements(:one)
  end

  test "visiting the index" do
    visit bank_statements_url
    assert_selector "h1", text: "Statements"
  end

  test "should create statement" do
    visit bank_statements_url
    click_on "New statement"

    check "Closed" if @bank_statement.closed
    fill_in "Closing reference", with: @bank_statement.closing_reference
    fill_in "Closing value", with: @bank_statement.closing_value
    fill_in "Wallet", with: @bank_statement.wallet_id
    click_on "Create Statement"

    assert_text "Statement was successfully created"
    click_on "Back"
  end

  test "should update Statement" do
    visit bank_statement_url(@bank_statement)
    click_on "Edit this statement", match: :first

    check "Closed" if @bank_statement.closed
    fill_in "Closing reference", with: @bank_statement.closing_reference
    fill_in "Closing value", with: @bank_statement.closing_value
    fill_in "Wallet", with: @bank_statement.wallet_id
    click_on "Update Statement"

    assert_text "Statement was successfully updated"
    click_on "Back"
  end

  test "should destroy Statement" do
    visit bank_statement_url(@bank_statement)
    click_on "Destroy this statement", match: :first

    assert_text "Statement was successfully destroyed"
  end
end
