class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  STATUSES = ['I want to party!', 'I own the party!'].freeze

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bars, dependent: :destroy
  has_many :reviews

  validates :first_name, :last_name, :phone_number, :email, :nickname, :status, presence: true
  validates :phone_number, :email, :nickname, uniqueness: true
  validates :status, inclusion: { in: STATUSES }
end
