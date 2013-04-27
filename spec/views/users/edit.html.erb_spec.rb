require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :role => "MyString",
      :udid => "MyString",
      :zip => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      assert_select "input#user_role[name=?]", "user[role]"
      assert_select "input#user_udid[name=?]", "user[udid]"
      assert_select "input#user_zip[name=?]", "user[zip]"
      assert_select "input#user_email[name=?]", "user[email]"
    end
  end
end
