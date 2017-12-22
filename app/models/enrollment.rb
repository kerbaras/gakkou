class Enrollment < ApplicationRecord
  belongs_to :student
  belongs_to :course

  delegate :full_name, to: :student
  delegate :number, to: :student
end
