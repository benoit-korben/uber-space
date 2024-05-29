class SpaceshipsController < ApplicationController
  before_action :set_spaceship, only: [:show]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @spaceships = Spaceship.all
  end

  def show; end

  def new
    @spaceship = Spaceship.new
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    @spaceship.user = current_user
    if @spaceship.save
      redirect_to spaceship_path(@spaceship)
    else
      render :new
    end
  end

  def set_spaceship
    @spaceship = Spaceship.find(params[:id])
  end

  private

  def spaceship_params
    params.require(:spaceship).permit(:name, :fuel, :number_of_places, :price_per_day, :is_available, :photo)
  end
end
