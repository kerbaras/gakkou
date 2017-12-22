require 'rails_helper'

RSpec.describe Student, type: :model do
  before do
    @student = Student.new name: 'Name',
                           lastname: 'Lastname',
                           identification: 39_831_249,
                           number: '13714/0',
                           email: 'name@lastname.co.uk'
  end

  it 'should be invalid without a name' do
    @student.name = nil
    expect(@student.valid?).to eq false
  end

  it 'should be invalid without a lastname' do
    @student.lastname = nil
    expect(@student.valid?).to eq false
  end

  it 'should be invalid without an email' do
    @student.email = nil
    expect(@student.valid?).to eq false
  end

  it 'should have an unique identification' do
    Student.create name: 'Name2', lastname: 'Lastname',
                   identification: 39_831_248, number: '13714/0',
                   email: 'name2@lastname.co.uk'
    expect(@student.valid?).to eq false
  end

  it 'should have an unique number' do
    Student.create name: 'Name2', lastname: 'Lastname',
                   identification: 39_831_248, number: '13714/0',
                   email: 'name2@lastname.co.uk'
    expect(@student.valid?).to eq false
  end

  it 'should have an unique email' do
    Student.create name: 'Name2', lastname: 'Lastname',
                   identification: 39_831_248, number: '13714/1',
                   email: 'name@lastname.co.uk'
    expect(@student.valid?).to eq false
  end

  it 'should have a valid number' do
    @student.number = '14/'
    expect(@student.valid?).to eq false
    @student.number = '/0'
    expect(@student.valid?).to eq false
  end

  it 'should have a valid email' do
    expect(@student.valid?).to eq true
    @student.email = 'a@'
    expect(@student.valid?).to eq false
    @student.number = '@gmail.com'
    expect(@student.valid?).to eq false
  end
end
