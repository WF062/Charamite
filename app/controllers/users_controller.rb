class UsersController < ApplicationController
  before_action :require_login, only: [:show, :mypage]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "アカウントを作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])

    if current_user == @user
      @posts = @user.posts.order(:created_at)
    else
      @posts = @user.posts.where(is_public: true).order(:created_at)
    end

    @post_data = @posts.map do |p|
      {
        name: p.name,
        image_url: p.image.attached? ? url_for(p.image) : nil,
        is_public: p.is_public
      }
    end

    @active_index = params[:index].to_i
  end

  def mypage
    redirect_to user_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end