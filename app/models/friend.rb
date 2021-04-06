class Friend < ApplicationRecord
  belongs_to :booking
  validates :first_name, :last_name, presence: true
end
