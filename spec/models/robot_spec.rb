require 'rails_helper'

RSpec.describe Robot, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:serial_number) }
    it do
      should validate_inclusion_of(:industry).
      in_array(['education', 'war', 'service', 'novelty'])
    end
  end

  describe 'instance methods' do
    describe '#info' do
      it 'returns the education message with name and industry and serial number' do
        robot = Robot.create(name: 'test', industry: 'education', serial_number: '123')
        expect(robot.info).to eq("Education: test has purpose: education and serial: 123")
      end
      it 'returns the war message with name and industry and serial number' do
        robot = Robot.create(name: 'test', industry: 'war', serial_number: '123')
        expect(robot.info).to eq("War: test has purpose: war and serial: 123")
      end
      it 'returns the service message with name and industry and serial number' do
        robot = Robot.create(name: 'test', industry: 'service', serial_number: '123')
        expect(robot.info).to eq("Service: test has purpose: service and serial: 123")
      end
      it 'returns the novelty message with name and industry and serial number' do
        robot = Robot.create(name: 'test', industry: 'novelty', serial_number: '123')
        expect(robot.info).to eq("Novelty: test has purpose: novelty and serial: 123")
      end
    end
  end

  describe 'class methods' do
    describe '.by_robot' do
      it 'returns the robots ordered by name' do
      # setup code
      i = Inventor.create(name: 'Marisa', speciality: 'mad', hire_date: '2016-11-21')
      r1 = Robot.create(name: 'Anna', industry: 'novelty', serial_number: '123', inventor_id: i.id)
      r2 = Robot.create(name: 'Belda', industry: 'war', serial_number: '124', inventor_id: i.id)
      r3 = Robot.create(name: 'Xena', industry: 'service', serial_number: '125', inventor_id: i.id)

      # assertion / expectation code
      by_robot = Robot.all.by_robot
      expect(by_robot[0].name).to eq(r1.name)
      expect(by_robot[1].name).to eq(r2.name)
      expect(by_robot[2].name).to eq(r3.name)
      end
    end
  end
end
