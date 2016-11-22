# == Schema Information
#
# Table name: robots
#
#  id            :integer          not null, primary key
#  name          :string
#  serial_number :string
#  evil          :boolean
#  color         :string
#  industry      :string
#  inventor_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Robot < ApplicationRecord
  has_many :parts, dependent: :destroy
  belongs_to :inventor
  validates :name, :serial_number, presence: true
  validates :name, :serial_number, uniqueness: true
  validates :industry, inclusion: {
    in: %w(education war service novelty),
    message: "Nope!"
  }, allow_nil: true


  def info
    if industry == 'education'
      "Education: #{name} has purpose: #{industry} and serial: #{serial_number}"
    elsif industry == 'war'
      "War: #{name} has purpose: #{industry} and serial: #{serial_number}"
    elsif industry == 'service'
      "Service: #{name} has purpose: #{industry} and serial: #{serial_number}"
    elsif industry == 'novelty'
      "Novelty: #{name} has purpose: #{industry} and serial: #{serial_number}"
    end
  end

private
  def generate_serial_number
    self.serial_number = '123'
  end

  def self.by_robot
    order(:name)
  end
end
