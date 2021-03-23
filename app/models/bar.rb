class Bar < ApplicationRecord
  belongs_to :user
  has_many :bar_musics
  has_many :events
  has_many :reviews, dependent: :destroy
  validates :name, :category, :description, :price, :address_street, :address_zipcode, :address_city, presence: true

  def incoming_event
    self.events.where('date > ?', Time.now).order(date: :asc).first
  end
end
