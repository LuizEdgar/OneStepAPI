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
    @opportunity = Opportunity.new(opportunity_params)

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

    # Never trust parameters from the scary internet, only allow the white list through.
    def opportunity_params
      params.require(:opportunity).permit(:title, :volunteers_number, :description, :time_commitment, :requirements, :opportunitable_id, :opportunitable_type)
    end
end
