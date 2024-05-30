class Spaceship < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_one_attached :main_image
  has_many_attached :secondary_images

  validate :validate_secondary_images_count

  private

  def validate_secondary_images_count
    if secondary_images.count < 4 || secondary_images.count > 7
      errors.add(:secondary_images, "should be between 4 and 7")
    end
  end
end
