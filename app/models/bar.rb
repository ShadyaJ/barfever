class Bar < ApplicationRecord
  belongs_to :user
  validates :name, :category, :description, :price, :music_style, :address_street, :adress_zipcode, :address_city, presence: true
  validates :category, inclusion: { in:
    ['Bar', 'Pub', 'Nightclub', 'Loundge', 'Beach Bar', 'Champagne Bar', 'Cocktail Bar', 'Shot Bar', 'Beer Bar', 'Shisha Bar', 'Sports Bar', 'Gay Bar', 'Concert hall', 'Karaoke Bar', 'Rooftop'] }
  validates :music_style, inclusion: { in:
    ['French pop', '80s Music', '70s Music', 'Disco', 'Hip-Hop', 'Pop', 'Latino', 'Dance/Electro', 'Rock', 'Indie', 'Alternative', 'Classique', 'Jazz', 'Soul', 'RnB', 'Funk', 'Metal', 'Loundge Music'] }
end
