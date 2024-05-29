class DashboardsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    display_spaceships
    display_bookings
  end

  private

  def display_bookings
    if current_user
      @bookings = Booking.where(user_id: current_user.id)
      # raise
    end
  end

  def display_spaceships
    if current_user
      @spaceships = Spaceship.where(user_id: current_user.id)
    else
      @spaceships = Spaceship.all
      # render partial: 'spaceships/index', locals: { spaceships: @spaceships }
    end
  end

  def set_spaceship
    @spaceship = Spaceship.find(params[:id])
  end


end
