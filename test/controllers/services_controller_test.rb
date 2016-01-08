require 'test_helper'

class ServicesControllerTest < ActionController::TestCase
  test "should get delete" do
    get :delete
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

end
