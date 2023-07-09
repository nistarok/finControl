require "application_system_test_case"

class Bank::AccountsTest < ApplicationSystemTestCase
  setup do
    @bank_account = bank_accounts(:one)
  end

  test "visiting the index" do
    visit bank_accounts_url
    assert_selector "h1", text: "Accounts"
  end

  test "should create account" do
    visit bank_accounts_url
    click_on "New account"

    fill_in "Balance", with: @bank_account.balance
    fill_in "Description", with: @bank_account.description
    fill_in "Name", with: @bank_account.name
    click_on "Create Account"

    assert_text "Account was successfully created"
    click_on "Back"
  end

  test "should update Account" do
    visit bank_account_url(@bank_account)
    click_on "Edit this account", match: :first

    fill_in "Balance", with: @bank_account.balance
    fill_in "Description", with: @bank_account.description
    fill_in "Name", with: @bank_account.name
    click_on "Update Account"

    assert_text "Account was successfully updated"
    click_on "Back"
  end

  test "should destroy Account" do
    visit bank_account_url(@bank_account)
    click_on "Destroy this account", match: :first

    assert_text "Account was successfully destroyed"
  end
end
