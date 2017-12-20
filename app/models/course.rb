# A course for the subject where the students will be able to
# enroll and sign up for tests
# it should only be one per year
class Course < ApplicationRecord
  validates :from, presence: true
  validates :to, presence: true
  validates :from, :to, overlap: true
  validate :valid_lapse

  def valid_lapse
    errors.add(:from, 'must be less than the end') if
      !from.nil? &&
      !to.nil? &&
      from >= to
  end

  delegate :year, to: :from

  def period
    (from - to).month
  end
end
