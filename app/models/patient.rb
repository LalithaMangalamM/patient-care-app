class Patient < ApplicationRecord
  validates :email, presence: true
  validates :first_name, presence: true
end
