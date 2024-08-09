class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :username, :address, :phone_number, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :username, :address, :phone_number, :password, :current_password])
  end
end
