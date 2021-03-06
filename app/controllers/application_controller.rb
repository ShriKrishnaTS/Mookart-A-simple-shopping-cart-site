class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def configure_permitted_parameters
    
    devise_parameter_sanitizer.for(:sign_up) do |user_params|
        user_params.permit( :name, :email, :password) 
  	end
  end
  def current_or_null_user
    if current_user == nil
      User.new
    else
      current_user
    end
  end
end