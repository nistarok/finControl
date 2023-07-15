require "application_system_test_case"

class Bank::TransactionsTest < ApplicationSystemTestCase
  setup do
    @bank_transaction = bank_transactions(:one)
  end

  test "visiting the index" do
    visit bank_transactions_url
    assert_selector "h1", text: "Transactions"
  end

  test "should create transaction" do
    visit bank_transactions_url
    click_on "New transaction"

    fill_in "Display name", with: @bank_transaction.display_name
    fill_in "Name", with: @bank_transaction.name
    fill_in "Tags", with: @bank_transaction.tags
    fill_in "Value", with: @bank_transaction.value
    click_on "Create Transaction"

    assert_text "Transaction was successfully created"
    click_on "Back"
  end

  test "should update Transaction" do
    visit bank_transaction_url(@bank_transaction)
    click_on "Edit this transaction", match: :first

    fill_in "Display name", with: @bank_transaction.display_name
    fill_in "Name", with: @bank_transaction.name
    fill_in "Tags", with: @bank_transaction.tags
    fill_in "Value", with: @bank_transaction.value
    click_on "Update Transaction"

    assert_text "Transaction was successfully updated"
    click_on "Back"
  end

  test "should destroy Transaction" do
    visit bank_transaction_url(@bank_transaction)
    click_on "Destroy this transaction", match: :first

    assert_text "Transaction was successfully destroyed"
  end
end
