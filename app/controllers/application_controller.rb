class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :basic_auth, if: :production?

  private
  def production?
    Rails.env.production?
  end

  def development?
    Rails.env.development?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == "root" && password == "1234"
    end
  end
end
