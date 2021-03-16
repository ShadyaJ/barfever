class Bar < ApplicationRecord
  belongs_to :user
  has_many :bar_musics
  validates :name, :category, :description, :price, :address_street, :address_zipcode, :address_city, presence: true
end
