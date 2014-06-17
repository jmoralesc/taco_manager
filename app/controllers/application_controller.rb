# Controller for Aplication's management
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :avatar
    devise_parameter_sanitizer.for(:sign_up) << :username
    sanitize_params
  end

  def sanitize_params
    devise_parameter_sanitizer.for(:sign_up) do |u| u.permit(
      :username, :email, :password, :password_confirmation, :avatar,
      :remember_me)
    end
    devise_parameter_sanitizer.for(:sign_in) do |u| u.permit(
      :login, :username, :email, :password, :remember_me)
    end
    devise_parameter_sanitizer.for(:account_update) do |u| u.permit(
      :username, :email, :password, :password_confirmation, :current_password)
    end
  end
end
