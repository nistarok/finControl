require "test_helper"

class Bank::TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bank_transaction = bank_transactions(:one)
  end

  test "should get index" do
    get bank_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_bank_transaction_url
    assert_response :success
  end

  test "should create bank_transaction" do
    assert_difference("Bank::Transaction.count") do
      post bank_transactions_url, params: { bank_transaction: { display_name: @bank_transaction.display_name, name: @bank_transaction.name, tags: @bank_transaction.tags, value: @bank_transaction.value } }
    end

    assert_redirected_to bank_transaction_url(Bank::Transaction.last)
  end

  test "should show bank_transaction" do
    get bank_transaction_url(@bank_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_bank_transaction_url(@bank_transaction)
    assert_response :success
  end

  test "should update bank_transaction" do
    patch bank_transaction_url(@bank_transaction), params: { bank_transaction: { display_name: @bank_transaction.display_name, name: @bank_transaction.name, tags: @bank_transaction.tags, value: @bank_transaction.value } }
    assert_redirected_to bank_transaction_url(@bank_transaction)
  end

  test "should destroy bank_transaction" do
    assert_difference("Bank::Transaction.count", -1) do
      delete bank_transaction_url(@bank_transaction)
    end

    assert_redirected_to bank_transactions_url
  end
end
