class UserconfirmsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @user_details = UserDetail.all

  end

  def new
    @users = UserDetail.new
    @address = Address.find(params[:address_id])
  end

  def create
    @address = Address.find(params[:address_id])
    @users = UserDetail.new(users_params)
    @users.save
    redirect_to new_address_userconfirm_path(@address)

  end

 private
    def users_params
      params.require(:user_detail).permit(:birth_day, :birth_month, :birth_year).merge(user_id: current_user.id,address_id: @address.id)
    end

    def move_to_index
      redirect_to action: :index unless current_user
    end
end
