class ProfilesController < ApplicationController
  before_action :profile_user_check

  def edit
  end

  def update
    @user = current_user
    @user.nickname = profile_params[:nickname]
    @user.profile = profile_params[:profile]
    if @user.save(context: :edit_profile)
      render :edit
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
