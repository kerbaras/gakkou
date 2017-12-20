require 'rails_helper'

RSpec.describe Course, type: :model do
  before do
    @course = Course.new
  end

  it 'should not overlap with other course' do
    Course.create! from: Date.new(2011, 1, 1), end: Date.new(2011, 6, 1)
    @course.from = Date.new(2011, 5, 1)
    @course.to = Date.new(2011, 7, 1)
    expect(@course.valid?).to eq false
  end

  it 'should be invalid without a from date' do
    @course.to = Date.new(2011, 7, 1)
    expect(@course.valid?).to eq false
  end

  it 'should be invalid without an end date' do
    @course.from = Date.new(2011, 5, 1)
    expect(@course.valid?).to eq false
  end

  it 'should have a valid lapse' do
    @course.to = Date.new(2011, 5, 1)
    @course.from = Date.new(2011, 7, 1)
    expect(@course.valid?).to eq(false)

    @course.from = Date.new(2011, 5, 1)
    @course.to = Date.new(2011, 7, 1)
    expect(@course.valid?).to eq(true)
  end
end
