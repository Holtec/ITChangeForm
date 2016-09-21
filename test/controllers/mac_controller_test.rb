require 'test_helper'

class MacControllerTest < ActionController::TestCase
  
  test "should get redirected to email request form from mac/new" do
    get :new
    assert_response 302
  end
  
  test "should get redirected to email request form from mac/index" do
    get :index
    assert_response 302
  end
  
  test "should get MAC index" do
    session[:email] = "test@test.com"
    get :index
    assert_response :success
  end
  
  test "should get new MAC request form" do
    session[:email] = "test@test.com"
    get :new
    assert_response :success
  end

end
