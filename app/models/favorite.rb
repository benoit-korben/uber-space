class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :spaceship

  validates :user_id, uniqueness: { scope: :spaceship_id, message: "has already favorited this spaceship" }
end
