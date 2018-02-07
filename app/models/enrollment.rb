class Enrollment < ApplicationRecord
  belongs_to :student
  belongs_to :course
  has_many :assistances

  delegate :full_name, to: :student
  delegate :number, to: :student

  def assistance_for_test(test)
    assistances.select { |a| a.test == test }.first
  end
end
