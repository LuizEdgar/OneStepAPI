class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate_user

  def authenticate_user
    authenticate_or_request_with_http_token do |token, options|
      @auth_user = User.find_by(auth: token)
    end
  end
  
end
