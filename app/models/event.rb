class Event < ApplicationRecord
  belongs_to :bar
  validates :name, :category, :description, :date, presence: true
  validates :category, inclusion: { in:
    ['Promotion', 'Live Music', 'Music Theme', 'Karaoke', 'Gay Night', 'Live event'] }
end
