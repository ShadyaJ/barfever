class Review < ApplicationRecord
  validates :review_experience, :review_drink, :review_music, presence: true
  validates :user, uniqueness: { scope: :bar, message: "You already rated the bar!" }
  belongs_to :user
  belongs_to :bar
end
