class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery prepend: true
  before_action :set_client
 

  def set_client
    client =  Client.first
    @client= Client.find(client.id)
  end

protected

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:client_id])
  end
end

