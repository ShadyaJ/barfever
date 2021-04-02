class Bar < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :bar_musics, dependent: :destroy
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
    "#{Geocoder::Calculations.distance_between([self.latitude, self.longitude], [46.53214628568322, 6.590972302445458]).round(1)} km"
  end

  def average_rating
    if !self.reviews.empty?
      average_user_array = []
      self.reviews.each do |review|
        average_user_array << ((review.review_experience.to_f + review.review_drink.to_f + review.review_music.to_f)/3)
      end
      sum = 0
      average_user_array.each do |number|
        sum += number
      end
      (sum/(self.reviews.count)).round(0)
    else
      "no ratings"
    end
  end

  def blank_stars
    5 - average_rating.to_i
  end
end
