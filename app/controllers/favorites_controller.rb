class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.user = current_user
    authorize @favorite

    if @favorite.save
      flash[:notice] = "Favorited."
      redirect_to @favorite.favorable
    else
      flash[:error] = "Favorite failed."
      redirect_to :back
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:favorable_type, :favorable_id)
  end
end
