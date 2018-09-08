class UsersController < ApplicationController
  load_and_authorize_resource

  # GET /users/1
  # Possibly useless action/code
  def show
    @user = current_user
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User updated successfully'
    else
      flash[:error] = "Couldn't update user: #{@user.errors.full_messages.join('. ')}."
      render :edit
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
