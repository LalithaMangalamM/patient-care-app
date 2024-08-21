class Patient < ApplicationRecord
  validates :email, presence: true
  validates :first_name, presence: true
  has_many :appointments
  has_many :doctors, through: :appointments
end
