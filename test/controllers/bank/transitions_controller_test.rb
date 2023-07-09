require "test_helper"

class Bank::TransitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bank_transition = bank_transitions(:one)
  end

  test "should get index" do
    get bank_transitions_url
    assert_response :success
  end

  test "should get new" do
    get new_bank_transition_url
    assert_response :success
  end

  test "should create bank_transition" do
    assert_difference("Bank::Transition.count") do
      post bank_transitions_url, params: { bank_transition: { display_name: @bank_transition.display_name, name: @bank_transition.name, origin_id: @bank_transition.origin_id, value: @bank_transition.value } }
    end

    assert_redirected_to bank_transition_url(Bank::Transition.last)
  end

  test "should show bank_transition" do
    get bank_transition_url(@bank_transition)
    assert_response :success
  end

  test "should get edit" do
    get edit_bank_transition_url(@bank_transition)
    assert_response :success
  end

  test "should update bank_transition" do
    patch bank_transition_url(@bank_transition), params: { bank_transition: { display_name: @bank_transition.display_name, name: @bank_transition.name, origin_id: @bank_transition.origin_id, value: @bank_transition.value } }
    assert_redirected_to bank_transition_url(@bank_transition)
  end

  test "should destroy bank_transition" do
    assert_difference("Bank::Transition.count", -1) do
      delete bank_transition_url(@bank_transition)
    end

    assert_redirected_to bank_transitions_url
  end
end
