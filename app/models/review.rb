class Review < ApplicationRecord
  validates :rating, presence: true
  validates :user, uniqueness: { scope: :bar, message: "You already rated the bar!" }
  belongs_to :user
  belongs_to :bar
end
