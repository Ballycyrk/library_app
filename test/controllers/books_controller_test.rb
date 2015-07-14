require 'test_helper'

class BooksControllerTest < ActionController::TestCase

  def setup
    @base_title = "PLCOE of Books"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "Donate | #{@base_title}"
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_select "title", "Catalog | #{@base_title}"
  end
end
