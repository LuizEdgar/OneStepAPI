class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show]

  # GET /organizations
  def index
    @organizations = Organization.all.page params[:page]
  end

  # GET /organizations/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

end
