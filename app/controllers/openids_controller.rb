class OpenidsController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource through: :user

  def destroy
    if @openid.destroy
      flash[:notice] = 'Openid deleted successfully.'
    else
      flash[:error] = 'Could not delete openid.' + @openid.errors.full_messages.to_sentence
    end

    redirect_to :back
  end
end
