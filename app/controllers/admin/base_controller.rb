module Admin
  class BaseController < ApplicationController
    before_action :verify_user_admin

    def verify_user_admin
      if current_user.nil?
        redirect_to new_user_session_path
        return false
      end
      unless current_user.is_admin
        raise CanCan::AccessDenied.new('Sorry, you cannot see this yet!')
      end
    end
  end
end
