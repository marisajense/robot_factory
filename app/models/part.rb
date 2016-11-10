class Part < ApplicationRecord
  belongs_to :robot
  validates :name, :number, presence: true
  valudates :name, :number, uniqueness: true
end
