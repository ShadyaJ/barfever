class Booking < ApplicationRecord
  belongs_to :bar
  belongs_to :user
  has_many :friends, dependent: :destroy
  validates :date, presence: true
end
