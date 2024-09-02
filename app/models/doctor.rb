class Doctor < ApplicationRecord
  validates :first_name, presence: true
  validates :email, presence: true
  has_many :appointments
  has_many :patients, through: :appointments
end
