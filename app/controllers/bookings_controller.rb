class BookingsController < ApplicationController
  before_action :set_spaceship, only: [:new, :create]
  before_action :set_booking, only: [:update]

  def index
    @bookings = Booking.order(:status)
  end

  def update
    @booking.update(booking_params)
    redirect_to bookings_path
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.spaceship = @spaceship
    @booking.user = current_user
    if @booking.save!
      redirect_to bookings_path, notice: 'Booking was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_spaceship
    @spaceship = Spaceship.find(params[:spaceship_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :status, :end_date, :user_id, :spaceship_id)
  end
end
