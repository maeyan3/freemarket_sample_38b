class ProfilesController < ApplicationController
  before_action :profile_user_check

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    render :new unless @profile.save
  end

  private
  def profile_params
    params.require(:profile).permit(:profile_text).merge(user_id: current_user.id)
  end

  def profile_user_check
    redirect_to root_path if params[:user_id].to_i != current_user.id
  end
end
