class SpaceshipsController < ApplicationController
  before_action :set_spaceship, only: [:show]

  def index
    @spaceships = Spaceship.all
  end

  def show; end

  private

  def set_spaceship
    @spaceship = Spaceship.find(params[:id])
  end

  private

  def spaceship_params
    params.require(:spaceship).permit(:name, :fuel, :number_of_places, :price_per_day, :is_available, :photo)
  end
end
