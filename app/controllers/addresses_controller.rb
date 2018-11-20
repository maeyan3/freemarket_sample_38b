class AddressesController < ApplicationController
  def new
    @prefectures = Prefecture.all
  end

  def create

  end

  def edit
    @prefectures = Prefecture.all
  end

  def update

  end

end
