class ProfilesController < ApplicationController
  before_action :profile_user_check

  def edit
  end

  def update
    current_user.nickname = profile_params[:nickname]
    current_user.profile = profile_params[:profile]
    if current_user.save(context: :edit_profile)
      flash[:notice] = "変更しました"
      redirect_to user_profile_path
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
