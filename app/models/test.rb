class Test < ApplicationRecord
  belongs_to :course
  has_many :assistances

  validates :date, presence: true
  validates :date, uniqueness: { scope: :course }
  validates :title, presence: true
  validates :course, presence: true
  validates :min, presence: true
  validates :min, numericality: { only_integer: true, greater_than: 0 }
  validates :max, presence: true
  validates :max, numericality: { only_integer: true, greater_than: :min }
  validate :date_lapse

  def date_lapse
    errors.add(:date, "must be in the course") if 
      !course.nil? &&
      !((course.from .. course.to) === date)
  end
end
