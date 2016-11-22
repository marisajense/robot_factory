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

  def info
      if speciality == 'software'
        "Software: #{name} was hired on: #{hire_date}"
      elsif speciality == 'hardware'
        "Hardware: #{name} was hired on: #{hire_date}"
      elsif speciality == 'education'
        "Education: #{name} was hired on: #{hire_date}"
      elsif speciality == 'mad'
        "Mad: #{name} was hired on: #{hire_date}"
      end
    end

  def self.by_name
    order(:name)
  end

  private
  def hire
    self.hire_date = Date.today
  end
end
