require 'rails_helper'

RSpec.describe Test, type: :model do
  before do
    @course = Course.new from: Date.new(2012, 3, 1), to: Date.new(2012, 7, 1)
    @test = Test.new title: 'My first test',
                     date: Date.new(2012, 5, 1),
                     min: 9,
                     max: 10
    @test.course = @course
  end

  it 'Should be invalid without a title' do
    test.title = nil
    expect(course.valid?).to eq false
  end

  it 'Should have a score rank' do
    test.min = 0
    expect(course.valid?).to eq false
  end

  it 'Should have a valid score rank' do
    test.min = 10
    test.max = 5
    expect(course.valid?).to eq false
  end

  it 'Should have a valid date' do
    test.date = Date.new(2012, 2, 1)
    expect(course.valid?).to eq false
  end
end
