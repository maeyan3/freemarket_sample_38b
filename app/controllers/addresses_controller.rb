class AddressesController < ApplicationController


  def index
     @address = Address.all

  end

  def new
    @prefectures = Prefecture.all
    @address = Address.new
    @address_id = Address.find(current_user.id)
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to new_address_path
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
    # binding.pry
    params.require(:address).permit(:first_name, :last_name, :first_name_reading, :last_name_reading, :postal_code, :city,:block, :prefecture_id).merge(user_id: current_user.id)
  end


end
