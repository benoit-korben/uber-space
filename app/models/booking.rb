class Booking < ApplicationRecord
  belongs_to :spaceship
  belongs_to :user
  validates :message, presence: true, length: { minimum: 10 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  def end_date_cannot_be_before_start_date
    if end_date.present? && start_date.present? && end_date < start_date
      errors.add(:end_date, "cannot be before start date")
    end
  end

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

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, 'must be after the start date')
    end
  end
end
