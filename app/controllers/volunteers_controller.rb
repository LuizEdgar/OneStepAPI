class VolunteersController < ApplicationController
  before_action :set_volunteer, only: [:show]

  # GET /volunteers
  def index
    @volunteers = Volunteer.all.page params[:page]

  end

  # GET /volunteers/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volunteer
      @volunteer = Volunteer.find(params[:id])
    end

end