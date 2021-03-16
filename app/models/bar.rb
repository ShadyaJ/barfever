class Bar < ApplicationRecord
  belongs_to :user
  has_many :bar_musics
  has_many :reviews, dependent: :destroy
  validates :name, :category, :description, :price, :address_street, :address_zipcode, :address_city, presence: true
  validates :category, inclusion: { in:
    ['Bar', 'Pub', 'Nightclub', 'Lounge', 'Beach Bar', 'Champagne Bar', 'Cocktail Bar', 'Shot Bar', 'Beer Bar', 'Shisha Bar', 'Sports Bar', 'Gay Bar', 'Concert hall', 'Karaoke Bar', 'Rooftop'] }
end
