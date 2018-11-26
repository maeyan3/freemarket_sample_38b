class AddressesController < ApplicationController


  def index
     @address = Address.all

  end

  def new
    @prefectures = Prefecture.all
    @address = Address.find_or_initialize_by(user_id: current_user.id)
  end

  def create
    @address = Address.find_or_initialize_by(user_id: current_user.id)
    @address.update(address_params)

    flash[:notice] = "変更しました"
    redirect_to new_user_address_path


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

  def address_params

    params.require(:address).permit(:first_name, :last_name, :first_name_reading, :last_name_reading, :postal_code, :city,:block, :prefecture_id).merge(user_id: current_user.id)
  end


end
