class OpportunitiesController < ApplicationController
  before_action :set_opportunity, only: [:show, :update, :destroy]

  # GET /opportunities
  # GET /opportunities.json
  def index
    @opportunities = Opportunity.all
  end

  # GET /opportunities/1
  # GET /opportunities/1.json
  def show
  end

  # POST /opportunities
  # POST /opportunities.json
  def create
    @opportunity = @auth_user.opportunities.new(opportunity_params)
      
    if @opportunity.save
      render :show, status: :created, location: @opportunity
    else
      render json: @opportunity.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /opportunities/1
  # PATCH/PUT /opportunities/1.json
  def update
    if @opportunity.update(opportunity_params)
      render :show, status: :ok, location: @opportunity
    else
      render json: @opportunity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /opportunities/1
  # DELETE /opportunities/1.json
  def destroy
    @opportunity.destroy
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_opportunity
      @opportunity = Opportunity.find(params[:id])
    end

    def opportunity_params
      params.permit(:title,
                    :volunteers_number, 
                    :description, 
                    :time_commitment, 
                    :others_requirements,
                    :is_ongoing, 
                    :is_virtual, 
                    :start_at,
                    :end_at,
                    :start_date_set, 
                    :end_date_set, 
                    :start_time_set, 
                    :end_time_set, 
                    :others_requirements, 
                    :tags, 
                    {images_attributes_64: []},
                    {skill_ids: []},
                    {cause_ids: []}, 
                    contact_attributes: [ :id, :name, :phone, :email, :_destroy], 
                    images_attributes: [ :id, :_destroy], 
                    location_attributes: [ :id, :name, :address_1, :address_2, :city, :state, :country, :postcode, :google_places_id, :_destroy]
                    )
    end

end