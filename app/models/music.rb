class Music < ApplicationRecord
  has_many :bar_musics
  validates :name, presence: true
  validates :name, inclusion: { in:
    ['French pop', '80s Music', '70s Music', 'Disco', 'Hip-Hop', 'Pop', 'Latino', 'Dance/Electro', 'Rock', 'Indie', 'Alternative', 'Classique', 'Jazz', 'Soul', 'RnB', 'Funk', 'Metal', 'Loundge Music'] }
end
