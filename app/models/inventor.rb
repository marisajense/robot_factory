# == Schema Information
#
# Table name: inventors
#
#  id         :integer          not null, primary key
#  name       :string
#  age        :integer
#  hire_date  :date
#  speciality :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Inventor < ApplicationRecord
  has_many :robots, dependent: :destroy
  validates :name, :hire_date, presence: true
  validates :speciality, inclusion: {
    in: %w(software hardware education mad),
    message: "Not a valid specialty"
  }, allow_nil: true
end
