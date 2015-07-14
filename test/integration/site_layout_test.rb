require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

 test "site layout links" do
  get root_path
  assert_template 'static_pages/home'
  assert_select "a[href=?]", help_path
  assert_select "a[href=?]", catalog_path
  assert_select "a[href=?]", join_path
  assert_select "a[href=?]", donate_path
 end
end
