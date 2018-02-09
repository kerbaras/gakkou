require 'rails_helper'

RSpec.describe Test, type: :model do
  before do
    @course = Course.new from: Date.new(2012, 3, 1), to: Date.new(2012, 7, 1)
    @test = Test.new title: 'My first test',
                     date: Date.new(2012, 5, 1),
                     min: 9,
                     max: 10
    @test.course = @course
    10.times { @course.enrollments.new }
    5.times do
      e = @course.enrollments.new
      @test.assistances.new grade: 1, enrollment: e
    end
    5.times do
      e = @course.enrollments.new
      @test.assistances.new grade: 10, enrollment: e
    end
  end

  it 'Should be invalid without a title' do
    @test.title = nil
    expect(@test.valid?).to eq false
  end

  it 'Should have a score rank' do
    @test.min = 0
    expect(@test.valid?).to eq false
  end

  it 'Should have a valid score rank' do
    @test.min = 10
    @test.max = 5
    expect(@test.valid?).to eq false
  end

  it 'Should have a valid date' do
    @test.date = Date.new(2012, 2, 1)
    expect(@test.valid?).to eq false
  end

  it 'should know when a grade has passed' do
    expect(@test.approved?(1)).to eq false
    expect(@test.approved?(10)).to eq true
  end

  it 'should know the ammount of approvals' do
    expect(@test.approved_ammount).to eq 5.to_f
  end

  it 'should know the ammount of failures' do
    expect(@test.fail_ammount).to eq 5.to_f
  end

  it 'should know the ammount of absents' do
    expect(@test.absent_ammount).to eq 10.to_f
  end

  it 'should know the porcentage of approvals' do
    expect(@test.porcent_approved).to eq 50.to_f
  end
end
