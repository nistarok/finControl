require "test_helper"

class VariableIncomesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @variable_income = variable_incomes(:one)
  end

  test "should get index" do
    get variable_incomes_url
    assert_response :success
  end

  test "should get new" do
    get new_variable_income_url
    assert_response :success
  end

  test "should create variable_income" do
    assert_difference("VariableIncome.count") do
      post variable_incomes_url, params: { variable_income: { mode: @variable_income.mode, name: @variable_income.name, trade_date: @variable_income.trade_date, value: @variable_income.value } }
    end

    assert_redirected_to variable_income_url(VariableIncome.last)
  end

  test "should show variable_income" do
    get variable_income_url(@variable_income)
    assert_response :success
  end

  test "should get edit" do
    get edit_variable_income_url(@variable_income)
    assert_response :success
  end

  test "should update variable_income" do
    patch variable_income_url(@variable_income), params: { variable_income: { mode: @variable_income.mode, name: @variable_income.name, trade_date: @variable_income.trade_date, value: @variable_income.value } }
    assert_redirected_to variable_income_url(@variable_income)
  end

  test "should destroy variable_income" do
    assert_difference("VariableIncome.count", -1) do
      delete variable_income_url(@variable_income)
    end

    assert_redirected_to variable_incomes_url
  end
end
