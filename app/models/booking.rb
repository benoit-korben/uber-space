class Booking < ApplicationRecord
  belongs_to :spaceship
  belongs_to :user

  enum status: {
    pending: 0,
    booked: 1,
    finished: 2,
    cancelled: 3
  }
end
