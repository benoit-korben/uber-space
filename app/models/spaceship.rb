class Spaceship < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_one_attached :main_image
  has_many_attached :secondary_images
  has_many :favorites, dependent: :destroy

  validate :validate_secondary_images_count

  validates :name, presence: true
  validates :description, presence: true
  validates :price_per_day, presence: true
  validates :number_of_places, presence: true
  validates :fuel, presence: true
  validates :main_image, presence: true

  private

  def validate_secondary_images_count
    if secondary_images.count < 4 || secondary_images.count > 7
      errors.add(:secondary_images, "should be between 4 and 7")
    end
  end
end
