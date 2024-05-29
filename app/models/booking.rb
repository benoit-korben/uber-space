class Booking < ApplicationRecord
  belongs_to :spaceship
  belongs_to :user

  enum status: {
    pending: 0,
    booked: 1,
    finished: 2,
    cancelled: 3,
    refused: 4
  }

  ASSOCIATED_BUTTONS = {
    pending: [{text: "Confirm", classes: "btn btn-success", status:"booked"}, {text: "Refuse", classes: "btn btn-danger", status:"refused"}],
    booked: [{text: "Cancel", classes: "btn btn-danger", status:"cancelled"}],
    finished: [],
    cancelled: [],
    refused: []
  }

  def associated_buttons_status
    ASSOCIATED_BUTTONS[status.to_sym] || []
  end
end
