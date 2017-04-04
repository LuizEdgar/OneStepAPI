class VolunteersController < ApplicationController
  before_action :set_volunteer

  

  private
  def set_volunteer
    @volunteer = @auth_user.volunteer
  end

end