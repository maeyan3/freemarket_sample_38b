class AddressesController < ApplicationController
  def new
    @prefectures = Prefecture.all
  end

  def create

  end

  def edit
    # check_user
    @prefectures = Prefecture.all
  end

  def update

  end

  private
  def check_user
    redirect_to root_path if params[:user_id] != current_user.id
  end
end
