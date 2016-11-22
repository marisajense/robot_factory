require 'rails_helper'

RSpec.describe Part, type: :model do

 describe 'validations' do
   it { should validate_presence_of(:name) }
   it { should validate_presence_of(:number) }
   end

   describe 'class methods' do
     describe '.by_part' do
       it 'returns the parts ordered by name' do
       # setup code
       i = Inventor.create(name: 'Marisa', speciality: 'mad', hire_date: '2016-11-21')
       r = Robot.create(name: 'Anna', industry: 'novelty', serial_number: '123', inventor_id: i.id)
       p1 = Part.create(name: 'Axel', number: 1, robot_id: r.id)
       p2 = Part.create(name: 'Bolt', number: 2, robot_id: r.id)
       p3 = Part.create(name: 'Screw', number: 3, robot_id: r.id)

       # assertion / expectation code
       by_part = Part.all.by_part
       expect(by_part[0].name).to eq(p1.name)
       expect(by_part[1].name).to eq(p2.name)
       expect(by_part[2].name).to eq(p3.name)
       end
     end
   end
 end
