class HomeController < ApplicationController
  before_action :require_login

  def top
  end

  def index
  end

  private

  def require_login
    unless session[:user_id]
      redirect_to login_path, alert: "ログインしてください"
    end
  end
end