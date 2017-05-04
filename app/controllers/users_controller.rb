class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user, only: [:create]

  # GET /users
  def index
    @users = User.all.page params[:page]
  end

  # GET /users/1
  def show
    # render json: @user
    render :show
  end

  # POST /users
  def create
    @user = User.new(create_user_params)

    if params[:facebook_token]
      
      begin
        graph = Koala::Facebook::API.new(params[:facebook_token])
        facebook_user_id = graph.get_object('me')["id"]

        @existing_user = User.find_by_facebook_id(facebook_user_id)

        if @existing_user
          @user = @existing_user
          render :show
          return
        else
          @user.facebook_id = facebook_user_id  
        end
        
      rescue Koala::Facebook::AuthenticationError => e
        head :unauthorized
        return
      end

    end

    if @user.save
      render :show, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
    
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(update_user_params)
      render :show
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def create_user_params
      case params[:kind]
      when "volunteer"
        params.permit(:name, :username, :email, :kind, :password, volunteer_attributes: [:about, :occupation, :birth_at, :gender, :day_availability, :period_availability, :volunteered, :cpf, :rg, :verified, {skill_ids: []}, {cause_ids: []} ], locations_attributes: [ :address_1, :address_2, :city, :state, :country, :postcode ], phones_attributes: [ :number, :kind])
      when "organization"
        params.permit(:name, :username, :email, :kind, :password, organization_attributes: [:cnpj, :site, :about, :mission, :size, :established_at, {skill_ids: []}, {cause_ids: []}], locations_attributes: [ :address_1, :address_2, :city, :state, :country, :postcode ], phones_attributes: [ :number, :kind])
      end
    end

    def update_user_params
      case @user.kind
      when "volunteer"
        params.permit(:name, :username, :email, :password, volunteer_attributes: [:id, :about, :occupation, :birth_at, :gender, :day_availability, :period_availability, :volunteered, :cpf, :rg, :verified, {skill_ids: []}, {cause_ids: []} ], locations_attributes: [:id,  :address_1, :address_2, :city, :state, :country, :postcode, :_destroy], phones_attributes: [:id,  :number, :kind, :_destroy])
      when "organization"
        params.permit(:name, :username, :email, :password, organization_attributes: [:id, :cnpj, :site, :about, :mission, :size, :established_at, {skill_ids: []}, {cause_ids: []}], locations_attributes: [:id,  :address_1, :address_2, :city, :state, :country, :postcode, :_destroy], phones_attributes: [:id,  :number, :kind, :_destroy])
      end
    end
end
