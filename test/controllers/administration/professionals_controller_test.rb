require 'test_helper'

class Administration::ProfessionalsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get for_approval" do
    get :for_approval
    assert_response :success
  end

end
