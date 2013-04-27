require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :role => "Role",
      :udid => "Udid",
      :zip => "Zip",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Role/)
    rendered.should match(/Udid/)
    rendered.should match(/Zip/)
    rendered.should match(/Email/)
  end
end
