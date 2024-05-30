class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.spaceship = Spaceship.find(params[:spaceship_id])
    @favorite.save
    redirect_to spaceship_path(@favorite.spaceship)
  end

  def destroy
    current_user.favorites.each do |favorite|
      if favorite.spaceship == Spaceship.find(params[:spaceship_id])
        favorite.destroy
        redirect_to spaceship_path(favorite.spaceship)
      end
    end
  end
end
