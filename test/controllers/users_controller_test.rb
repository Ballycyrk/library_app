require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @base_title = "PLCOE of Books"
  end

  test "should get new" do
    get :new
    assert_response :success
     assert_select "title", "Join | #{@base_title}"
  end
end
