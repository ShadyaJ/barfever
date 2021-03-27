class Music < ApplicationRecord
  has_many :bar_musics, dependent: :destroy
  validates :name, presence: true
end
