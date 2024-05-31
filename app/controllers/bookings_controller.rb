class BookingsController < ApplicationController
  before_action :set_spaceship, only: [:new, :create]
  before_action :set_booking, only: [:update]
  before_action :authenticate_user!, only: %i[new create update]

  def index
    @bookings = Booking.order(:status)
  end

  def update
    #<ActionController::Parameters {"id"=>"901", "controller"=>"bookings",
    #"action"=>"update", "booking"=>{"id"=>"901"}} permitted: false>
    # debugger
    @booking.status = Booking.statuses[params[:status]]

    if @booking.save!
      @notification = Notification.create!(booking: @booking, read: false)
      respond_to do |format|
        format.html { redirect_to dashboards_path }
        format.json # Follows the classic Rails flow and look for a create.json view
      end
    else
      render template: "dashboards/index", status: :unprocessable_entity
    end
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.spaceship = @spaceship
    @booking.user = current_user
    @booking.status = 0
    if @booking.save
      redirect_to dashboards_path, notice: 'Booking was successfully created.'
    else
      render template: "spaceships/show", status: :unprocessable_entity
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
    params.require(:booking).permit(:start_date, :status, :end_date, :user_id, :spaceship_id, :message)
  end
end
