class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]
  def new

  end

  def logout

  end

  def mypage

  end

end
