class UserconfirmsController < ApplicationController

  before_action :set_user_detail,:move_to_index, except: :index

  def index
    @user_detail = UserDetail.all

  end

  def new
    @address     = Address.find_or_initialize_by(user_id: current_user.id)
  end

  def create
    @address = Address.find_by(user_id: current_user.id)
    @user_detail.update(users_params)
    render :new
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

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
