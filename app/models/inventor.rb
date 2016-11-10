class Inventor < ApplicationRecord
  has_many :robots
  validates :name, :hire_date, presence: true
  validates :speciality, inclusion: {
    in: %w(software hardware education mad),
    message: "Not a valid specialty"
  }, allow_nil: true
end
