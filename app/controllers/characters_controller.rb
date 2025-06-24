class CharactersController < ApplicationController
  before_action :require_login, only: [:new, :create, :show]

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    @character.user = current_user 
    @character.is_public = params[:visibility] == "公開" 

    if @character.save
      redirect_to character_path(@character)
    else
      render :new
    end
  end

  def show
    @character = Character.find(params[:id])

    unless @character.is_public || @character.user == current_user
      head :not_found
    end
  end

  private

  def character_params
    params.require(:character).permit(:name, :description, :tags, :background_color, :image)
  end
end