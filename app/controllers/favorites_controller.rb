class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.new(favorite_params)
    #params not working. do i need a nother field?
    @new_favorite = Favorite.new
    authorize @favorite

    if @favorite.save
      flash[:notice] = "Favorited."
      redirect_to root_path
      #how do I redirect back to what was favorited? or just not redirect?
    else
      flash[:error] = "Favorite failed."
      redirect_to root_path
    end

  end

  private

  def favorite_params
    params.require(:favorite).permit(:favorable_type, :favorable_id)
  end
end
