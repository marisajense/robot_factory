require 'rails_helper'

RSpec.describe Inventor, type: :model do

 describe 'validations' do
   it { should validate_presence_of(:name) }
   it { should validate_presence_of(:hire_date) }
   it do
     should validate_inclusion_of(:speciality).
        in_array(['software', 'hardware', 'education', 'mad'])
   end
 end

 describe 'instance methods' do
    describe '#info' do
      it 'returns the software info message with name and hire date' do
        # setup code
        inventor = Inventor.create(name: 'test', hire_date: '2016-11-21', speciality: 'software')
        # assertion / expectation
        expect(inventor.info).to eq("Software: test was hired on: 2016-11-21")
      end
      it 'returns the hardware info message with name and hire date' do
        # setup code
        inventor = Inventor.create(name: 'test', hire_date: '2016-11-21', speciality: 'hardware')
        # assertion / expectation
        expect(inventor.info).to eq("Hardware: test was hired on: 2016-11-21")
      end
      it 'returns the education info message with name and hire date' do
        # setup code
        inventor = Inventor.create(name: 'test', hire_date: '2016-11-21', speciality: 'education')
        # assertion / expectation
        expect(inventor.info).to eq("Education: test was hired on: 2016-11-21")
      end
      it 'returns the mad info message with name and hire date' do
        # setup code
        inventor = Inventor.create(name: 'test', hire_date: '2016-11-21', speciality: 'mad')
        # assertion / expectation
        expect(inventor.info).to eq("Mad: test was hired on: 2016-11-21")
      end
    end
  end

  describe 'class methods' do
    describe '.by_name' do
      it 'returns the inventors ordered by name' do
      # setup code
      i1 = Inventor.create(name: 'Marisa', speciality: 'mad', hire_date: '2016-11-21')
      i2 = Inventor.create(name: 'Ryan', speciality: 'education', hire_date: '2016-11-21')
      i3 = Inventor.create(name: 'William', speciality: 'software', hire_date: '2016-11-21')

      # assertion / expectation code
      by_name = Inventor.all.by_name
      expect(by_name[0].name).to eq(i1.name)
      expect(by_name[1].name).to eq(i2.name)
      expect(by_name[2].name).to eq(i3.name)
      end
    end
  end

end
