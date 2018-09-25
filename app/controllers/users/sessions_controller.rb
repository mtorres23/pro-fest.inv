class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # # GET /resource/sign_in
  # def new
  #   super
  # end

  # # POST /resource/sign_in
  # def create
  #   super
  # end

  # # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # # protected

  # # # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    @user = User.find_by(email: params[:user][:email])
    @user_location = Location.find(@user.location_id)
    devise_parameter_sanitizer.permit(:sign_in).merge(location_id: @user.location_id)
  end
end
