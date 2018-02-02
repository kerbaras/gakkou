class Test < ApplicationRecord
  belongs_to :course

  validates :date, precence: true
  validates :date, uniqueness: { scope: :course }
  validates :title, precence: true
  validates :course, precence: true

  validate do
    errors.add(:date, :invalid) if course.isNull? &&
                                   course.from <= date <= course.end
  end
end
