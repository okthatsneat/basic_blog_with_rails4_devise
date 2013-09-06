class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    [:sign_in, :sign_up].each do |action|
      devise_parameter_sanitizer.for(action) { |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me) }
    end
  end

end
