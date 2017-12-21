require 'rails_helper'

RSpec.describe Student, type: :model do
  before do
    @student = Student.new name: 'Name',
                           lastname: 'Lastname',
                           identification: 39_831_249,
                           number: '13714/0'
  end

  it 'should be invalid without a name' do
    @student.name = nil
    expect(@student.valid?).to eq false
  end

  it 'should be invalid without a lastname' do
    @student.lastname = nil
    expect(@student.valid?).to eq false
  end

  it 'should have an unique identification' do
    Student.create name: 'Name2', lastname: 'Lastname',
                   identification: 39_831_249, number: '13714/1'
    expect(@course.valid?).to eq false
  end

  it 'should have an unique number' do
    Student.create name: 'Name2', lastname: 'Lastname',
                   identification: 39_831_248, number: '13714/0'
    expect(@course.valid?).to eq false
  end

  it 'should have a valid number' do
    @course.number = '14/'
    expect(@course.valid?).to eq false
    @course.number = '/0'
    expect(@course.valid?).to eq false
  end
end
