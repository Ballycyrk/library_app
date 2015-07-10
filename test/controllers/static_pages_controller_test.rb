require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "PLCOE of Books"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | PLCOE of Books"
  end

  # test "should get login" do
  #   get :login
  #   assert_response :success
  #   assert_select "title", "Login | PLCOE of Books"
  # end

  test "should get catalog" do
    get :catalog
    assert_response :success
    assert_select "title", "Catalog | PLCOE of Books"
  end

  test "should get donate" do
    get :donate
    assert_response :success
    assert_select "title", "Donate | PLCOE of Books"
  end
end
