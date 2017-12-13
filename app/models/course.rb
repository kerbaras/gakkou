# A course for the subject where the students will be able to
# enroll and sign up for tests
# it should only be one per year
class Course < ApplicationRecord
  validates :year, presence: true
  validates :year, uniqueness: true
  validates :year, format: { with: /\A[1-9]\d{3}\z/ }
end
