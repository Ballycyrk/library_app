require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invaild login information" do
    get join_path
    assert_no_difference 'User.count' do
      post users_path, user: { name: "",
                              email: "",
                              password:              "foo",
                              password_confirmation: "bar" }
    end
    assert_template 'users/new'
    assert_select 'div#error_explination'
    assert_select 'div.field_with_errors'
  end

  test "valid login information" do
    get join_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name:  "Connor Doyle",
                                            email: "connor@doyle.net",
                                            password:              "password",
                                            password_confirmation: "password" }
    end
    assert_template 'users/show'
    assert_not flash.empty?
  end
end
