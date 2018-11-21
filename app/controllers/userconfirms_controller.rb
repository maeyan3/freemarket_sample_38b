class UserconfirmsController < ApplicationController
  def new

  end

  def create
     Users.create(user_params[:name],birthday:user_params[:birthday], address: tweet_params[:address])

  end

 private
    def users_params
      params.permit(:name, :birthday, :address)
    end
end
