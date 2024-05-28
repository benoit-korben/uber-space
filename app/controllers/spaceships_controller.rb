class SpaceshipsController < ApplicationController
  def index
    @spaceships = Spaceship.all
  end

  def show
  end

  private

  def spaceship_params
    params.require(:spaceship).permit(:name, :fuel, :number_of_places, :price_per_day, :is_available, :photo)
  end
end
