class PostsController < ApplicationController
  def new
    # フォーム用の新規インスタンス
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: "投稿を作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content) # カラムは必要に応じて調整
  end
end