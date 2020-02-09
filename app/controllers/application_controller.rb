class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery prepend: true
  before_action :set_account




  def settings
    puts "this is settings"
    @user = current_user
  end


private

def set_account
  @account = Account.first
  if current_user
    @account = Account.find(current_user.account_id)
  end
  user =  User.where(account_id: @account.id)
end

protected

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:account_id, :pin_number, :permissions])
  end
end

