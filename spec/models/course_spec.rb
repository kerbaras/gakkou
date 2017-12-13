require 'rails_helper'

RSpec.describe Course, type: :model do
  before do
    @course = Course.new
  end

  it 'should not be two courses at the same year' do
    Course.create year: 2011
    @course.year = 2011
    expect(@course.valid?).to eq false
  end

  it 'should be invalid without a year' do
    expect(@course.valid?).to eq false
  end

  it 'should have a valid year' do
    @course.year = 'hola'
    expect(@course.valid?).to eq(false)
    @course.year = 11
    expect(@course.valid?).to eq(false)
    @course.year = 2015
    expect(@course.valid?).to eq(true)
  end
end
