class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :custom_param_devise, if: :devise_controller?
  def custom_param_devise
    devise_parameter_sanitizer.permit(:sign_up, keys: [:photo])
  end
end
