class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:username, :company_name, :company_domain, :password, :password_confirmation])

    devise_parameter_sanitizer.permit(:invite, keys: [:organization_id])

    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:username])

    devise_parameter_sanitizer.permit(:account_update,keys: [:username, :email, :password, :password_confirmation, :current_password])
  end

  def after_sign_in_path_for(resource)
      feeds_path
  end

end
