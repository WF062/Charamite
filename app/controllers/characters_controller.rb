class CharactersController < ApplicationController
  before_action :require_login, only: [:new, :create, :show] # Sorceryが使える前提

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    @character.user = current_user # ← 作成ユーザーを紐づける
    @character.is_public = params[:visibility] == "公開" # ← 日本語に修正

    if @character.save
      redirect_to character_path(@character)
    else
      render :new
    end
  end

  def show
    @character = Character.find(params[:id])

    # 公開されていない場合、自分のキャラ以外なら404にする
    unless @character.is_public || @character.user == current_user
      head :not_found
    end
  end

  private

  def character_params
    params.require(:character).permit(:name, :description, :tags, :background_color, :image)
  end
end