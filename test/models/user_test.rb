require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Big Bang", email: "theory@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "name should be more than 2 and less than 50 characters" do
    @user.name = "A"
    assert_not @user.valid?
    @user.name = "A" * 51
    assert_not @user.valid?
  end

  test "name validation should accept valid names" do
    valid_names = ["Colin McKenna", "Jesica", "C j Sapong"]
    valid_names.each do |valid_name|
      @user.name = valid_name
      assert @user.valid?, "Name #{valid_name.inspect} should be valid"
    end
  end

  test "name validation should reject invalid names" do
    invalid_names = ["C", "Jesic@", "C_j_Sapong"]
    invalid_names.each do |invalid_name|
      @user.name = invalid_name
      assert_not @user.valid?, "Name #{invalid_name.inspect} should be invalid"
    end
  end

  test "email should be present" do
    @user.email = "   "
    assert_not @user.valid?
  end

  test "email validation should accept valid emails" do
    valid_emails = %w(colin@gmail.com jesica.avellone@ix.netflix.com
                    g_a_c@example.ie)
    valid_emails.each do |valid_email|
      @user.email = valid_email
      assert @user.valid?, "Email #{valid_email.inspect} should be valid"
    end
  end

  test "email validation should reject invalid emails" do
    invalid_emails = %w(greg@.com coin.mckenna@ jesica@g_mail.com foo@bar..com)
    invalid_emails.each do |invalid_email|
      @user.email = invalid_email
      assert_not @user.valid?, "#{invalid_email.inspect} should be invalid"
    end
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password must be of a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "email address should be saved as lowercase"  do
    mixed_email = "FoObAr@eXamPLe.CoM"
    @user.email = mixed_email
    @user.save
    assert_equal mixed_email.downcase, @user.email
  end
end
