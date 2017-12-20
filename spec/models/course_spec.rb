require 'rails_helper'

RSpec.describe Course, type: :model do
  before do
    @course = Course.new
  end

  it 'should not overlap with other course' do
    Course.create! start: Date.new(2011, 1, 1), end: Date.new(2011, 6, 1)
    @course.start = Date.new(2011, 5, 1)
    @course.end = Date.new(2011, 7, 1)
    expect(@course.valid?).to eq false
  end

  it 'should be invalid without a start date' do
    @course.end = Date.new(2011, 7, 1)
    expect(@course.valid?).to eq false
  end

  it 'should be invalid without an end date' do
    @course.start = Date.new(2011, 5, 1)
    expect(@course.valid?).to eq false
  end

  it 'should have a valid lapse' do
    @course.end = Date.new(2011, 5, 1)
    @course.start = Date.new(2011, 7, 1)
    expect(@course.valid?).to eq(false)

    @course.start = Date.new(2011, 5, 1)
    @course.end = Date.new(2011, 7, 1)
    expect(@course.valid?).to eq(true)
  end
end
