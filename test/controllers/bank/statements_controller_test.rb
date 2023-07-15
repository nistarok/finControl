require "test_helper"

class Bank::StatementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bank_statement = bank_statements(:one)
  end

  test "should get index" do
    get bank_statements_url
    assert_response :success
  end

  test "should get new" do
    get new_bank_statement_url
    assert_response :success
  end

  test "should create bank_statement" do
    assert_difference("Bank::Statement.count") do
      post bank_statements_url, params: { bank_statement: { closed: @bank_statement.closed, closing_reference: @bank_statement.closing_reference, closing_value: @bank_statement.closing_value, wallet_id: @bank_statement.wallet_id } }
    end

    assert_redirected_to bank_statement_url(Bank::Statement.last)
  end

  test "should show bank_statement" do
    get bank_statement_url(@bank_statement)
    assert_response :success
  end

  test "should get edit" do
    get edit_bank_statement_url(@bank_statement)
    assert_response :success
  end

  test "should update bank_statement" do
    patch bank_statement_url(@bank_statement), params: { bank_statement: { closed: @bank_statement.closed, closing_reference: @bank_statement.closing_reference, closing_value: @bank_statement.closing_value, wallet_id: @bank_statement.wallet_id } }
    assert_redirected_to bank_statement_url(@bank_statement)
  end

  test "should destroy bank_statement" do
    assert_difference("Bank::Statement.count", -1) do
      delete bank_statement_url(@bank_statement)
    end

    assert_redirected_to bank_statements_url
  end
end
