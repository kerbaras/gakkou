# A course for the subject where the students will be able to
# enroll and sign up for tests
# it should only be one per year
class Course < ApplicationRecord
  validates :from, presence: true
  validates :to, presence: true
end
