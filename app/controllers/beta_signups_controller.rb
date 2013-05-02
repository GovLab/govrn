class BetaSignupsController < ApplicationController
  # POST /beta_signups
  # POST /beta_signups.json
  def create
    @beta_signup = BetaSignup.new(params[:beta_signup])

    respond_to do |format|
      if @beta_signup.save
        flash[:notice] = "Signed up!  You'll hear from us soon."

        format.html { redirect_to root_path, notice: 'Beta signup was successfully created.' }
        format.json { render json: @beta_signup, status: :created, location: @beta_signup }
      else
        format.html { render controller: 'home', action: 'index' }
        format.json { render json: @beta_signup.errors, status: :unprocessable_entity }
      end
    end
  end
end
