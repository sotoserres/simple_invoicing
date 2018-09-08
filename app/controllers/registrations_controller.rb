class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def edit
    @openids = Openid.where(user_id: current_user.id).order(:provider)
    @current_password = current_user.password
    super
  end

  def update
    @openids = Openid.where(user_id: current_user.id).order(:provider)

    @user = User.find(current_user.id)

    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
      params[:user].delete(:current_password)

      if @user.update_without_password(registration_params)
        flash[:notice] = 'Your changes have been successfully saved!'
        redirect_to root_path
      else
        flash[:error] = 'Could not save changes. ' + @user.errors.full_messages.to_sentence
        render :edit
      end
    else
      super
    end
  end

  def new
    build_resource(sign_up_params)
    yield resource if block_given?
    respond_with resource
  end

  def create
    build_resource(sign_up_params)

    if resource.save
      resource.set_up_free_time
      Mailbot.new_sign_up_email(resource).deliver_later
    end
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end


  private

  def registration_params
    params.require(:user).permit(:email, :first_name, :last_name)
  end

  protected

  def after_update_path_for(resource)
    edit_user_registration_path(resource)
  end

  def after_sign_up_path_for(_resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])

    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])

    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation,
                                                       :name, :first_name, :last_name])
  end
end
