class Notification < ApplicationRecord
  belongs_to :booking

  scope :unread, -> { where(read: false) }
end
