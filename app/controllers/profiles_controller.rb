class ProfilesController < ApplicationController
  before_action :profile_user_check

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_columns(nickname: profile_params[:nickname], profile: profile_params[:profile])
      redirect_to  "/users/#{current_user.id}/profile"
    else
      render :edit
    end
  end

  private
  def profile_params
    params.require(:user).permit(:nickname, :profile)
  end

  def profile_user_check
    redirect_to root_path if params[:user_id].to_i != current_user.id
  end
end
