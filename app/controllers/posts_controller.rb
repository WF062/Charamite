class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create, :show, :edit, :update]
  before_action :set_post, only: [:show, :edit, :update]
  before_action :authorize_post, only: [:edit, :update]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.is_public = params[:visibility] == "公開"

    if @post.save
      if @post.is_public
        redirect_to @post, notice: "投稿を作成しました（公開）"
      else
        redirect_to @post, notice: "投稿を保存しました（非公開）"
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    if !@post.is_public && current_user != @post.user
      redirect_to root_path, alert: "この投稿を見る権限がありません"
    end
  end

  def edit
    # @post は set_post で読み込み済み
  end

  def update
    @post.is_public = params[:visibility] == "公開" if params[:visibility].present?

    if @post.update(post_params)
      redirect_to @post, notice: "投稿を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def authorize_post
    redirect_to root_path, alert: "この投稿を編集する権限がありません" unless @post.user == current_user
  end

  def post_params
    params.require(:post).permit(:title, :content, :name, :description, :background_color, :image, :tags)
  end
end