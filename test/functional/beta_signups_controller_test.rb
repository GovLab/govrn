require 'test_helper'

class BetaSignupsControllerTest < ActionController::TestCase
  setup do
    @beta_signup = beta_signups(:one)
  end

  test "should create beta_signup" do
    assert_difference('BetaSignup.count') do
      post :create, beta_signup: { email: @beta_signup.email }
    end

    assert_redirected_to beta_signup_path(assigns(:beta_signup))
  end
end
