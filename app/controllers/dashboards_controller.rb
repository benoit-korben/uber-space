class DashboardsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    if current_user
      @bookings = Booking.where(user_id: current_user.id).in_order_of(:status, Booking.statuses.keys)
      @seller_bookings = Booking.joins(:spaceship).where(spaceships: { user_id: current_user.id }).in_order_of(:status, Booking.statuses.keys)
      @pending_bookings = @seller_bookings.where(status: "pending")
      @confirmed_bookings = @seller_bookings.where(status: "finished")
      @cancelled_bookings = @seller_bookings.where(status: "cancelled")
      @booked_bookings = @seller_bookings.where(status: "booked")

    end
    @spaceships = current_user ? Spaceship.where(user_id: current_user.id) : []
  end


end
