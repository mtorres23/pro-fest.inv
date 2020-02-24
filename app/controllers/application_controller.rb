class ApplicationController < ActionController::Base
  before_action :set_api_key
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery prepend: true
  before_action :set_account




  def settings
    puts "this is settings"
    @user = current_user
  end

  def home
    @nomodal = true
  end


private

def set_account
  @account = Account.first
  if current_user
    @account = Account.find(current_user.account_id)
  end
  # To-do: update so there is always an account
  user =  User.where(account_id: @account.id)
end

protected
  def set_api_key
    google_api_key = Rails.application.secrets.google_maps_api_key
    @google_api_url = "https://maps.googleapis.com/maps/api/js?key=" + google_api_key + "&callback=initMap"

  end

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:account_id, :pin_number, :permission_level])
  end
end

