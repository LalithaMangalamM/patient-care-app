class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  validates :doctor_id, presence: true
end
