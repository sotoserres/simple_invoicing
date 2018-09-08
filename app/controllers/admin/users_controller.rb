class Admin::UsersController < Admin::BaseController
  load_and_authorize_resource :user

  def index
    @users = User.all.reorder(created_at: :desc)
  end

  def show
    respond_to do |format|
      format.html
    end
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = 'Successfully updated user ' + @user.email
      redirect_to admin_users_path
    else
      flash[:error] = 'Could not update user ' + @user.email + ' ' + @user.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    redirect_to :back
  end

  def switch_user
    return unless current_user.is_admin?
    sign_in :user, User.find(params[:user_id]), bypass: true
    redirect_to root_url # or user_root_url
  end

  def confirm
    @user.confirmed_at = Time.current
    @user.save(validate: false)
    redirect_to :back
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name)
  end
end
