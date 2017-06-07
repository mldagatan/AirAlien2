require 'test_helper'

class ProfessionalsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get become_a_professional" do
    get :become_a_professional
    assert_response :success
  end

  test "should get pending" do
    get :pending
    assert_response :success
  end

end
