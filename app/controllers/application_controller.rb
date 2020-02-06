class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery prepend: true
  before_action :set_account


  def set_account
    user =  User.find(current_user.id)
    @account = Account.first
    if !current_user
      @account= Account.find(current_user.id)
    end

  end

protected

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:client_id, :account_id, :pin_number, :permissions])
  end
end

