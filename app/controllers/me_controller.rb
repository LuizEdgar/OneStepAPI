class MeController < ApplicationController
  skip_before_action :authenticate_user, only: [:sign_in, :facebook_sign_in]

  def sign_in
    @user = User.find_by_email(params[:email])

    if @user and @user.authenticate(params[:password])
      @auth_user = @user
      render :show
    else
      head :unauthorized
    end
  end

  def facebook_sign_in
    
    begin
      @user = User.find_by_facebook_token(params[:facebook_token])

      if @user
        @auth_user = @user
        render :show
      else
        head :not_found
      end

    rescue Koala::Facebook::AuthenticationError => e
      head :unauthorized
    end

  end

  def contacts
    @contacts = @auth_user.contacts
  end

  def locations
    @locations = @auth_user.locations
  end

  def causes
    @causes = @auth_user.causes
  end

  def skills
    @skills = @auth_user.skills
  end

  private
  
  def education_params
    params.permit(:degree, :field, :activities, :description)
  end

end