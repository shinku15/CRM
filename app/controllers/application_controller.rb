class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :company_name, :company_domain, :password, :password_confirmation])

    devise_parameter_sanitizer.permit(:invite, keys: [:organization_id])
  end

  def after_sign_in_path_for(resource)
      staticpages_show_path
  end
end
