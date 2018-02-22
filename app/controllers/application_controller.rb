class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  # before_action :configure_permitted_parameters, if: :devise_controller?
  #
  # protected
  #
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age])
  # end
  def after_sign_in_path_for(resource)
    if user_signed_in?
    user_url(resource)
  elsif company_signed_in?
    company_url(resource)
    end
  end

end
