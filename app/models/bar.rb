class Bar < ApplicationRecord
  belongs_to :user
  has_many :bar_musics, dependent: :destroy
  has_many :events
  has_many :reviews, dependent: :destroy
  validates :name, :category, :description, :price, :address_street, :address_zipcode, :address_city, presence: true

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    return [address_street, address_zipcode, address_city].compact.join(', ')
  end

  def incoming_event
    self.events.where('date > ?', Time.now).order(date: :asc).first
  end

  def distance_from
    Geocoder::Calculations.distance_between(self.latitude, self.longitude, 46.53214628568322, 6.590972302445458)
  end
end
