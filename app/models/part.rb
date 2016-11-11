# == Schema Information
#
# Table name: parts
#
#  id         :integer          not null, primary key
#  name       :string
#  number     :integer
#  robot_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Part < ApplicationRecord
  belongs_to :robot
  validates :name, :number, presence: true
  validates :name, :number, uniqueness: true
end
