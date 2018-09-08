class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!, unless: :no_user_authentication

  # Ensure every controller authorizes resource or skips authorization (skip_authorization_check)
  check_authorization unless: :devise_controller?
  skip_authorization_check #only: [:abc]
  after_action :prepare_unobtrusive_flash#, only: :abc

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :save_return_to

  rescue_from CanCan::AccessDenied do |exception|
    if !current_user
      message = 'Please sign in to use the app.'
    else
      message = 'Access Denied'
      logger.debug "User: #{current_user.email}: #{exception.message} for action: #{exception.action} on #{exception.subject}"
    end

    flash[:error] = message
    redirect_to root_path
  end

  def redirect_to_back_or(path)
    if request.env['HTTP_REFERER']
      redirect_to :back
    else
      redirect_to path
    end
  end

  def no_user_authentication
    devise_controller? || controller_name == 'home' || controller_name == 'pdfs' || controller_name == 'errors'
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  protected

  def save_return_to
    return unless request.get?
    if request.path != '/user/' && !request.xhr?
      session[:return_to] = request.fullpath
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
