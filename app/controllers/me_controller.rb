class MeController < ApplicationController
  skip_before_action :authenticate_user, only: [:sign_in]

  def sign_in
    @user = User.find_by_email(params[:email])

    if @user and @user.authenticate(params[:password])
      @auth_user = @user
      render :show
    else
      head :unauthorized
    end
  end

  def add_education
    @education = @auth_user.volunteer.educations.new(education_params)

    if @education.save
      render json: @education, status: :created
    else
      render json: @feed_item.errors, status: :unprocessable_entity
    end
  end

  private
  
  def education_params
    params.permit(:degree, :field, :activities, :description)
  end

end