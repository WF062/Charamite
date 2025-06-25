class UsersController < ApplicationController
  before_action :require_login, only: [:show, :mypage, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      auto_login(@user)  # Sorceryで自動ログインさせる（任意）
      redirect_to root_path, notice: "アカウントを作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])

    @posts = if current_user == @user
               @user.posts.order(:created_at)
             else
               @user.posts.where(is_public: true).order(:created_at)
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

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー情報を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    # Sorceryでは password_confirmation は使わないので削除
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :bio,
      :icon
    )
  end
end