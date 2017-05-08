class OppotunitiesController < ApplicationController
  before_action :set_oppotunity, only: [:show, :update, :destroy]

  # GET /oppotunities
  # GET /oppotunities.json
  def index
    @oppotunities = Oppotunity.all
  end

  # GET /oppotunities/1
  # GET /oppotunities/1.json
  def show
  end

  # POST /oppotunities
  # POST /oppotunities.json
  def create
    @oppotunity = Oppotunity.new(oppotunity_params)

    if @oppotunity.save
      render :show, status: :created, location: @oppotunity
    else
      render json: @oppotunity.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /oppotunities/1
  # PATCH/PUT /oppotunities/1.json
  def update
    if @oppotunity.update(oppotunity_params)
      render :show, status: :ok, location: @oppotunity
    else
      render json: @oppotunity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /oppotunities/1
  # DELETE /oppotunities/1.json
  def destroy
    @oppotunity.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oppotunity
      @oppotunity = Oppotunity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def oppotunity_params
      params.require(:oppotunity).permit(:title, :volunteers_number, :description, :time_commitment, :requirements, :opportunitable_id, :opportunitable_type)
    end
end
