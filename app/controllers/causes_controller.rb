class CausesController < ApplicationController
  before_action :set_cause, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user

  # GET /causes
  # GET /causes.json
  def index
    @causes = Cause.all.order(:id).page params[:page]
  end

  # GET /causes/1
  # GET /causes/1.json
  def show
  end

  # POST /causes
  # POST /causes.json
  def create
    @cause = Cause.new(cause_params)

    if @cause.save
      render :show, status: :created, location: @cause
    else
      render json: @cause.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /causes/1
  # PATCH/PUT /causes/1.json
  def update
    if @cause.update(cause_params)
      render :show, status: :ok, location: @cause
    else
      render json: @cause.errors, status: :unprocessable_entity
    end
  end

  # DELETE /causes/1
  # DELETE /causes/1.json
  def destroy
    @cause.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cause
      @cause = Cause.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cause_params
      params.permit(:name, :description, :image_64)
    end
end
