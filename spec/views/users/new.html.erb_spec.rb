require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :role => "MyString",
      :udid => "MyString",
      :zip => "MyString",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_role[name=?]", "user[role]"
      assert_select "input#user_udid[name=?]", "user[udid]"
      assert_select "input#user_zip[name=?]", "user[zip]"
      assert_select "input#user_email[name=?]", "user[email]"
    end
  end
end
