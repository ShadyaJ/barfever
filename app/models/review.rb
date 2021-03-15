class Review < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  belongs_to :bar, optional: true
end
