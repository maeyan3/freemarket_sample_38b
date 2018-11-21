class ProfilesController < ApplicationController
  before_action :profile_user_check

  def edit
    @user = current_user
  end

  def create
    @user = current_user(profile_params)
    render :new unless @profile.update
  end

  private
  def profile_params
    params.require(:user).permit(:nickname, :profile)
  end

  def profile_user_check
    redirect_to root_path if params[:user_id].to_i != current_user.id
  end
end
