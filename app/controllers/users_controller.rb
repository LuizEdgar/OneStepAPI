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
        params.permit(:kind,
                      :username, 
                      :email, 
                      :password, 
                      volunteer_attributes: 
                        [ :name,
                          :about, 
                          :occupation, 
                          :birth_at, 
                          :gender, 
                          :period_availability, 
                          :volunteered, 
                          :cpf, 
                          :rg, 
                          :verified, 
                          {skill_ids: []}, 
                          {cause_ids: []}, 
                          contacts_attributes: [ :name, :phone, :email], 
                          locations_attributes: [ :name, :address_1, :address_2, :city, :state, :country, :postcode, :google_places_id]
                        ]
                      )
      when "organization"
        params.permit(:kind,
                      :username, 
                      :email, 
                      :password, 
                      organization_attributes: 
                        [ :name,
                          :cnpj, 
                          :site, 
                          :about, 
                          :mission, 
                          :size, 
                          :established_at, 
                          {skill_ids: []}, 
                          {cause_ids: []}, 
                          contacts_attributes: [ :name, :phone, :email], 
                          locations_attributes: [ :name, :address_1, :address_2, :city, :state, :country, :postcode, :google_places_id]
                        ]
                      )
      end
    end

    def update_user_params
      case @user.kind
      when "volunteer"
        params.permit(:username, 
                      :email, 
                      :password, 
                      volunteer_attributes: 
                        [ :id, 
                          :name,
                          :about, 
                          :occupation, 
                          :birth_at, 
                          :gender, 
                          :period_availability, 
                          :volunteered, 
                          :cpf, 
                          :rg, 
                          :verified, 
                          {skill_ids: []}, 
                          {cause_ids: []}, 
                          contacts_attributes: [ :id, :name, :phone, :email, :_destroy],
                          locations_attributes: [ :id, :name, :address_1, :address_2, :city, :state, :country, :postcode, :google_places_id, :_destroy]
                        ]
                      )
      when "organization"
        params.permit(:username, 
                      :email, 
                      :password, 
                      organization_attributes: 
                        [ :id, 
                          :name,
                          :cnpj, 
                          :site, 
                          :about, 
                          :mission, 
                          :size, 
                          :established_at, 
                          {skill_ids: []}, 
                          {cause_ids: []}, 
                          contacts_attributes: [ :id, :name, :phone, :email, :_destroy], 
                          locations_attributes: [ :id, :name, :address_1, :address_2, :city, :state, :country, :postcode, :google_places_id, :_destroy]
                        ]
                      )
      end
    end
end
