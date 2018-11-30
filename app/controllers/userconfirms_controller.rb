class UserconfirmsController < ApplicationController

  before_action :set_user_detail

  def new
    @address     = Address.find_or_initialize_by(user_id: current_user.id)
  end

  def create
    @address = Address.find_by(user_id: current_user.id)
    if @user_detail.update(users_params)
      flash[:notice] = "変更しました"
      redirect_to new_user_userconfirm_path
    else
      render :new
    end
  end

  def set_user_detail
     @user_detail = UserDetail.find_or_initialize_by(user_id: current_user.id)
  end

  private
    def users_params
      params.require(:user_detail).permit(:birth_day,
      :birth_month,
      :birth_year)
      .merge(user_id: current_user.id,address_id: @address.id)
    end

end
