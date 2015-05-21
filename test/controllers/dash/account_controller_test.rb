require 'test_helper'

class Dash::AccountControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
