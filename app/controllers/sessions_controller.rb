class SessionsController < Devise::SessionsController
  #   prepend_before_filter :require_no_authentication, only: [ :new, :create ]
  #   prepend_before_filter :allow_params_authentication!, only: :create
  #   prepend_before_filter :verify_signed_out_user, only: :destroy
  #   prepend_before_filter only: [ :create, :destroy ] { request.env["devise.skip_timeout"] = true }
  
  # POST /resource/sign_in
  def create
    if params[:commit] == 'Sign In as guest user'
      user = User.where(email: 'guest_account@example.com').first_or_initialize
      Rails.logger.debug('User ID for guest is: ')
      Rails.logger.debug(user.inspect)

      unless user.persisted?
        user.is_admin = true
        user.skip_confirmation!
        user.save!(validate: false)
      end

      Rails.logger.debug('Trying to sign in guest user!')
      if user
        sign_in user
        self.resource = warden.authenticate!(auth_options)
        set_flash_message(:notice, :signed_in) if is_flashing_format?
        sign_in(resource_name, resource)
        yield resource if block_given?
        redirect_to after_sign_in_path_for(user)
      else
        flash[:error] = 'No user found! ' + user.errors.full_messages.to_sentence
        redirect_to :back
      end
    else
      super
    end
  end
end
