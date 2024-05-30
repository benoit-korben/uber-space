class DashboardsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    if current_user
      @bookings = Booking.where(user_id: current_user.id)
      @pending_bookings = @bookings.where(status: "pending")
      @confirmed_bookings = @bookings.where(status: "finished")
      @cancelled_bookings = @bookings.where(status: "cancelled")
      @booked_bookings = @bookings.where(status: "booked")

    end
    @spaceships = current_user ? Spaceship.where(user_id: current_user.id) : []
  end


end
